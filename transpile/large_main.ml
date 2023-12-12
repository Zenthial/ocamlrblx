let add x y = x + y

let _ =
  let one = 1 in
  let two = 2 in
  let three = add one two in
  let six = add three three in
  print_endline (string_of_int six)
;;
