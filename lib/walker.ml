(*
  Current Notes:

  A Pstr_value seems to be a function/top level binding
   - It has a recursive flag and the value bindings within the function
*)

open Asttypes (*Used for recursive flags*)

let recursive_flag flag = match flag with Nonrecursive -> "nonrecursive" | Recursive -> "recursive"

(* https://v2.ocaml.org/releases/4.12/api/compilerlibref/Parsetree.html#TYPEvalue_binding *)
let value_binding (binding:Parsetree.value_binding) =
  let name = match binding.pvb_pat.ppat_desc with Ppat_var name -> name.txt | _ -> "" in
  match binding.pvb_expr.pexp_desc with
  | Pexp_fun _ -> Format.sprintf "%s is a function" name
  | _ -> Format.sprintf ""
;;  

(* Pstr_value of Asttypes.rec_flag * value_binding list *)
let handle_value flag binding_list = 
  let rec_flag = recursive_flag flag in
  let binding_str = value_binding (List.hd binding_list) in
  Format.printf "%s: %s\n" rec_flag binding_str
;;

(* https://v2.ocaml.org/releases/4.12/api/compilerlibref/Parsetree.html#TYPEstructure_item_desc *)
let structure_item (item:Parsetree.structure_item) = 
  match item.pstr_desc with
  | Pstr_eval _ -> print_endline "eval"
  | Pstr_value (rec_flag, value_binding_list) -> handle_value rec_flag value_binding_list
  | _ -> print_endline "not eval"
;;

let entry structure = 
  List.iter structure_item structure
;;
