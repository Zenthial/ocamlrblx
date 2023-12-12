type adder = { value : int }

let add x y = { value = x.value + y.value }

let _ =
  let one = { value = 1 } in
  let two = { value = 2 } in
  let three = add one two in
  let six = add three three in
  print_endline (string_of_int six.value)
;;
