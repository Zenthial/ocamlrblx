type expression =
  | Func of func_decl
  | FuncCall of func_call
  | Literal of literal
  | Assignment of assignment
  (* Binary expression *)
  | BinExp of expression * bin_op * expression * expression option
  (* The final optional expression is for an assignment remainder like a match expression *)
  (* Unary expression *)
  | UnExp of unary_op * expression
  | Identifier of identifier
  | If of expression * expression * expression option (* if E then E else E *)
  | Match of match_expression
  | Array of array
  | Map of map
  | FieldAccess of expression * string
  | TypeDef of type_def (* A type that is defined for later usage *)
  | TypeConstruct of type_construct (* A type that is assigned *)
  | EnumMatch of enum_def (* An enum *)
  | FuncDef of func_definition (* This is not a concrete type *)
  | Block of expression list (* This is not a concrete type *)
  | Tuple of expression list (* Same typedef as block, but comma separated *)
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
  | Pound
  | Negate

and enum_def =
  { etag : identifier
  ; eargs : string option
  }

and type_def =
  | Variant of variant_def
  | Record of record_def
  | CoreType of string

and type_construct =
  | CVariant of variant
  | CRecord of record

and variant_def =
  { vdname : string
  ; variants : string list
  }

and variant =
  { variant : string
  ; vvalue : expression
  }

and record_def =
  { rdname : string
  ; rdfields : (string * string) list
  }

and record =
  { rname : string
  ; rfields : (string * expression) list
  }

and assignment =
  { aname : string
  ; value : expression
  }

and func_decl =
  { local : bool
  ; fn_name : string
  ; definition : func_definition
  }

and func_definition =
  { dparameters : string list
  ; statements : expression list
  }

and match_expression =
  { cases : (expression * expression) list
  ; default_case : expression option
  }

and array = { array_members : expression list }
and map = { map_members : (string * expression) list }
and identifier = string

and func_call =
  { ident : identifier
  ; cparameters : expression list
  }

let to_string (exp : expression) =
  match exp with
  | Identifier i -> i
  | _ -> exit 1
;;
