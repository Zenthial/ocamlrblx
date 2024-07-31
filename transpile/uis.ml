open Rbxlib

type test = { input : Enum.UserInputType.t }

let _ =
  let pressed =
    Classes.UserInputService.gamepad_supports
      Enum.UserInputType.MouseButton1
      Enum.KeyCode.E
  in
  if pressed then print_endline "true" else print_endline "false"
;;
