open Ocamlrbx

let () =
  let lexbuf = snd (Parse_entry.get_lexbuf_for_file "test.ml") in
  let structure = Parse_entry.parse_implementation lexbuf in
  Astmapper.map structure
