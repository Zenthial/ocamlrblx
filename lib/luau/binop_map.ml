open Ast

let binops =
  [ ("^", Concat); ("+", Add); ("-", Sub); ("*", Mul); ("/", Div); ("%", Mod) ]

let rec is_binop func lib =
  match lib with
  | (key, value) :: tail ->
      if key = func then Some value else is_binop func tail
  | _ -> None

let ocaml_to_luau ocaml_stdlib_func = is_binop ocaml_stdlib_func binops
