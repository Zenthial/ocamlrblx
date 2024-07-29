let tys = [ "int", "number"; "list", "table" ]

let rec find_in_stdlib ty lib =
  match lib with
  | (key, value) :: tail -> if key = ty then value else find_in_stdlib ty tail
  | _ -> ty
;;

let ocaml_to_luau ocaml_type = find_in_stdlib ocaml_type tys
