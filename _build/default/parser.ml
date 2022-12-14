
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
    | PV
    | PRINT
    | PO
    | PLUS
    | PF
    | NUM
    | NULL
    | NEW
    | MULT
    | INT
    | INF
    | IF
    | ID of (
# 11 "parser.mly"
       (string)
# 32 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 40 "parser.ml"
  )
    | ELSE
    | DENOM
    | CONST
    | CO
    | CF
    | CALL
    | BOOL
    | AO
    | AF
    | ADR
  
end

include MenhirBasics

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 63 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState04 : (('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 04.
        Stack shape : typ.
        Start symbol: main. *)

  | MenhirState05 : (('s, _menhir_box_main) _menhir_cell1_MULT, _menhir_box_main) _menhir_state
    (** State 05.
        Stack shape : MULT.
        Start symbol: main. *)

  | MenhirState09 : ((('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 09.
        Stack shape : typ r.
        Start symbol: main. *)

  | MenhirState10 : (('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 10.
        Stack shape : typ.
        Start symbol: main. *)

  | MenhirState12 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 12.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState15 : (((('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_cell1_list_param_, _menhir_box_main) _menhir_state
    (** State 15.
        Stack shape : typ r list(param).
        Start symbol: main. *)

  | MenhirState16 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState17 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 17.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState19 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 19.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState20 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 20.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState22 : (('s, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_state
    (** State 22.
        Stack shape : NEW.
        Start symbol: main. *)

  | MenhirState26 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 26.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState27 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 27.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState28 : (('s, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_state
    (** State 28.
        Stack shape : CALL.
        Start symbol: main. *)

  | MenhirState30 : ((('s, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 30.
        Stack shape : CALL r.
        Start symbol: main. *)

  | MenhirState31 : (('s, _menhir_box_main) _menhir_cell1_ADR, _menhir_box_main) _menhir_state
    (** State 31.
        Stack shape : ADR.
        Start symbol: main. *)

  | MenhirState36 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 36.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState39 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 39.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState45 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 45.
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

  | MenhirState55 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 55.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState58 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 58.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState60 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 60.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState63 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 63.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState66 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 66.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState67 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 67.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState69 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 69.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState71 : (('s, _menhir_box_main) _menhir_cell1_CONST, _menhir_box_main) _menhir_state
    (** State 71.
        Stack shape : CONST.
        Start symbol: main. *)

  | MenhirState76 : (('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 76.
        Stack shape : typ.
        Start symbol: main. *)

  | MenhirState78 : ((('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 78.
        Stack shape : typ r.
        Start symbol: main. *)

  | MenhirState82 : (('s, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 82.
        Stack shape : r.
        Start symbol: main. *)

  | MenhirState87 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 87.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState94 : (('s, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 94.
        Stack shape : list(fonc) ID.
        Start symbol: main. *)

  | MenhirState96 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 96.
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
  | MenhirCell1_list_param_ of 's * ('s, 'r) _menhir_state * ((Type.typ * Ast.AstSyntax.identifiant) list)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Type.typ * Ast.AstSyntax.identifiant)

and ('s, 'r) _menhir_cell1_r = 
  | MenhirCell1_r of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.identifiant)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Type.typ)

and ('s, 'r) _menhir_cell1_ADR = 
  | MenhirCell1_ADR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_AO = 
  | MenhirCell1_AO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CALL = 
  | MenhirCell1_CALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CO = 
  | MenhirCell1_CO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CONST = 
  | MenhirCell1_CONST of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DENOM = 
  | MenhirCell1_DENOM of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (string)
# 296 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MULT = 
  | MenhirCell1_MULT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NEW = 
  | MenhirCell1_NEW of 's * ('s, 'r) _menhir_state

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
# 71 "parser.mly"
                        (li)
# 331 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_02 =
  fun lp n ->
    (
# 89 "parser.mly"
                         (AppelFonction (n,lp))
# 339 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 90 "parser.mly"
                          (Binaire(Fraction,e1,e2))
# 347 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_04 =
  fun () ->
    (
# 92 "parser.mly"
                          (Booleen true)
# 355 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_05 =
  fun () ->
    (
# 93 "parser.mly"
                          (Booleen false)
# 363 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun e ->
    (
# 94 "parser.mly"
                          (Entier e)
# 371 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun e1 ->
    (
# 95 "parser.mly"
                          (Unaire(Numerateur,e1))
# 379 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun e1 ->
    (
# 96 "parser.mly"
                          (Unaire(Denominateur,e1))
# 387 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun e1 e2 ->
    (
# 97 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 395 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e1 e2 ->
    (
# 98 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 403 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 99 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 411 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 100 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 419 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun exp ->
    (
# 101 "parser.mly"
                          (exp)
# 427 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun t ->
    (
# 103 "parser.mly"
                          (New (t))
# 435 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun () ->
    (
# 104 "parser.mly"
                          (NULL)
# 443 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun ident ->
    (
# 105 "parser.mly"
                          (Adr(ident))
# 451 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_17 =
  fun r1 ->
    (
# 106 "parser.mly"
                          (Identifiant(r1))
# 459 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_18 =
  fun li lp n t ->
    (
# 67 "parser.mly"
                                         (Fonction(t,n,lp,li))
# 467 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_19 =
  fun e1 n t ->
    (
# 74 "parser.mly"
                                    (Declaration (t,n,e1))
# 475 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_20 =
  fun e1 n ->
    (
# 75 "parser.mly"
                                    (Affectation (n,e1))
# 483 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_21 =
  fun e n ->
    (
# 76 "parser.mly"
                                    (Constante (n,e))
# 491 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_22 =
  fun e1 ->
    (
# 77 "parser.mly"
                                    (Affichage (e1))
# 499 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_23 =
  fun exp li1 li2 ->
    (
# 78 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 507 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_24 =
  fun exp li ->
    (
# 79 "parser.mly"
                                    (TantQue (exp,li))
# 515 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_25 =
  fun exp ->
    (
# 80 "parser.mly"
                                    (Retour (exp))
# 523 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_26 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 531 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_27 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 539 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_28 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 547 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_29 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 555 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_30 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 563 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_31 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 571 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_32 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 579 "parser.ml"
     : ((Type.typ * Ast.AstSyntax.identifiant) list))

let _menhir_action_33 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 587 "parser.ml"
     : ((Type.typ * Ast.AstSyntax.identifiant) list))

let _menhir_action_34 =
  fun lfi ->
    (
# 59 "parser.mly"
                        (lfi)
# 595 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_35 =
  fun n t ->
    (
# 69 "parser.mly"
                   ((t,n))
# 603 "parser.ml"
     : (Type.typ * Ast.AstSyntax.identifiant))

let _menhir_action_36 =
  fun lf li ->
    (
# 61 "parser.mly"
                            (Programme (lf,li))
# 611 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_37 =
  fun ident ->
    (
# 64 "parser.mly"
                          (Symbole ident)
# 619 "parser.ml"
     : (Ast.AstSyntax.identifiant))

let _menhir_action_38 =
  fun r1 ->
    (
# 65 "parser.mly"
                          (Pointeur(r1))
# 627 "parser.ml"
     : (Ast.AstSyntax.identifiant))

let _menhir_action_39 =
  fun () ->
    (
# 83 "parser.mly"
              (Bool)
# 635 "parser.ml"
     : (Type.typ))

let _menhir_action_40 =
  fun () ->
    (
# 84 "parser.mly"
              (Int)
# 643 "parser.ml"
     : (Type.typ))

let _menhir_action_41 =
  fun () ->
    (
# 85 "parser.mly"
              (Rat)
# 651 "parser.ml"
     : (Type.typ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADR ->
        "ADR"
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
    | NEW ->
        "NEW"
    | NULL ->
        "NULL"
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
  
  let rec _menhir_run_95 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_36 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let lfi = _v in
          let _v = _menhir_action_34 lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v_0 in
          let _v = _menhir_action_37 ident in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MULT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_MULT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MULT (_menhir_stack, _menhir_s) = _menhir_stack in
      let r1 = _v in
      let _v = _menhir_action_38 r1 in
      _menhir_goto_r _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_r : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState87 ->
          _menhir_run_81 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_81 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState71 ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState82 ->
          _menhir_run_33_spec_82 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState78 ->
          _menhir_run_33_spec_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState66 ->
          _menhir_run_33_spec_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState63 ->
          _menhir_run_33_spec_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState60 ->
          _menhir_run_33_spec_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_33_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState55 ->
          _menhir_run_33_spec_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState52 ->
          _menhir_run_33_spec_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState49 ->
          _menhir_run_33_spec_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState45 ->
          _menhir_run_33_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState19 ->
          _menhir_run_33_spec_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_33_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_33_spec_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState39 ->
          _menhir_run_33_spec_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_33_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState36 ->
          _menhir_run_33_spec_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState30 ->
          _menhir_run_33_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_81 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_2 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_82 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_06 e in
              _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_83 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_r (_menhir_stack, _menhir_s, n) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_20 e1 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_i : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_i (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState87
      | RETURN ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState87
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState87 _tok
      | PRINT ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState87
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState87
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState87 _tok
      | IF ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState87
      | ID _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v_2 in
          let _v = _menhir_action_37 ident in
          _menhir_run_81 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState87 _tok
      | CONST ->
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState87
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState87 _tok
      | AF ->
          let _v = _menhir_action_30 () in
          _menhir_run_88 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | _ ->
          _eRR ()
  
  and _menhir_run_58 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | RETURN ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | PRINT ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | IF ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_81 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | CONST ->
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
      | AF ->
          let _v = _menhir_action_30 () in
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_60 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState60
      | _ ->
          _eRR ()
  
  and _menhir_run_61 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_25 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_2 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_06 e in
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | _ ->
              _eRR ())
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_13 exp in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | ID _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_9 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_12 in
              let _v = _menhir_action_06 e in
              _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | ID _v_16 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_16 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_19 in
              let _v = _menhir_action_06 e in
              _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState52
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | ID _v_23 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_23 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_26 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_26 in
              let _v = _menhir_action_06 e in
              _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_09 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_e : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState82 ->
          _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState78 ->
          _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState66 ->
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState63 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState60 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState55 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState52 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState45 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState19 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState39 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_79 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_r (_menhir_stack, _, n) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_19 e1 n t in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_67 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState67
      | _ ->
          _eRR ()
  
  and _menhir_run_64 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_22 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_56 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
          let _v = _menhir_action_10 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_07 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_08 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_40 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_38 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_2 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_06 e in
              _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NEW (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NEW -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NEW (_menhir_stack, _menhir_s) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_14 t in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33_spec_20 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | _ ->
          _eRR ()
  
  and _menhir_run_33_spec_26 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_27 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | _ ->
          _eRR ()
  
  and _menhir_run_33_spec_27 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
  
  and _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CALL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_2 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_06 e in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | PF ->
              let _v = _menhir_action_26 () in
              _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | ID _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v_2 in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | ENTIER _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v_5 in
          let _v = _menhir_action_06 e in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | PF ->
          let _v = _menhir_action_26 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_33_spec_36 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
  
  and _menhir_run_31 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ADR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ADR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ADR (_menhir_stack, _menhir_s) = _menhir_stack in
      let ident = _v in
      let _v = _menhir_action_16 ident in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_37 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_27 x xs in
      _menhir_goto_list_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState30 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_r (_menhir_stack, _, n) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let lp = _v in
      let _v = _menhir_action_02 lp n in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33_spec_30 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
  
  and _menhir_run_33_spec_39 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_33_spec_45 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_33_spec_49 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_33_spec_52 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_33_spec_55 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_33_spec_19 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
  
  and _menhir_run_33_spec_60 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_76 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState76
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v_0 in
          let _v = _menhir_action_37 ident in
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState76 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_77 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | NUM ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_15 () in
              _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | MULT ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ident = _v_2 in
              let _v = _menhir_action_37 ident in
              _menhir_run_33_spec_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_06 e in
              _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | CO ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | CALL ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | ADR ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_33_spec_78 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_63 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
      | _ ->
          _eRR ()
  
  and _menhir_run_33_spec_63 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_66 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState66 _tok
      | PO ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | NUM ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_15 () in
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState66 _tok
      | NEW ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_33_spec_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState66 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState66 _tok
      | DENOM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | CO ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | CALL ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | ADR ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
      | _ ->
          _eRR ()
  
  and _menhir_run_33_spec_66 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState66 _tok
  
  and _menhir_run_71 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState71
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v in
          let _v = _menhir_action_37 ident in
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_72 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CONST -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ENTIER _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let MenhirCell1_CONST (_menhir_stack, _menhir_s) = _menhir_stack in
                  let (e, n) = (_v_0, _v) in
                  let _v = _menhir_action_21 e n in
                  _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_85 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_01 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState94 ->
          _menhir_run_95 _menhir_stack _v _tok
      | MenhirState15 ->
          _menhir_run_89 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState69 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState67 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_89 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_cell1_list_param_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list_param_ (_menhir_stack, _, lp) = _menhir_stack in
      let MenhirCell1_r (_menhir_stack, _, n) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_18 li lp n t in
      let _menhir_stack = MenhirCell1_fonc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState96 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState96 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState96 _tok
      | ID _ ->
          let _v = _menhir_action_28 () in
          _menhir_run_97 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_97 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_29 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState96 ->
          _menhir_run_97 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_93 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_93 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState94
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_70 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_23 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_68 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState69
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_59 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_24 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33_spec_17 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
  
  and _menhir_run_88 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_31 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState87 ->
          _menhir_run_88 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState16 ->
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33_spec_82 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_17 r1 in
      _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let n = _v in
      let _v = _menhir_action_35 n t in
      let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
      | PF ->
          let _v = _menhir_action_32 () in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let ident = _v_0 in
          let _v = _menhir_action_37 ident in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_33 x xs in
      _menhir_goto_list_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState09 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState12 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_14 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_param_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_41 () in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_40 () in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_39 () in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | PF ->
              let _v = _menhir_action_32 () in
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | ID _ ->
          let _v = _menhir_action_28 () in
          _menhir_run_93 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
