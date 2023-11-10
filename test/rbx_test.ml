open Ocamlrbx.Ast
open Ocamlrbx.Renderer

let%test "no-body function" =
  let func =
    {
      local = true;
      fnname = "add";
      dparameters = [ "x"; "y" ];
      statements = [];
    }
  in
  let render = render_function func in
  render = "local function add(x, y) end"

let%test "function body" =
  let func =
    {
      local = true;
      fnname = "add";
      dparameters = [ "x"; "y" ];
      statements =
        [ Assignment { aname = "one"; value = Literal (Number "1") } ];
    }
  in
  let render = render_function func in
  let expected = "local function add(x, y)\n  local one = 1\nend" in
  render = expected

let%test "test render_expression of a function" =
  let call =
    FuncCall { ident = "get_val"; cparameters = [ Literal (String "test") ] }
  in
  let func =
    Func
      {
        local = true;
        fnname = "add";
        dparameters = [ "x"; "y" ];
        statements =
          [
            Assignment { aname = "one"; value = call };
            Assignment { aname = "one_str"; value = Literal (String "1") };
          ];
      }
  in
  let render = render_expression func in
  let expected =
    "local function add(x, y)\n\
    \  local one = get_val(\"test\")\n\
    \  local one_str = \"1\"\n\
     end"
  in
  render = expected

let%test "render binop" =
  let expr = BinExp (Literal (Number "1"), Add, Literal (Number "2")) in
  let render = render_expression expr in
  let expected = "1 + 2" in
  render = expected

let%test "render func_call" =
  let expr =
    FuncCall { ident = "print"; cparameters = [ Literal (String "test") ] }
  in
  let render = render_expression expr in
  let expected = "print(\"test\")" in
  render = expected
