type person =
  { name : string
  ; age : int
  }

let _ =
  let p = { name = "John"; age = 30 } in
  print_endline p.name;
  print_int p.age
;;
