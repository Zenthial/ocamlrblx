type t =
  { name : string
  ; user_id : int
  }

val get_player_by_name : string -> t option
val get_players : unit -> t list
