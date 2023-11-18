open Format
open Ast

let render_literal literal =
  match literal with
  | Number n -> n
  | Nil -> "nil"
  | True -> "true"
  | False -> "false"
  | String s -> sprintf "\"%s\"" s

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

let render_un_op op =
  (* Not has a trailing space because it needs it *)
  match op with Not -> "not " | Pound -> "#" | Negate -> "-"

let render_parameters params = String.concat ", " params

let rec render_expression ident expression =
  match expression with
  | Literal l -> (render_literal l, None)
  | Assignment a ->
      (* let old = Ident.get_level ident in *)
      (* Ident.set ident 0; *)
      let assignment, return_override = render_expression ident a.value in
      let assignment = String.trim assignment ^ "\n" in
      (* Ident.set ident old; *)
      let arender =
        match return_override with
        | Some r ->
            assignment
            ^ Ident.statement ident (sprintf "local %s = %s" a.aname r)
        | None ->
            if a.aname = "_" then sprintf "%s" assignment
            else sprintf "local %s = %s" a.aname assignment
      in
      (Ident.statement ident arender, None)
  | Func f -> render_function ident f
  | BinExp (left, op, right) ->
      ( sprintf "%s %s %s"
          (fst (render_expression ident left))
          (render_bin_op op)
          (String.trim (fst (render_expression ident right))),
        None )
  | UnExp (op, right) ->
      ( sprintf "%s%s" (render_un_op op) (fst (render_expression ident right)),
        None )
  | Identifier i -> (i, None)
  | FuncCall c -> render_func_call ident c
  | If e -> render_if ident e
  | Match m -> render_match ident m
  | Array a -> render_array ident a
  | Map m -> render_map ident m
  | FuncDef _ | Block _ ->
      print_endline "FuncDefs and Blocks cannot be rendered alone";
      exit 1
  | Unknown -> ("unknown", None)

and render_function ident fn_decl =
  let header =
    Ident.statement ident
      (sprintf "%sfunction %s(%s)"
         (if fn_decl.local then "local " else "")
         fn_decl.fn_name
         (render_parameters fn_decl.definition.dparameters))
  in
  if List.length fn_decl.definition.statements = 0 then (header ^ " end", None)
  else
    let rec render_statements ss =
      match ss with
      | s :: s' :: ss' ->
          (fst (render_expression ident s) ^ "\n")
          :: render_statements (s' :: ss')
      | s :: [] -> (
          let render, return_override = render_expression ident s in
          match return_override with
          | Some r ->
              [
                render
                ^ Ident.statement ident (sprintf "return %s\n" (String.trim r));
              ]
          | None ->
              [ Ident.statement ident ("return " ^ String.trim render ^ "\n") ])
      | _ -> []
    in

    let _ = Ident.increment ident in
    let block =
      render_statements fn_decl.definition.statements |> String.concat ""
    in
    Ident.decrement ident;
    (header ^ "\n" ^ block ^ Ident.statement ident "end", None)

and render_if ident if_expression =
  let header =
    Ident.statement ident
      (sprintf "if %s then"
         (fst (render_expression ident if_expression.condition)))
  in
  let body =
    Ident.block ident (fst (render_expression ident if_expression.body))
  in
  let rendered_expression = header ^ body in
  match if_expression.else_block with
  | Some e ->
      Ident.increment ident;
      let e =
        rendered_expression
        ^ Ident.statement ident "else\n"
        ^ fst (render_expression ident e)
      in
      Ident.decrement ident;
      (e, None)
  | None -> (rendered_expression ^ Ident.statement ident "end", None)

and render_if_case ident con exp var_name =
  let header =
    Ident.statement ident
      (sprintf "if %s then\n" (fst (render_expression ident con)))
  in
  let body =
    Ident.block ident
      (sprintf "%s = %s" var_name
         (String.trim (fst (render_expression ident exp)) ^ "\n"))
  in
  header ^ body ^ Ident.statement ident "else"

and render_match indent match_exp =
  let var_name = Temp_vars.get_new_var () in
  let top_level_var = Ident.statement indent (sprintf "local %s\n" var_name) in
  let cases =
    String.concat ""
      (List.map
         (fun s -> String.trim s)
         (List.map
            (fun (c, e) -> render_if_case indent c e var_name)
            match_exp.cases))
  in
  let cases = Ident.statement indent cases in
  let default =
    match match_exp.default_case with
    | Some d ->
        let body =
          Ident.block indent
            (sprintf "%s = %s" var_name
               (String.trim (fst (render_expression indent d))))
        in
        "\n" ^ body ^ "\n" ^ Ident.statement indent "end\n"
    | None ->
        let body =
          "\n"
          ^ Ident.block indent
              "error(\"Exhaustive match was not exhaustive?\")\n"
        in
        body ^ Ident.statement indent "end\n"
  in
  (top_level_var ^ cases ^ default, Some var_name)

and render_array ident array =
  (sprintf "{%s}" (render_call_parameters ident array.array_members), None)

and mapper ident (k, v) =
  "\n"
  ^ Ident.block ident
      (sprintf "[\"%s\"] = %s" k (fst (render_expression ident v)))

and render_map ident map =
  let members = List.map (mapper ident) map.map_members |> String.concat "," in
  (sprintf "{%s\n}" members, None)

and render_call_parameters ident params =
  List.map (fun p -> fst (render_expression ident p)) params
  |> String.concat ", "

and render_func_call ident c =
  ( Ident.statement ident
      (sprintf "%s(%s)" c.ident (render_call_parameters ident c.cparameters)),
    None )

(* external entrypoint *)
let render exp =
  let ident = Ident.create () in
  let render, _ = render_expression ident exp in
  render
