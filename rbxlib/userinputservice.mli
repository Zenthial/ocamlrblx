type input_object =
  { user_input_type : Enum.user_input_type
  ; key_code : Enum.key_code
  }

val input_began : (input_object * bool) Core_types.event
