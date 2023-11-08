open Ocamlrbx.Ast
open Ocamlrbx.Renderer

let%test "no-body function" = 
  let func = {
    local = true;
    fnname = "add";
    parameters = ["x"; "y"];
    statements = []
  } in
  let render = render_function func in
  render = "local function add(x, y) end"

let%test "function body" = 
  let func = {
    local = true;
    fnname = "add";
    parameters = ["x"; "y"];
    statements = [Assignment {aname = "one"; value = Literal(Number "1")}]
  } in
  let render = render_function func in
  let expected = "local function add(x, y)
  local one = 1
end" in
  render = expected

let%test "test render_expression of a function" = 
  let func = Func {
    local = true;
    fnname = "add";
    parameters = ["x"; "y"];
    statements = [Assignment {aname = "one"; value = Literal(Number "1")}; Assignment {aname = "one_str"; value = Literal(String "1")}]
  } in
  let render = render_expression func in
  let expected = "local function add(x, y)
  local one = 1
  local one_str = \"1\"
end" in
  render = expected

let%test "render binop" = 
  let expr = BinExp(Literal(Number "1"), Add, Literal(Number "2")) in
  let render = render_expression expr in
  let expected = "1 + 2" in
  render = expected
