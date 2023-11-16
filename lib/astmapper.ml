(*
  Current Notes:

  A Pstr_value seems to be a function/top level binding
   - It has a recursive flag and the value bindings within the function
*)

open Asttypes (*Used for recursive flags*)

let recursive_flag flag =
  match flag with Nonrecursive -> "nonrecursive" | Recursive -> "recursive"

let parse_ident (ident : Longident.t) =
  (* Temp *)
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

(* https://v2.ocaml.org/api/compilerlibref/Parsetree.html#TYPEpattern *)
let parse_binding_pattern (pattern : Parsetree.pattern) e =
  match pattern.ppat_desc with
  | Ppat_any ->
      Ast.Assignment { aname = "_"; value = e } (* The pattern is '_' *)
  | Ppat_var loc -> Ast.Assignment { aname = loc.txt; value = e }
  | _ -> Ast.Unknown

let rec parse_expression (expression : Parsetree.expression) =
  match expression.pexp_desc with
  | Pexp_apply (e, l) ->
      let params = List.map (fun (_, exp) -> parse_expression exp) l in
      Ast.FuncCall
        { ident = Ast.to_string (parse_expression e); cparameters = params }
  (* https://v2.ocaml.org/api/compilerlibref/Longident.html#TYPEt *)
  | Pexp_ident ident -> Ast.Identifier (parse_ident ident.txt)
  | Pexp_constant const -> parse_constant const
  | _ -> Ast.Unknown

(* https://v2.ocaml.org/api/compilerlibref/Parsetree.html#TYPEvalue_binding *)
let value_binding (binding : Parsetree.value_binding) =
  let exp = parse_expression binding.pvb_expr in
  let transformed_value_binding = parse_binding_pattern binding.pvb_pat exp in
  (* This is now a valid Luau AST object *)
  transformed_value_binding

(* Pstr_value of Asttypes.rec_flag * value_binding list *)
let handle_value flag binding_list =
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
  let renders = List.map Renderer.render luau_ast in
  List.iter print_endline renders
