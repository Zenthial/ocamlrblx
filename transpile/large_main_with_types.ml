type player_profile =
  { fragments : int
  ; skins : (string * int) list
  }

type adder = { value : int }

let add x y = { value = x.value + y.value }

let add_skin prof skin_name =
  let exists = List.exists (fun (name, _) -> name = skin_name) prof.skins in
  let skins =
    if exists
    then
      List.map
        (fun (name, quant) -> if name = skin_name then name, quant + 1 else name, quant)
        prof.skins
    else (skin_name, 1) :: prof.skins
  in
  { fragments = prof.fragments; skins }
;;

let _ =
  let one = { value = 1 } in
  let two = { value = 2 } in
  let three = add one two in
  let six = add three three in
  let prof = { fragments = 1000; skins = [] } in
  let new_prof = add_skin prof "test" in
  List.iter (fun (s, _) -> print_endline s) new_prof.skins;
  print_endline (string_of_int six.value)
;;
