let () =
  let lexbuf = snd (Ocamlrbx.Parse_entry.get_lexbuf_for_file "test.ml") in
  let structure = Ocamlrbx.Parse_entry.parse_implementation lexbuf in
  Ocamlrbx.Walker.entry structure
