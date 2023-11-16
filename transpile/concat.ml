let p s =
  let new_str = s ^ "yo" in
  let other_str = "test" in
  print_endline (new_str ^ other_str)

let _ = p "hello world"
