open Enums

type rbx_script_signal = { connect : (unit -> unit) -> unit }

type color3 =
  { r : float
  ; g : float
  ; b : float
  }

type color3uint8 =
  { r : int
  ; g : int
  ; b : int
  }

type brick_color = color3
type number_range = { range : int }
type catalog_search_params = { params : string list }

type vector3 =
  { x : float
  ; y : float
  ; z : float
  }

type vector3_int16 =
  { x : int
  ; y : int
  ; z : int
  }

type vector2 =
  { x : float
  ; y : float
  ; z : float
  }

type quaternion =
  { x : float
  ; y : float
  ; z : float
  ; w : float
  }

type cframe =
  { p : vector3
  ; r : quaternion
  }

type region3 =
  { cframe : cframe
  ; size : vector3
  }

type region3_int16 =
  { cframe : cframe
  ; size : vector3_int16
  }

type coordinate_frame = cframe
type clip_evaluator = { evaluate : float -> float }

type rect =
  { min : vector2
  ; max : vector2
  ; width : float
  ; height : float
  }

type udim =
  { scale : float
  ; offset : float
  }

type udim2 =
  { x : udim
  ; y : udim
  }

type number_sequence = float list
type shared_table = unit
type binary_string = string

type color_sequence_keypoint =
  { time : float
  ; color : color3
  }

type color_sequence = color_sequence_keypoint list

type ray =
  { origin : vector3
  ; direction : vector3
  ; unit : ray
  }

type rbx_script_connection =
  { connected : bool
  ; disconnect : unit -> unit
  }

type secret =
  { add_prefix : string -> secret
  ; add_suffix : string -> secret
  }

type raycast_params
type raycast_result
type overlap_params
type protected_string = string
type float_curve_key
type rotation_curve_key
type physical_properties
type faces
type axes
type date_time

type tween_info =
  { time : float
  ; easing_style : easing_style
  ; easing_direction : easing_direction
  ; repeat_count : float
  ; reverses : bool
  ; delay_time : float
  }
