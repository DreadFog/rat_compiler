
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | MULT
    | INT
    | INF
    | IF
    | ID of (
# 11 "parser.mly"
       (string)
# 31 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 39 "parser.ml"
  )
    | ELSE
    | DENOM
    | CONST
    | COLON
    | CO
    | CF
    | CALL
    | BOOL
    | AO
    | AF
  
end

include MenhirBasics

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 62 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState06 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 06.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState09 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 09.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState12 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_, _menhir_box_main) _menhir_state
    (** State 12.
        Stack shape : typ ID list(param).
        Start symbol: main. *)

  | MenhirState13 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 13.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState14 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 14.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState16 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState17 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 17.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState21 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 21.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState22 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 22.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState25 : (('s, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 25.
        Stack shape : CALL ID.
        Start symbol: main. *)

  | MenhirState28 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 28.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState31 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 31.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState37 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 37.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState39 : (((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 39.
        Stack shape : PO e e.
        Start symbol: main. *)

  | MenhirState42 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 42.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState46 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 46.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState49 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 49.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState52 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 52.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState55 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 55.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState57 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 57.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState60 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 60.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState63 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 63.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState64 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 64.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState66 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 66.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState69 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 69.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState79 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 79.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState84 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 84.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState91 : (('s, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 91.
        Stack shape : list(fonc) ID.
        Start symbol: main. *)

  | MenhirState93 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 93.
        Stack shape : fonc.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_bloc = 
  | MenhirCell1_bloc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.bloc)

and ('s, 'r) _menhir_cell1_e = 
  | MenhirCell1_e of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.expression)

and ('s, 'r) _menhir_cell1_fonc = 
  | MenhirCell1_fonc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction)

and ('s, 'r) _menhir_cell1_i = 
  | MenhirCell1_i of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.instruction)

and ('s, 'r) _menhir_cell1_list_fonc_ = 
  | MenhirCell1_list_fonc_ of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction list)

and ('s, 'r) _menhir_cell1_list_param_ = 
  | MenhirCell1_list_param_ of 's * ('s, 'r) _menhir_state * ((Type.typ * string) list)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Type.typ * string)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Type.typ)

and ('s, 'r) _menhir_cell1_AO = 
  | MenhirCell1_AO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CALL = 
  | MenhirCell1_CALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CO = 
  | MenhirCell1_CO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DENOM = 
  | MenhirCell1_DENOM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 11 "parser.mly"
       (string)
# 256 "parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (string)
# 263 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NUM = 
  | MenhirCell1_NUM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PO = 
  | MenhirCell1_PO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRINT = 
  | MenhirCell1_PRINT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.AstSyntax.programme) [@@unboxed]

