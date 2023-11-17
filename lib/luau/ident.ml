type t = { mutable level : int }

let create () = { level = 0 }

let repeat s n =
  let rec helper s1 n1 = if n1 = 0 then s1 else helper (s1 ^ s) (n1 - 1) in
  helper "" n

let get_tabs level = repeat "  " level
let get_level t = t.level
let statement t str = get_tabs t.level ^ str
let statement_where t str where = if where then statement t str else str
let block t str = get_tabs (t.level + 1) ^ str
let increment t = t.level <- t.level + 1
let decrement t = t.level <- t.level - 1
let set t value = t.level <- value
