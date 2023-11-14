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
  | Literal l -> render_literal l
  | Assignment a ->
      let old = Ident.get_level ident in
      Ident.set ident 0;
      let assignment = render_expression ident a.value in
      Ident.set ident old;
      Ident.statement ident (sprintf "local %s = %s" a.aname assignment)
  | Func f -> render_function ident f
  | BinExp (left, op, right) ->
      sprintf "%s %s %s"
        (render_expression ident left)
        (render_bin_op op)
        (render_expression ident right)
  | UnExp (op, right) ->
      sprintf "%s%s" (render_un_op op) (render_expression ident right)
  | Identifier i -> i
  | FuncCall c -> render_func_call ident c
  | If e -> render_if ident e
  | Array a -> render_array ident a
  | Map m -> render_map ident m
  | Unknown -> "unknown"

and render_function ident fn_decl =
  let header =
    Ident.statement ident
      (sprintf "%sfunction %s(%s)"
         (if fn_decl.local then "local " else "")
         fn_decl.fnname
         (render_parameters fn_decl.dparameters))
  in
  if List.length fn_decl.statements = 0 then header ^ " end"
  else
    let _ = Ident.increment ident in
    let block =
      List.map (fun s -> render_expression ident s ^ "\n") fn_decl.statements
      |> String.concat ""
    in
    Ident.decrement ident;
    header ^ "\n" ^ block ^ Ident.statement ident "end"

and render_if ident if_expression =
  let header =
    Ident.statement ident
      (sprintf "if %s then" (render_expression ident if_expression.condition))
  in
  let body = Ident.block ident (render_expression ident if_expression.body) in
  let rendered_expression = header ^ body in
  match if_expression.else_block with
  | Some e ->
      Ident.increment ident;
      let e =
        rendered_expression
        ^ Ident.statement ident "else\n"
        ^ render_expression ident e
      in
      Ident.decrement ident;
      e
  | None -> rendered_expression ^ Ident.statement ident "end"

and render_array ident array =
  sprintf "{%s}" (render_call_parameters ident array.array_members)

and mapper ident (k, v) =
  "\n"
  ^ Ident.block ident (sprintf "[\"%s\"] = %s" k (render_expression ident v))

and render_map ident map =
  let members = List.map (mapper ident) map.map_members |> String.concat "," in
  sprintf "{%s\n}" members

and render_call_parameters ident params =
  List.map (render_expression ident) params |> String.concat ", "

and render_func_call ident c =
  Ident.statement ident
    (sprintf "%s(%s)" c.ident (render_call_parameters ident c.cparameters))

(* external entrypoint *)
let render exp =
  let ident = Ident.create () in
  render_expression ident exp
