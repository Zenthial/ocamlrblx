type t = { mutable vars : int }

let v = { vars = 0 }

let get_new_var () =
  v.vars <- v.vars + 1;
  Format.sprintf "_%s" (string_of_int v.vars)
;;
