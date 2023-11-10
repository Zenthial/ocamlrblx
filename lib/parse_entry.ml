let read_file file =
  let in_chan = open_in_bin file in
  let len = in_channel_length in_chan in
  let contents = really_input_string in_chan len in
  close_in in_chan;
  contents

let get_lexbuf_for_file file =
  let contents = read_file file in
  let lexbuf = Lexing.from_string contents in
  lexbuf.lex_curr_p <-
    { pos_fname = file; pos_cnum = 0; pos_lnum = 1; pos_bol = 0 };
  (contents, lexbuf)

let parse_implementation lexbuf =
  let structure = Parse.implementation lexbuf in
  structure

let print_parse_tree ptree = Pprintast.structure Format.std_formatter ptree
