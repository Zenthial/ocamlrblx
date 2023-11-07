open Asttypes (*Used for recursive flags*)

let recursive_flag flag = match flag with Nonrecursive -> "nonrecursive" | Recursive -> "recursive"

(* https://v2.ocaml.org/releases/4.12/api/compilerlibref/Parsetree.html#TYPEvalue_binding *)
let value_binding binding = ()

(* Pstr_value of Asttypes.rec_flag * value_binding list *)
let handle_value flag binding_list = 
  print_endline (recursive_flag flag);
  List.iter value_binding binding_list

(* https://v2.ocaml.org/releases/4.12/api/compilerlibref/Parsetree.html#TYPEstructure_item_desc *)
let structure_item (item:Parsetree.structure_item) = 
  match item.pstr_desc with
  | Pstr_eval _ -> print_endline "eval"
  | Pstr_value (rec_flag, value_binding_list) -> handle_value rec_flag value_binding_list
  | _ -> print_endline "not eval"

let entry structure = 
  List.iter structure_item structure
