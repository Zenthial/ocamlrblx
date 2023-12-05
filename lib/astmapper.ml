(*
  This module takes in a parsed OCaml AST and outputs a valid Luau AST
  The goal is to map all valid OCaml representations to valid Luau representations
    - Attributes/ppx extensions will probably not map to valid luau
*)

open Asttypes (*Used for recursive flags*)

let recursive_flag flag =
  match flag with Nonrecursive -> "nonrecursive" | Recursive -> "recursive"

let parse_ident (ident : Longident.t) =
  (* Temp, eventually need to handle the three potential Longident.t variants *)
  let i = Longident.last ident in
  match Stdlib_map.ocaml_to_luau i with Some v -> v | None -> i

(* match ident with *)
(* | Lident s -> Ast.Identifier s *)
(* |  *)

(* https://v2.ocaml.org/api/compilerlibref/Parsetree.html#TYPEconstant *)
let parse_constant (const : Parsetree.constant) =
  match const with
  | Pconst_integer (s, c_opt) | Pconst_float (s, c_opt) ->
      let num_str =
        match c_opt with Some c -> s ^ String.make 1 c | None -> s
      in
      Ast.Literal (Ast.Number num_str)
  | Pconst_char c -> Ast.Literal (Ast.String (String.make 1 c))
  | Pconst_string (s, _, _) -> Ast.Literal (Ast.String s)

(* let parse_pattern (pattern : Parsetree.pattern) = *)
(*   match pattern.ppat_desc with *)
(*   (* | Ppat_any -> Ast.Assignment *) *)
(*   | _ -> Ast.Unknown *)

let rec unwrap_func_def def =
  match def with
  | Ast.FuncDef d ->
      let p = d.dparameters in
      let ps, definition =
        if List.length d.statements = 1 then
          unwrap_func_def (List.nth d.statements 0)
        else ([], d.statements)
      in
      (List.append p ps, definition)
  | Ast.Block b -> ([], b)
  | _ -> ([], [ def ])

(* https://v2.ocaml.org/api/compilerlibref/Parsetree.html#TYPEpattern *)
let parse_binding_pattern (pattern : Parsetree.pattern) e =
  match pattern.ppat_desc with
  | Ppat_any ->
      Ast.Assignment { aname = "_"; value = e } (* The pattern is '_' *)
  | Ppat_var loc ->
      let var =
        match e with
        | Ast.FuncDef def ->
            let params, def = unwrap_func_def (Ast.FuncDef def) in
            Ast.Func
              {
                fn_name = loc.txt;
                local = false;
                definition = { dparameters = params; statements = def };
              }
        | _ -> Ast.Assignment { aname = loc.txt; value = e }
      in
      var
  | _ -> Ast.Unknown

let parse_condition_pattern (pattern : Parsetree.pattern) =
  match pattern.ppat_desc with
  | Ppat_any -> Ast.Identifier "_"
  | Ppat_var loc -> Ast.Identifier loc.txt
  | Ppat_constant c -> parse_constant c
  (* See pattern docs for more detail
     Construct holds ty, which is the type we're matching on,
     and a list option of the different paramters that type might hold.
     For a Some("yo") type, this would be Ppat_construct (Some, Some[(_, "yo")])
  *)
  (* | Ppat_construct (ty, vals_opt) -> Ast.Unknown *)
  | _ -> Ast.Unknown

let pattern_val_to_string (pat : Parsetree.pattern) =
  match pat.ppat_desc with Ppat_var loc -> loc.txt | _ -> assert false

let rec parse_expression (expression : Parsetree.expression) =
  (* https://v2.ocaml.org/api/compilerlibref/Parsetree.html#TYPEexpression_desc *)
  match expression.pexp_desc with
  | Pexp_apply (e, l) ->
      let params = List.map (fun (_, exp) -> parse_expression exp) l in
      let i = Ast.to_string (parse_expression e) in
      let application =
        match Binop_map.ocaml_to_luau i with
        | Some op ->
            assert (List.length params = 2);
            (* A bin op with more than two params is impossible *)
            let left = List.nth params 0 in
            let right = List.nth params 1 in
            Ast.BinExp (left, op, right)
        | None -> Ast.FuncCall { ident = i; cparameters = params }
      in
      application
  (* https://v2.ocaml.org/api/compilerlibref/Longident.html#TYPEt *)
  | Pexp_ident ident -> Ast.Identifier (parse_ident ident.txt)
  | Pexp_constant const -> parse_constant const
  (* The function documentation, listed above, is quite good. The first two arguments of the tuple are label and expression option. These are for a labeled function argument and a default expression for the label. Not handling these immediately. The others are the pattern and expression, which correspond to the syntax `let f P = E` where the pattern is the argument, and the expression is the function *)
  | Pexp_fun (_, _, pat, exp) ->
      let argument_name = pattern_val_to_string pat in
      let exp = parse_expression exp in
      let statements =
        match exp with Ast.Block e_list -> e_list | _ -> [ exp ]
      in
      Ast.FuncDef { dparameters = [ argument_name ]; statements }
  | Pexp_let (_, binding_list, tail_expression) ->
      let bindings = List.map value_binding binding_list in
      let exp = parse_expression tail_expression in
      let tail = match exp with Ast.Block e_list -> e_list | _ -> [ exp ] in
      Ast.Block (List.append bindings tail)
  | Pexp_match (match_e, cases) ->
      let mapped_e = parse_expression match_e in

      let rec find_default (cs : Parsetree.case list) acc =
        match cs with
        | c :: cs' ->
            if c.pc_lhs.ppat_desc = Parsetree.Ppat_any then
              (Some c.pc_rhs, List.append cs' acc)
            else find_default cs' (c :: acc)
        | _ -> (None, acc)
      in

      let default, cases = find_default cases [] in
      let cs =
        List.map
          (fun (c : Parsetree.case) ->
            ( Ast.BinExp (mapped_e, Ast.Eq, parse_condition_pattern c.pc_lhs),
              parse_expression c.pc_rhs ))
          cases
      in
      let default = Option.map (fun o -> parse_expression o) default in
      Ast.Match { default_case = default; cases = cs }
  | _ -> Ast.Unknown

(* https://v2.ocaml.org/api/compilerlibref/Parsetree.html#TYPEvalue_binding *)
and value_binding (binding : Parsetree.value_binding) =
  let exp = parse_expression binding.pvb_expr in
  let transformed_value_binding = parse_binding_pattern binding.pvb_pat exp in
  (* This is now a valid Luau AST object *)
  transformed_value_binding

(* Pstr_value of Asttypes.rec_flag * value_binding list *)
and handle_value flag binding_list =
  let _ = recursive_flag flag in
  (* We do not care about the recursive_flag when transpiling to luau *)
  let luau_binding_ast = value_binding (List.hd binding_list) in
  luau_binding_ast

(* https://v2.ocaml.org/api/compilerlibref/Parsetree.html#TYPEstructure_item_desc *)
let structure_item (item : Parsetree.structure_item) =
  match item.pstr_desc with
  | Pstr_value (rec_flag, value_binding_list) ->
      handle_value rec_flag value_binding_list
  | _ -> Ast.Unknown

let map structure =
  let luau_ast = List.map structure_item structure in
  luau_ast
