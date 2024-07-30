open Rbxlib.Classes
open Rbxlib.Enums

let _ =
  let pressed = UserInputService.gamepad_supports MouseButton1 E in
  if pressed then print_endline "true" else print_endline "false"
;;