let _menhir_action_01 =
  fun li ->
    (
# 65 "parser.mly"
                        (li)
# 292 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_02 =
  fun lp n ->
    (
# 82 "parser.mly"
                          (AppelFonction (n,lp))
# 300 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 83 "parser.mly"
                          (Binaire(Fraction,e1,e2))
# 308 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_04 =
  fun n ->
    (
# 84 "parser.mly"
                          (Ident n)
# 316 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_05 =
  fun () ->
    (
# 85 "parser.mly"
                          (Booleen true)
# 324 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun () ->
    (
# 86 "parser.mly"
                          (Booleen false)
# 332 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun e ->
    (
# 87 "parser.mly"
                          (Entier e)
# 340 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun e1 ->
    (
# 88 "parser.mly"
                          (Unaire(Numerateur,e1))
# 348 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun e1 ->
    (
# 89 "parser.mly"
                          (Unaire(Denominateur,e1))
# 356 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e1 e2 ->
    (
# 90 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 364 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 91 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 372 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 92 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 380 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun e1 e2 ->
    (
# 93 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 388 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun exp ->
    (
# 94 "parser.mly"
                          (exp)
# 396 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun e1 e2 e3 ->
    (
# 95 "parser.mly"
                                   (Ternaire (e1,e2,e3))
# 404 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun li lp n t ->
    (
# 61 "parser.mly"
                                          (Fonction(t,n,lp,li))
# 412 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_17 =
  fun e1 n t ->
    (
# 68 "parser.mly"
                                    (Declaration (t,n,e1))
# 420 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_18 =
  fun e1 n ->
    (
# 69 "parser.mly"
                                    (Affectation (n,e1))
# 428 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_19 =
  fun e n ->
    (
# 70 "parser.mly"
                                    (Constante (n,e))
# 436 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_20 =
  fun e1 ->
    (
# 71 "parser.mly"
                                    (Affichage (e1))
# 444 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_21 =
  fun exp li1 li2 ->
    (
# 72 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 452 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_22 =
  fun exp li ->
    (
# 73 "parser.mly"
                                    (TantQue (exp,li))
# 460 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_23 =
  fun exp ->
    (
# 74 "parser.mly"
                                    (Retour (exp))
# 468 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_24 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 476 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_25 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 484 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_26 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 492 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_27 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 500 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_28 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 508 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_29 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 516 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_30 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 524 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_31 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 532 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_32 =
  fun lfi ->
    (
# 57 "parser.mly"
                        (lfi)
# 540 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_33 =
  fun n t ->
    (
# 63 "parser.mly"
                    ((t,n))
# 548 "parser.ml"
     : (Type.typ * string))

let _menhir_action_34 =
  fun lf li ->
    (
# 59 "parser.mly"
                            (Programme (lf,li))
# 556 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_35 =
  fun () ->
    (
# 77 "parser.mly"
          (Bool)
# 564 "parser.ml"
     : (Type.typ))

let _menhir_action_36 =
  fun () ->
    (
# 78 "parser.mly"
          (Int)
# 572 "parser.ml"
     : (Type.typ))

let _menhir_action_37 =
  fun () ->
    (
# 79 "parser.mly"
          (Rat)
# 580 "parser.ml"
     : (Type.typ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AF ->
        "AF"
    | AO ->
        "AO"
    | BOOL ->
        "BOOL"
    | CALL ->
        "CALL"
    | CF ->
        "CF"
    | CO ->
        "CO"
    | COLON ->
        "COLON"
    | CONST ->
        "CONST"
    | DENOM ->
        "DENOM"
    | ELSE ->
        "ELSE"
    | ENTIER _ ->
        "ENTIER"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | FALSE ->
        "FALSE"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | INF ->
        "INF"
    | INT ->
        "INT"
    | MULT ->
        "MULT"
    | NUM ->
        "NUM"
    | PF ->
        "PF"
    | PLUS ->
        "PLUS"
    | PO ->
        "PO"
    | PRINT ->
        "PRINT"
    | PV ->
        "PV"
    | QMARK ->
        "QMARK"
    | RAT ->
        "RAT"
    | RETURN ->
        "RETURN"
    | SLASH ->
        "SLASH"
    | TRUE ->
        "TRUE"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_92 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_34 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let lfi = _v in
          let _v = _menhir_action_32 lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_37 () in
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_36 () in
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_35 () in
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
              | PF ->
                  let _v = _menhir_action_30 () in
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (n, t) = (_v_0, _v) in
          let _v = _menhir_action_33 n t in
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_37 () in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_36 () in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_35 () in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | PF ->
              let _v = _menhir_action_30 () in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_31 x xs in
      _menhir_goto_list_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_param_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | RETURN ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | PRINT ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_36 () in
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | IF ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | ID _v ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13
      | CONST ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_35 () in
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | AF ->
          let _v = _menhir_action_28 () in
          _menhir_run_82 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState14 _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | _ ->
          _eRR ()
  
  and _menhir_run_55 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QMARK ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | ID _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_04 n in
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
          | ENTIER _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_4 in
              let _v = _menhir_action_07 e in
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | ID _v_7 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_7 in
              let _v = _menhir_action_04 n in
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_10 in
              let _v = _menhir_action_07 e in
              _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
          | _ ->
              _eRR ())
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_14 exp in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | ID _v_13 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_13 in
              let _v = _menhir_action_04 n in
              _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_16 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_16 in
              let _v = _menhir_action_07 e in
              _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | ID _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_19 in
              let _v = _menhir_action_04 n in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_22 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_22 in
              let _v = _menhir_action_07 e in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | ID _v_25 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_25 in
              let _v = _menhir_action_04 n in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_28 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_28 in
              let _v = _menhir_action_07 e in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | ID _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_04 n in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_4 in
              let _v = _menhir_action_07 e in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_15 e1 e2 e3 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_e : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState79 ->
          _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState69 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState63 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState60 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState57 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState39 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState37 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState21 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_80 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_17 e1 n t in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_i : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_i (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState84
      | RETURN ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState84
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState84 _tok
      | PRINT ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState84
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_36 () in
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState84 _tok
      | IF ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState84
      | ID _v_2 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState84
      | CONST ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState84
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_35 () in
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState84 _tok
      | AF ->
          let _v = _menhir_action_28 () in
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_57 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
      | _ ->
          _eRR ()
  
  and _menhir_run_58 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_23 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_08 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_09 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
          | ID _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_04 n in
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_4 in
              let _v = _menhir_action_07 e in
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | CF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_CO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_03 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_05 () in
                  _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
              | PO ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
              | NUM ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
              | ID _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_1 in
                  let _v = _menhir_action_04 n in
                  _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
              | ENTIER _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_4 in
                  let _v = _menhir_action_07 e in
                  _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
              | DENOM ->
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
              | CO ->
                  _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
              | CALL ->
                  _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
              | PF ->
                  let _v = _menhir_action_24 () in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | ID _v_1 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_1 in
          let _v = _menhir_action_04 n in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | ENTIER _v_4 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v_4 in
          let _v = _menhir_action_07 e in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | PF ->
          let _v = _menhir_action_24 () in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_25 x xs in
      _menhir_goto_list_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let lp = _v in
      let _v = _menhir_action_02 lp n in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_77 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_05 () in
                  _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PO ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState79
              | NUM ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState79
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_2 in
                  let _v = _menhir_action_04 n in
                  _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ENTIER _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_5 in
                  let _v = _menhir_action_07 e in
                  _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | DENOM ->
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState79
              | CO ->
                  _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState79
              | CALL ->
                  _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState79
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_60 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | _ ->
          _eRR ()
  
  and _menhir_run_61 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_20 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_63 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState63 _tok
      | PO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | NUM ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState63 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState63 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState63 _tok
      | DENOM ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | CO ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | CALL ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | _ ->
          _eRR ()
  
  and _menhir_run_64 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
      | _ ->
          _eRR ()
  
  and _menhir_run_68 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState69
          | NUM ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState69
          | ID _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_04 n in
              _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_4 in
              let _v = _menhir_action_07 e in
              _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState69
          | CO ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState69
          | CALL ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState69
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_70 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, n) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_18 e1 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_72 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ENTIER _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | PV ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (n, e) = (_v, _v_0) in
                      let _v = _menhir_action_19 e n in
                      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_85 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_29 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState84 ->
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState13 ->
          _menhir_run_82 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_82 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_01 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState91 ->
          _menhir_run_92 _menhir_stack _v _tok
      | MenhirState12 ->
          _menhir_run_86 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState66 ->
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState64 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState55 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_86 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list_param_ (_menhir_stack, _, lp) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_16 li lp n t in
      let _menhir_stack = MenhirCell1_fonc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState93 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_36 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState93 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_35 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState93 _tok
      | ID _ ->
          let _v = _menhir_action_26 () in
          _menhir_run_94 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_94 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_27 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState93 ->
          _menhir_run_94 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_90 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_90 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState91
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_67 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_21 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_65 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_56 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_22 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_53 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_12 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_13 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_11 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_10 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_36 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_35 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | ID _ ->
          let _v = _menhir_action_26 () in
          _menhir_run_90 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
