open Ocamlrbx.Ast
open Ocamlrbx.Renderer

let%test "no-body function" =
  let func =
    {
      local = true;
      fn_name = "add";
      definition = { dparameters = [ "x"; "y" ]; statements = [] };
    }
  in
  let ident = Ocamlrbx.Ident.create () in
  let render, _ = render_function ident func in
  render = "local function add(x, y) end"

let%test "render binop" =
  let expr = BinExp (Literal (Number "1"), Add, Literal (Number "2")) in
  let result = render expr in
  let expected = "1 + 2" in
  result = expected

let%test "render func_call" =
  let expr =
    FuncCall { ident = "print"; cparameters = [ Literal (String "test") ] }
  in
  let result = render expr in
  let expected = "print(\"test\")" in
  result = expected

let%test "render array" =
  let arr =
    Array
      { array_members = [ Literal (String "test"); Literal (String "test2") ] }
  in
  let result = render arr in
  let expected = "{\"test\", \"test2\"}" in
  print_endline result;
  result = expected

let%test "render map" =
  let map =
    Map
      {
        map_members =
          [ ("test", Literal (Number "1")); ("test2", Literal (String "1")) ];
      }
  in

  let result = render map in
  let expected = "{\n  [\"test\"] = 1,\n  [\"test2\"] = \"1\"\n}" in

  print_endline result;
  result = expected

let%test "render match" =
  let eq_check =
    BinExp (Literal (String "test"), Eq, Literal (String "test"))
  in
  let print =
    FuncCall { ident = "print"; cparameters = [ Literal (String "equal") ] }
  in
  let m =
    Match
      { cases = [ (eq_check, print); (eq_check, print) ]; default_case = None }
  in
  let result = render m in
  let expected =
    "local _1\n\
     if \"test\" == \"test\" then\n\
    \  _1 = print(\"equal\")\n\
     elseif \"test\" == \"test\" then\n\
    \  _1 = print(\"equal\")\n\
     else\n\
    \  error(\"Exhaustive match was not exhaustive?\")\n\
     end\n"
  in

  print_endline result;
  result = expected

let%test "render variant" =
  let one = Literal (Number "1") in
  let some_opt =
    TypeConstruct
      (CVariant { vname = "Option"; variant = "Some"; vvalue = one })
  in
  let result = render some_opt in
  let expected = "{\n  tag = \"Some\"\n  value = 1\n}\n" in

  print_endline result;
  result = expected

let%test "render variant assignment" =
  let one = Literal (Number "1") in
  let some_opt =
    TypeConstruct
      (CVariant { vname = "Option"; variant = "Some"; vvalue = one })
  in
  let assign = Assignment { aname = "test"; value = some_opt } in
  let result = render assign in
  let expected = "local test = {\n  tag = \"Some\"\n  value = 1\n}\n" in

  print_endline result;
  result = expected
