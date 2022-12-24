
(* The type of tokens. *)

type token = 
  | WHILE
  | TRUE
  | SLASH
  | RETURN
  | RAT
  | QMARK
  | PV
  | PRINT
  | PO
  | PLUS
  | PF
  | NUM
  | NULL
  | NEW
  | MULT
  | LOOP
  | INT
  | INF
  | IF
  | ID of (string)
  | FALSE
  | EQUAL
  | EOF
  | ENTIER of (int)
  | ELSE
  | DENOM
  | DEFINE
  | CONTINUE
  | CONST
  | COLON
  | CO
  | CF
  | CALL
  | BREAK
  | BOOL
  | AO
  | AF
  | ADR

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.AstSyntax.programme)
