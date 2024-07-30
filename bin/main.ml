open Ocamlrbx
module CLI = Minicli.CLI

let transpile () =
  Sys.readdir "transpile"
  |> Array.to_list
  |> List.iter (fun file ->
    let file_name = Filename.remove_extension (Filename.basename file) in
    if file_name <> "dune"
    then (
      let lexbuf = snd (Ocamlparse.get_lexbuf_for_file ("transpile/" ^ file)) in
      let structure = Ocamlparse.parse_implementation lexbuf in
      let luau_ast = Astmapper.map structure in
      let namespaces = List.flatten (List.map Analyze.analyze luau_ast) in
      (* List.iter Debug.debug luau_ast; *)
      let namespaces =
        List.map
          (fun s ->
            match s with
            | Some s' -> s'
            | None -> assert false)
          (List.filter Option.is_some namespaces)
      in
      let namespaces =
        List.map
          (fun namespace ->
            Format.sprintf
              "local %s = require(_Include.%s)\n"
              namespace
              (String.lowercase_ascii namespace))
          namespaces
      in
      let namespace_header = String.concat "\n" namespaces in
      let namespace_header =
        "local _Include = game.ReplicatedStorage.include\n" ^ namespace_header ^ "\n"
      in
      let renders = List.map Renderer.render luau_ast in
      let file_contents = String.concat "\n\n" renders in
      let file_contents = namespace_header ^ file_contents in
      let file_name = "lua/src/client/" ^ file_name ^ ".luau" in
      Core.Out_channel.write_all file_name ~data:file_contents))
;;

let () =
  let argc, args = CLI.init () in
  if argc = 1
  then (
    Format.printf "usage:\n%s {-t/--transpile}\n" Sys.argv.(0);
    exit 1)
  else (
    let trans = CLI.get_set_bool [ "-t"; "--transpile" ] args in
    if trans then transpile () else ())
;;

(* let _ = Core.Out_channel.write_all file_name ~data:file_contents in *)
(* let in_chan = *)
(*   Core_unix.open_process_in *)
(*     ("/home/tom/.local/share/nvim/mason/bin/luau-lsp analyze " ^ file_name) *)
(* in *)
(* let lines = Core.In_channel.input_lines in_chan in *)
(* List.iter (fun s -> print_string s) lines)) *)
