type question = Never | Maybe of string

let test o =
  match o with Maybe s -> print_endline s | Never -> print_endline "None"

let _ = test (Maybe "test")
