(* Analyzes a static binary tree, collecting libaries that need to be imported *)
open Ast

let rec analyze (ast : expression) =
  match ast with
  | FuncCall fc ->
    let idents = String.split_on_char '.' fc.ident in
    if List.length idents = 1
    then [ None ]
    else (
      let namespace = List.hd idents in
      [ Some namespace ])
  | Func func -> List.flatten (List.map analyze func.definition.statements)
  | Assignment a -> analyze a.value
  | FieldAccess (exp, _) ->
    (match exp with
     | Identifier i -> [ Some i ]
     | _ -> [ None ])
  | _ -> [ None ]
;;
