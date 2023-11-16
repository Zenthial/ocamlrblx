let stdlib = [ ("print_endline", "print") ]

let rec find_in_stdlib func lib =
  match lib with
  | (key, value) :: tail ->
      if key = func then Some value else find_in_stdlib func tail
  | _ -> None

let ocaml_to_luau ocaml_stdlib_func = find_in_stdlib ocaml_stdlib_func stdlib
