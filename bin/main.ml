open Ocamlrbx

let () =
  Sys.readdir "transpile"
  |> Array.to_list
  |> List.iter (fun file ->
    let file_name = Filename.remove_extension (Filename.basename file) in
    let lexbuf = snd (Ocamlparse.get_lexbuf_for_file ("transpile/" ^ file)) in
    let structure = Ocamlparse.parse_implementation lexbuf in
    let luau_ast = Astmapper.map structure in
    let renders = List.map Renderer.render luau_ast in
    let file_contents = String.concat "\n\n" renders in
    Core.Out_channel.write_all ("lua/" ^ file_name ^ ".lua") ~data:file_contents)
;;
