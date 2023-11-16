type expression =
  | Func of func_decl
  | FuncCall of func_call
  | Literal of literal
  | Assignment of assignment
  (* Binary expression *)
  | BinExp of expression * bin_op * expression
  (* Unary expression *)
  | UnExp of unary_op * expression
  | Identifier of identifier
  | If of if_expression
  | Array of array
  | Map of map
  | FuncDef of func_definition (* This is not a concrete type *)
  | Block of expression list (* This is not a concrete type *)
  | Unknown (* Placeholder *)

and literal =
  | Nil
  | True
  | False
  (* Of string because numbers can be either ints or floats in Luau, so we store the string representation *)
  | Number of string
  | String of string

and bin_op =
  | Add
  | Sub
  | Mul
  | Div
  | Pow
  | Mod
  | Concat
  | And
  | Or
  | Lt
  | Gt
  | Le
  | Ge
  | Eq
  | Ne

and unary_op =
  | Not
  (* not *)
  | Pound
  (* # *)
  | Negate (* - *)

and assignment = { aname : string; value : expression }
and func_decl = { local : bool; fn_name : string; definition : func_definition }

and func_definition = {
  dparameters : string list;
  statements : expression list;
}

and if_expression = {
  condition : expression;
      (* This really isn't an expression, but the OCaml side of things will handle the  *)
  body : expression;
  else_block : expression option;
      (* There's no concept of else if in ocaml, just
         if condition then

         else
           if condition then else
      *)
}

and array = { array_members : expression list }
and map = { map_members : (string * expression) list }
and identifier = string
and func_call = { ident : identifier; cparameters : expression list }

let to_string (exp : expression) =
  match exp with Identifier i -> i | _ -> exit 1
