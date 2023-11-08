open Format

let render_literal (literal:Ast.literal) = 
  match literal with
   | Number n -> n
   | Nil -> "nil"
   | True -> "true"
   | False -> "false"
   | String s -> sprintf "\"%s\"" s
;;

let render_bin_op (op:Ast.bin_op) =
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

let render_parameters params = String.concat ", " params

let rec render_expression expression = 
  match expression with
   | Ast.Literal l -> render_literal l
   | Ast.Assignment a -> sprintf "local %s = %s" a.aname (render_expression a.value)
   | Ast.Func f -> render_function f
   | Ast.BinExp (left, op, right) -> sprintf "%s %s %s" (render_expression left) (render_bin_op op) (render_expression right)
   | _ -> "unimplemented"
and render_function fn_decl = 
  let header = sprintf "%sfunction %s(%s)" (if fn_decl.local then "local " else "") fn_decl.fnname (render_parameters fn_decl.parameters) in
  if List.length fn_decl.statements = 0 then
    header ^ " end"
  else
    let block = List.map (fun s -> "  " ^ render_expression s ^ "\n") fn_decl.statements |> String.concat "" in
    header ^ "\n" ^ block ^ "end"
;;

