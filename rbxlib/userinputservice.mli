type input_object =
  { user_input_type : Enum.Userinputtype.t
  ; key_code : Enum.Keycode.t
  }

val input_began : (input_object * bool) Core_types.event
