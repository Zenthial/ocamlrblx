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

type clip_evaluator = { evaluate : float -> float }
