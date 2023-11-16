open Ocamlrbx

let () =
  let lexbuf = snd (Ocamlparse.get_lexbuf_for_file "test.ml") in
  let structure = Ocamlparse.parse_implementation lexbuf in
  Astmapper.map structure
