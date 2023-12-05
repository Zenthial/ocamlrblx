let p x =
  let y = match x with 1 -> x + 1 | _ -> x in
  y + x

let _ = print_int (p 1)
