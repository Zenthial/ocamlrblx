open Format
open Ast

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

let rec render_expression ident expression =
  match expression with
  | Literal l -> render_literal l, None
  | Assignment a ->
    (* let old = Ident.get_level ident in *)
    (* Ident.set ident 0; *)
    let assignment, return_override = render_expression ident a.value in
    let assignment = String.trim assignment ^ "\n" in
    (* Ident.set ident old; *)
    let arender =
      match return_override with
      | Some r -> assignment ^ Ident.statement ident (sprintf "local %s = %s" a.aname r)
      | None ->
        if a.aname = "_"
        then sprintf "%s" assignment
        else sprintf "local %s = %s" a.aname assignment
    in
    Ident.statement ident arender, None
  | Func f -> render_function ident f
  | FieldAccess (e, f) -> fst (render_expression ident e) ^ "." ^ f, None
  | EnumMatch em -> sprintf "\"%s\"" em.etag, em.eargs
  | BinExp (left, op, right, remainder) ->
    let remainder = Option.map (fun e -> fst (render_expression ident e)) remainder in
    let right_exp, right_rem = render_expression ident right in
    let remainder =
      match remainder, right_rem with
      | Some re, Some rr -> Some (rr ^ " = " ^ re ^ "\n")
      | _ -> None
    in
    (* The remainder is for a match expression that contains a variable*)
    (* An example of this would be Some(1) *)
    ( sprintf
        "%s %s %s"
        (fst (render_expression ident left))
        (render_bin_op op)
        (String.trim right_exp)
    , remainder )
  | UnExp (op, right) ->
    sprintf "%s%s" (render_un_op op) (fst (render_expression ident right)), None
  | Identifier i -> i, None
  | FuncCall c -> render_func_call ident c
  | If (con_e, then_e, else_e) -> render_if ident con_e then_e else_e
  | Match m -> render_match ident m
  | Array a -> render_array ident a
  | Map m -> render_map ident m
  | FuncDef _ ->
    print_endline "FuncDefs cannot be rendered alone";
    exit 1
  | Block b ->
    String.concat "" (List.map (fun s -> fst (render_expression ident s)) b), None
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
           (sprintf "value = %s\n" (fst (render_expression ident variant.vvalue)))
       in
       let close_brace = Ident.statement ident "}\n" in
       open_brace ^ tag ^ value ^ close_brace, None
     | CRecord record ->
       let open_brace = Ident.statement ident "{\n" in
       let body =
         String.concat
           ",\n"
           (List.map
              (fun (i, e) -> sprintf "%s = %s" i (fst (render_expression ident e)))
              record.rfields)
       in
       let close_brace = Ident.statement ident "}\n" in
       open_brace ^ body ^ close_brace, None)
  | Unknown -> "unknown", None

and render_function ident fn_decl =
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
        (fst (render_expression ident s) ^ "\n") :: render_statements (s' :: ss')
      | s :: [] ->
        let render, return_override = render_expression ident s in
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

and render_if_case ident con exp var_name =
  let condition_render, assignment_remainder = render_expression ident con in
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
         (String.trim (fst (render_expression ident exp)) ^ "\n"))
  in
  header ^ assignment ^ body

and render_if ident if_e then_e else_e =
  let var_name = Temp_vars.get_new_var () in
  let rendered_expression = render_if_case ident if_e then_e var_name in
  match else_e with
  | Some e ->
    Ident.increment ident;
    let e =
      rendered_expression
      ^ Ident.statement ident "else\n"
      ^ fst (render_expression ident e)
      ^ "end"
    in
    Ident.decrement ident;
    e, None
  | None -> rendered_expression ^ Ident.statement ident "end", None

and render_match indent match_exp =
  let var_name = Temp_vars.get_new_var () in
  let top_level_var = Ident.statement indent (sprintf "local %s\n" var_name) in
  let cases =
    String.concat
      ""
      (List.map
         (fun s -> String.trim s)
         (List.map
            (fun (c, e) ->
              render_if_case indent c e var_name ^ Ident.statement indent "else")
            match_exp.cases))
  in
  let cases = Ident.statement indent cases in
  let default =
    match match_exp.default_case with
    | Some d ->
      let body =
        Ident.block
          indent
          (sprintf "%s = %s" var_name (String.trim (fst (render_expression indent d))))
      in
      "\n" ^ body ^ "\n" ^ Ident.statement indent "end\n"
    | None ->
      let body =
        "\n" ^ Ident.block indent "error(\"Exhaustive match was not exhaustive?\")\n"
      in
      body ^ Ident.statement indent "end\n"
  in
  top_level_var ^ cases ^ default, Some var_name

and render_array ident array =
  sprintf "{%s}" (render_call_parameters ident array.array_members), None

and mapper ident (k, v) =
  "\n" ^ Ident.block ident (sprintf "[\"%s\"] = %s" k (fst (render_expression ident v)))

and render_map ident map =
  let members = List.map (mapper ident) map.map_members |> String.concat "," in
  sprintf "{%s\n}" members, None

and render_call_parameters ident params =
  List.map (fun p -> fst (render_expression ident p)) params |> String.concat ", "

and render_func_call ident c =
  ( Ident.statement
      ident
      (sprintf "%s(%s)" c.ident (render_call_parameters ident c.cparameters))
  , None )
;;

(* external entrypoint *)
let render exp =
  let ident = Ident.create () in
  let render, _ = render_expression ident exp in
  render
;;
