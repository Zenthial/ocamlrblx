type expression = 
  | Func of func_decl
  | Literal of literal
  | Assignment of assignment
  (* Binary expression *)
  | BinExp of expression * bin_op * expression
  | Identifier of string
  | Unknown (* Placeholder *)
and literal = 
  | Nil
  | True
  | False
  (* Of string because numbers can be either ints or floats in Luau, so we store the string representation *)
  | Number of string 
  | String of string
and bin_op =  Add | Sub | Mul | Div | Pow | Mod | Concat | And | Or | Lt | Gt | Le | Ge | Eq | Ne
and assignment = {
  aname: string;
  value: expression;
}
and func_decl = {
  local: bool;
  fnname: string;
  parameters: string list;
  statements: expression list
}