open Format
open Ast

type top_level_funcs =
  { amount : int
  ; func_strs : string list
  }

let render_literal literal =
  match literal with
  | Number n -> n
  | Nil -> "nil"
  | True -> "true"
  | False -> "false"
  | String s -> sprintf "\"%s\"" s
;;

let render_bin_op op =
  match op with
  | Add -> "+"
  | Sub -> "-"
  | Mul -> "*"
  | Div -> "/"
  | Pow -> "^"
  | Mod -> "%"
  | Concat -> ".."
  | And -> "and"
  | Or -> "or"
  | Lt -> "<"
  | Gt -> ">"
  | Le -> "<="
  | Ge -> ">="
  | Eq -> "=="
  | Ne -> "~="
;;

let render_un_op op =
  (* Not has a trailing space because it needs it *)
  match op with
  | Not -> "not "
  | Pound -> "#"
  | Negate -> "-"
;;

let render_parameters params = String.concat ", " params

let rec render_expression ident expression top_level_funcs =
  match expression with
  | Literal l -> render_literal l, None
  | Assignment a ->
    (* let old = Ident.get_level ident in *)
    (* Ident.set ident 0; *)
    top_level_funcs := { amount = 0; func_strs = [] };
    let assignment, return_override = render_expression ident a.value top_level_funcs in
    let assignment = String.trim assignment ^ "\n" in
    let top_level = String.concat "\n" !top_level_funcs.func_strs in
    (* Ident.set ident old; *)
    let arender =
      match return_override with
      | Some r -> assignment ^ Ident.statement ident (sprintf "local %s = %s" a.aname r)
      | None ->
        if a.aname = "_"
        then sprintf "%s" assignment
        else sprintf "local %s = %s" a.aname assignment
    in
    let arender = top_level ^ "\n" ^ Ident.statement ident arender in
    arender, None
  | Func f -> render_function ident f top_level_funcs
  | FieldAccess (e, f) ->
    let exp, opt = render_expression ident e top_level_funcs in
    (* print_endline exp; *)
    exp ^ "." ^ f, opt
  | EnumMatch em -> sprintf "\"%s\"" em.etag, em.eargs
  | BinExp (left, op, right, remainder) ->
    let remainder =
      Option.map (fun e -> fst (render_expression ident e top_level_funcs)) remainder
    in
    let right_exp, right_rem = render_expression ident right top_level_funcs in
    let remainder =
      match remainder, right_rem with
      | Some re, Some rr -> Some (rr ^ " = " ^ re ^ "\n")
      | _ -> None
    in
    (* The remainder is for a match expression that contains a variable*)
    (* An example of this would be Some(1) *)
    ( sprintf
        "%s %s %s"
        (fst (render_expression ident left top_level_funcs))
        (render_bin_op op)
        (String.trim right_exp)
    , remainder )
  | UnExp (op, right) ->
    ( sprintf
        "%s%s"
        (render_un_op op)
        (fst (render_expression ident right top_level_funcs))
    , None )
  | Identifier i -> i, None
  | FuncCall c -> render_func_call ident c top_level_funcs
  | If (con_e, then_e, else_e) -> render_if ident con_e then_e else_e top_level_funcs
  | Match m -> render_match ident m top_level_funcs
  | Array a -> render_array ident a top_level_funcs
  | Map m -> render_map ident m top_level_funcs
  | FuncDef def ->
    top_level_funcs
    := { amount = !top_level_funcs.amount + 1; func_strs = !top_level_funcs.func_strs };
    let ident_name = Temp_vars.get_new_var () in
    let func_def, opt =
      render_function
        ident
        { local = true; fn_name = ident_name; definition = def }
        top_level_funcs
    in
    top_level_funcs
    := { amount = !top_level_funcs.amount
       ; func_strs = func_def :: !top_level_funcs.func_strs
       };
    ident_name, opt
  | Block b ->
    ( String.concat
        "\n"
        (List.map
           (fun s -> String.trim (fst (render_expression ident s top_level_funcs)))
           b)
    , None )
  | Tuple t ->
    let a = { array_members = t } in
    render_array ident a top_level_funcs
  | TypeDef def ->
    (match def with
     | Variant v ->
       let variant_header = sprintf "type %s = {\n" v.vdname in
       let tag =
         Ident.block
           ident
           (sprintf
              "tag: %s,\n"
              (String.concat " | " (List.map (fun s -> sprintf "\"%s\"" s) v.variants)))
       in
       let value = Ident.block ident "value: any\n" in
       variant_header ^ tag ^ value ^ "}", None
     | Record r ->
       let record_header = sprintf "type %s = {\n" r.rdname in
       let body =
         String.concat
           ",\n"
           (List.map (fun (i, e) -> Ident.block ident (sprintf "%s: %s" i e)) r.rdfields)
       in
       record_header ^ body ^ "\n}", None
     | CoreType ct -> ct, None)
  | TypeConstruct construct ->
    (match construct with
     | CVariant variant ->
       let open_brace = Ident.statement ident "{\n" in
       let tag = Ident.block ident (sprintf "tag = \"%s\",\n" variant.variant) in
       let value =
         Ident.block
           ident
           (sprintf
              "value = %s\n"
              (fst (render_expression ident variant.vvalue top_level_funcs)))
       in
       let close_brace = Ident.statement ident "}\n" in
       open_brace ^ tag ^ value ^ close_brace, None
     | CRecord record ->
       let open_brace = Ident.statement ident "{\n" in
       let body =
         String.concat
           ",\n"
           (List.map
              (fun (i, e) ->
                Ident.block
                  ident
                  (sprintf "%s = %s" i (fst (render_expression ident e top_level_funcs))))
              record.rfields)
       in
       let close_brace = "\n" ^ Ident.statement ident "}\n" in
       open_brace ^ body ^ close_brace, None)
  | Unknown -> "unknown", None

