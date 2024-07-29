open Rbxlib.Classes

let _ =
  let pressed = UserInputService.get_keys_pressed () in
  List.iter (fun p -> print_endline p) pressed
;;
