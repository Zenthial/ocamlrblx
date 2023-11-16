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
  let render = render_function ident func in
  render = "local function add(x, y) end"

let%test "function body" =
  let func =
    {
      local = true;
      fn_name = "add";
      definition =
        {
          dparameters = [ "x"; "y" ];
          statements =
            [ Assignment { aname = "one"; value = Literal (Number "1") } ];
        };
    }
  in
  let ident = Ocamlrbx.Ident.create () in
  let render = render_function ident func in
  let expected = "local function add(x, y)\n  local one = 1\nend" in
  render = expected

let%test "test render of a function" =
  let call =
    FuncCall { ident = "get_val"; cparameters = [ Literal (String "test") ] }
  in
  let func =
    Func
      {
        local = true;
        fn_name = "add";
        definition =
          {
            dparameters = [ "x"; "y" ];
            statements =
              [
                Assignment { aname = "one"; value = call };
                Assignment { aname = "one_str"; value = Literal (String "1") };
              ];
          };
      }
  in
  let result = render func in
  let expected =
    "local function add(x, y)\n\
    \  local one = get_val(\"test\")\n\
    \  local one_str = \"1\"\n\
     end"
  in
  print_endline result;
  result = expected

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

let%test "render nested function call" =
  let arr =
    Array
      { array_members = [ Literal (String "test"); Literal (String "test2") ] }
  in
  let expr =
    FuncCall { ident = "print"; cparameters = [ Literal (String "test") ] }
  in
  let nested_func =
    Func
      {
        local = true;
        fn_name = "d";
        definition =
          {
            dparameters = [];
            statements = [ Assignment { aname = "one_str"; value = arr }; expr ];
          };
      }
  in
  let func =
    Func
      {
        local = true;
        fn_name = "add";
        definition =
          { dparameters = [ "x"; "y" ]; statements = [ nested_func ] };
      }
  in

  let result = render func in
  let expected =
    "local function add(x, y)\n\
    \  local function d()\n\
    \    local one_str = {\"test\", \"test2\"}\n\
    \    print(\"test\")\n\
    \  end\n\
     end"
  in
  print_endline result;
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
    "if \"test\" == \"test\" then\n\
    \  print(\"equal\")\n\
     elseif \"test\" == \"test\" then\n\
    \  print(\"equal\")\n\
     else\n\
    \  error(\"Exhaustive match was not exhaustive?\")\n\
     end"
  in

  print_endline result;
  result = expected
