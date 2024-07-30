open Ast

let debug (ast : expression) =
  match ast with
  | Func func ->
    List.iter (fun d -> print_endline (to_string d)) func.definition.statements
  | _ -> print_endline (to_string ast)
;;