and render_function ident fn_decl top_level_funcs =
  let header =
    Ident.statement
      ident
      (sprintf
         "%sfunction %s(%s)"
         (if fn_decl.local then "local " else "")
         fn_decl.fn_name
         (render_parameters fn_decl.definition.dparameters))
  in
  if List.length fn_decl.definition.statements = 0
  then header ^ " end", None
  else (
    let rec render_statements ss =
      match ss with
      | s :: s' :: ss' ->
        (fst (render_expression ident s top_level_funcs) ^ "\n")
        :: render_statements (s' :: ss')
      | s :: [] ->
        let render, return_override = render_expression ident s top_level_funcs in
        (match return_override with
         | Some r ->
           [ render ^ Ident.statement ident (sprintf "return %s\n" (String.trim r)) ]
         | None -> [ Ident.statement ident ("return " ^ String.trim render ^ "\n") ])
      | _ -> []
    in
    let _ = Ident.increment ident in
    let block = render_statements fn_decl.definition.statements |> String.concat "" in
    Ident.decrement ident;
    header ^ "\n" ^ block ^ Ident.statement ident "end", None)

and render_if_case ident con exp var_name top_level_funcs =
  let condition_render, assignment_remainder =
    render_expression ident con top_level_funcs
  in
  let header = Ident.statement ident (sprintf "if %s then\n" condition_render) in
  let assignment =
    match assignment_remainder with
    | Some r -> Ident.block ident r
    | None -> ""
  in
  let body =
    Ident.block
      ident
      (sprintf
         "%s = %s"
         var_name
         (String.trim (fst (render_expression ident exp top_level_funcs)) ^ "\n"))
  in
  header ^ assignment ^ body

and render_if ident if_e then_e else_e top_level_funcs =
  let var_name = Temp_vars.get_new_var () in
  let rendered_expression = render_if_case ident if_e then_e var_name top_level_funcs in
  match else_e with
  | Some e ->
    Ident.increment ident;
    let else_block =
      Ident.block
        ident
        (sprintf
           "%s = %s"
           var_name
           (String.trim (fst (render_expression ident e top_level_funcs)) ^ "\n"))
    in
    let e =
      sprintf "local %s\n" var_name
      ^ rendered_expression
      ^ Ident.statement ident "else\n"
      ^ else_block
      ^ "end\n"
    in
    Ident.decrement ident;
    e, Some var_name
  | None -> rendered_expression ^ Ident.statement ident "end\n", None

and render_match indent match_exp top_level_funcs =
  let var_name = Temp_vars.get_new_var () in
  let top_level_var = Ident.statement indent (sprintf "local %s\n" var_name) in
  let cases =
    String.concat
      ""
      (List.map
         (fun s -> String.trim s)
         (List.map
            (fun (c, e) ->
              render_if_case indent c e var_name top_level_funcs
              ^ Ident.statement indent "else")
            match_exp.cases))
  in
  let cases = Ident.statement indent cases in
  let default =
    match match_exp.default_case with
    | Some d ->
      let body =
        Ident.block
          indent
          (sprintf
             "%s = %s"
             var_name
             (String.trim (fst (render_expression indent d top_level_funcs))))
      in
      "\n" ^ body ^ "\n" ^ Ident.statement indent "end\n"
    | None ->
      let body =
        "\n" ^ Ident.block indent "error(\"Exhaustive match was not exhaustive?\")\n"
      in
      body ^ Ident.statement indent "end\n"
  in
  top_level_var ^ cases ^ default, Some var_name

and render_array ident array top_level_funcs =
  sprintf "{%s}" (render_call_parameters ident array.array_members top_level_funcs), None

and mapper ident top_level_funcs (k, v) =
  "\n"
  ^ Ident.block
      ident
      (sprintf "[\"%s\"] = %s" k (fst (render_expression ident v top_level_funcs)))

and render_map ident map top_level_funcs =
  let members =
    List.map (mapper ident top_level_funcs) map.map_members |> String.concat ","
  in
  sprintf "{%s\n}" members, None

and render_call_parameters ident params top_level_funcs =
  List.map (fun p -> fst (render_expression ident p top_level_funcs)) params
  |> String.concat ", "

and render_func_call ident c top_level_funcs =
  let call_params = render_call_parameters ident c.cparameters top_level_funcs in
  let func_call = sprintf "%s(%s)" c.ident call_params in
  Ident.statement ident func_call, None
;;

(* external entrypoint *)
let render exp =
  let ident = Ident.create () in
  let top_level_funcs = ref { amount = 0; func_strs = [] } in
  let render, _ = render_expression ident exp top_level_funcs in
  render
;;
