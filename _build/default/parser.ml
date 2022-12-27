
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
    | NULL
    | NEW
    | MULT
    | LOOP
    | INT
    | INF
    | IF
    | ID of (
# 12 "parser.mly"
       (string)
# 34 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENTIER of (
# 11 "parser.mly"
       (int)
# 42 "parser.ml"
  )
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
  
end

include MenhirBasics

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax
open List

# 70 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState004 : (('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 004.
        Stack shape : typ.
        Start symbol: main. *)

  | MenhirState005 : (('s, _menhir_box_main) _menhir_cell1_MULT, _menhir_box_main) _menhir_state
    (** State 005.
        Stack shape : MULT.
        Start symbol: main. *)

  | MenhirState008 : ((('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 008.
        Stack shape : typ r.
        Start symbol: main. *)

  | MenhirState009 : (('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 009.
        Stack shape : typ.
        Start symbol: main. *)

  | MenhirState013 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 013.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState016 : (((('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_cell1_list_param_, _menhir_box_main) _menhir_state
    (** State 016.
        Stack shape : typ r list(param).
        Start symbol: main. *)

  | MenhirState017 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 017.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState018 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 018.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState020 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 020.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState021 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 021.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState024 : (('s, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_state
    (** State 024.
        Stack shape : NEW.
        Start symbol: main. *)

  | MenhirState025 : ((('s, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 025.
        Stack shape : NEW typ.
        Start symbol: main. *)

  | MenhirState030 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 030.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState031 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 031.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState032 : (('s, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_state
    (** State 032.
        Stack shape : CALL.
        Start symbol: main. *)

  | MenhirState034 : ((('s, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 034.
        Stack shape : CALL r.
        Start symbol: main. *)

  | MenhirState035 : (('s, _menhir_box_main) _menhir_cell1_ADR, _menhir_box_main) _menhir_state
    (** State 035.
        Stack shape : ADR.
        Start symbol: main. *)

  | MenhirState040 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 040.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState043 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 043.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState049 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 049.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState051 : (((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 051.
        Stack shape : PO e e.
        Start symbol: main. *)

  | MenhirState054 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 054.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState058 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 058.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState061 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 061.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState064 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 064.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState067 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 067.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState069 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 069.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState072 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 072.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState076 : (('s, _menhir_box_main) _menhir_cell1_PLUS, _menhir_box_main) _menhir_state
    (** State 076.
        Stack shape : PLUS.
        Start symbol: main. *)

  | MenhirState079 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 079.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState080 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 080.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState082 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 082.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState087 : (('s, _menhir_box_main) _menhir_cell1_CONTINUE, _menhir_box_main) _menhir_state
    (** State 087.
        Stack shape : CONTINUE.
        Start symbol: main. *)

  | MenhirState091 : (('s, _menhir_box_main) _menhir_cell1_CONST, _menhir_box_main) _menhir_state
    (** State 091.
        Stack shape : CONST.
        Start symbol: main. *)

  | MenhirState096 : (('s, _menhir_box_main) _menhir_cell1_BREAK, _menhir_box_main) _menhir_state
    (** State 096.
        Stack shape : BREAK.
        Start symbol: main. *)

  | MenhirState099 : (('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_state
    (** State 099.
        Stack shape : typ.
        Start symbol: main. *)

  | MenhirState101 : ((('s, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 101.
        Stack shape : typ r.
        Start symbol: main. *)

  | MenhirState108 : (('s, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 108.
        Stack shape : r.
        Start symbol: main. *)

  | MenhirState111 : (('s, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_state
    (** State 111.
        Stack shape : r.
        Start symbol: main. *)

  | MenhirState115 : (('s, _menhir_box_main) _menhir_cell1_option_idC_, _menhir_box_main) _menhir_state
    (** State 115.
        Stack shape : option(idC).
        Start symbol: main. *)

  | MenhirState121 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 121.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState128 : (('s, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 128.
        Stack shape : list(fonc) ID.
        Start symbol: main. *)

  | MenhirState130 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 130.
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

and ('s, 'r) _menhir_cell1_option_idC_ = 
  | MenhirCell1_option_idC_ of 's * ('s, 'r) _menhir_state * (string option)

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

and ('s, 'r) _menhir_cell1_BREAK = 
  | MenhirCell1_BREAK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CALL = 
  | MenhirCell1_CALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CO = 
  | MenhirCell1_CO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CONST = 
  | MenhirCell1_CONST of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CONTINUE = 
  | MenhirCell1_CONTINUE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DENOM = 
  | MenhirCell1_DENOM of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 12 "parser.mly"
       (string)
# 352 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MULT = 
  | MenhirCell1_MULT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NEW = 
  | MenhirCell1_NEW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NUM = 
  | MenhirCell1_NUM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

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
# 82 "parser.mly"
                        (li)
# 390 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_02 =
  fun lp n ->
    (
# 115 "parser.mly"
                                    (AppelFonction (n,lp))
# 398 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 116 "parser.mly"
                                    (Binaire(Fraction,e1,e2))
# 406 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_04 =
  fun () ->
    (
# 118 "parser.mly"
                                    (Booleen true)
# 414 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_05 =
  fun () ->
    (
# 119 "parser.mly"
                                    (Booleen false)
# 422 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun e ->
    (
# 120 "parser.mly"
                                    (Entier e)
# 430 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun e1 ->
    (
# 121 "parser.mly"
                                    (Unaire(Numerateur,e1))
# 438 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun e1 ->
    (
# 122 "parser.mly"
                                    (Unaire(Denominateur,e1))
# 446 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun e1 e2 ->
    (
# 123 "parser.mly"
                                    (Binaire (Plus,e1,e2))
# 454 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e1 e2 ->
    (
# 124 "parser.mly"
                                    (Binaire (Mult,e1,e2))
# 462 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 125 "parser.mly"
                                    (Binaire (Equ,e1,e2))
# 470 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 126 "parser.mly"
                                    (Binaire (Inf,e1,e2))
# 478 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun exp ->
    (
# 127 "parser.mly"
                                    (exp)
# 486 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun r1 ->
    (
# 128 "parser.mly"
                                    (Identifiant(r1))
# 494 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun ladr t ->
    (
# 130 "parser.mly"
                                    (New (t, fold_left (fun x _ -> Pointeur(x)) Neant ladr))
# 502 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun () ->
    (
# 131 "parser.mly"
                                    (NULL)
# 510 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_17 =
  fun ident ->
    (
# 132 "parser.mly"
                                    (Adr(ident))
# 518 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_18 =
  fun e1 e2 e3 ->
    (
# 134 "parser.mly"
                                    (Ternaire (e1,e2,e3))
# 526 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_19 =
  fun li lp n t ->
    (
# 78 "parser.mly"
                                         (Fonction(t,n,lp,li))
# 534 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_20 =
  fun e1 n t ->
    (
# 88 "parser.mly"
                                    (Declaration (t,n,e1))
# 542 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_21 =
  fun e1 n ->
    (
# 89 "parser.mly"
                                    (Affectation (n,e1))
# 550 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_22 =
  fun e n ->
    (
# 90 "parser.mly"
                                    (Constante (n,e))
# 558 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_23 =
  fun e1 ->
    (
# 91 "parser.mly"
                                    (Affichage (e1))
# 566 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_24 =
  fun exp li1 li2 ->
    (
# 92 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 574 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_25 =
  fun exp li1 ->
    (
# 94 "parser.mly"
                                    (Conditionnelle (exp,li1,[]))
# 582 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_26 =
  fun exp li ->
    (
# 95 "parser.mly"
                                    (TantQue (exp,li))
# 590 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_27 =
  fun exp ->
    (
# 96 "parser.mly"
                                    (Retour (exp))
# 598 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_28 =
  fun e1 n ->
    (
# 98 "parser.mly"
                                    (Affectation (n,Binaire (Plus,Identifiant n,e1)))
# 606 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_29 =
  fun n ->
    (
# 100 "parser.mly"
                                    (Affectation (n,Binaire (Plus,Identifiant n,Entier 1)))
# 614 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_30 =
  fun n ->
    (
# 101 "parser.mly"
                                    (Affectation (n,Binaire (Plus,Identifiant n,Entier 1)))
# 622 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_31 =
  fun li n ->
    (
# 103 "parser.mly"
                                    (Boucle(n,li))
# 630 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_32 =
  fun n ->
    (
# 104 "parser.mly"
                                    (Break(n))
# 638 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_33 =
  fun n ->
    (
# 105 "parser.mly"
                                    (Continue(n))
# 646 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_34 =
  fun n ->
    (
# 85 "parser.mly"
                        (n)
# 654 "parser.ml"
     : (string))

let _menhir_action_35 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 662 "parser.ml"
     : (unit list))

let _menhir_action_36 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 670 "parser.ml"
     : (unit list))

let _menhir_action_37 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 678 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_38 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 686 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_39 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 694 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_40 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 702 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_41 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 710 "parser.ml"
     : (Ast.AstSyntax.instruction list))

let _menhir_action_42 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 718 "parser.ml"
     : (Ast.AstSyntax.instruction list))

let _menhir_action_43 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 726 "parser.ml"
     : ((Type.typ * Ast.AstSyntax.identifiant) list))

let _menhir_action_44 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 734 "parser.ml"
     : ((Type.typ * Ast.AstSyntax.identifiant) list))

let _menhir_action_45 =
  fun lfi ->
    (
# 69 "parser.mly"
                        (lfi)
# 742 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_46 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 750 "parser.ml"
     : (string option))

let _menhir_action_47 =
  fun x ->
    (
# 113 "<standard.mly>"
    ( Some x )
# 758 "parser.ml"
     : (string option))

let _menhir_action_48 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 766 "parser.ml"
     : (string option))

let _menhir_action_49 =
  fun x ->
    (
# 113 "<standard.mly>"
    ( Some x )
# 774 "parser.ml"
     : (string option))

let _menhir_action_50 =
  fun n t ->
    (
# 80 "parser.mly"
                   ((t,n))
# 782 "parser.ml"
     : (Type.typ * Ast.AstSyntax.identifiant))

let _menhir_action_51 =
  fun lf li ->
    (
# 71 "parser.mly"
                            (Programme (lf,li))
# 790 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_52 =
  fun ident ladr ->
    (
# 76 "parser.mly"
                         ((ident, fold_left (fun x _ -> Pointeur(x)) Neant ladr))
# 798 "parser.ml"
     : (Ast.AstSyntax.identifiant))

let _menhir_action_53 =
  fun () ->
    (
# 109 "parser.mly"
              (Bool)
# 806 "parser.ml"
     : (Type.typ))

let _menhir_action_54 =
  fun () ->
    (
# 110 "parser.mly"
              (Int)
# 814 "parser.ml"
     : (Type.typ))

let _menhir_action_55 =
  fun () ->
    (
# 111 "parser.mly"
              (Rat)
# 822 "parser.ml"
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
    | BREAK ->
        "BREAK"
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
    | CONTINUE ->
        "CONTINUE"
    | DEFINE ->
        "DEFINE"
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
    | LOOP ->
        "LOOP"
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
  
  let rec _menhir_run_129 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_51 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let lfi = _v in
          let _v = _menhir_action_45 lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState004 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MULT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | ID _ | PF ->
          let _v = _menhir_action_35 () in
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_MULT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MULT (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_36 x xs in
      _menhir_goto_list_MULT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_MULT_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState004 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState121 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState017 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState108 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState069 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState054 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState020 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState031 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState032 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState035 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_026 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_typ (_menhir_stack, _, t) = _menhir_stack in
          let MenhirCell1_NEW (_menhir_stack, _menhir_s) = _menhir_stack in
          let ladr = _v in
          let _v = _menhir_action_15 ladr t in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_e : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState111 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState108 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState054 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState051 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState049 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState020 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState030 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState043 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState031 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_112 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_r (_menhir_stack, _menhir_s, n) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_21 e1 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_i : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_i (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | RETURN ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState121 _tok
      | PRINT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | PLUS ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState121 _tok
      | IF ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | DEFINE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | CONTINUE ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | CONST ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | BREAK ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState121 _tok
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState121 _tok
      | AF ->
          let _v = _menhir_action_41 () in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | LOOP ->
          let _v = _menhir_action_48 () in
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState121 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
      | _ ->
          _eRR ()
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | RETURN ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | PRINT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | PLUS ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | IF ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | DEFINE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | CONTINUE ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | CONST ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | BREAK ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | AF ->
          let _v = _menhir_action_41 () in
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | LOOP ->
          let _v = _menhir_action_48 () in
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState069 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_27 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_020 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QMARK ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | ENTIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_3 in
              let _v = _menhir_action_06 e in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_9 in
              let _v = _menhir_action_06 e in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState054 _tok
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
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_15 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_15 in
              let _v = _menhir_action_06 e in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_21 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_21 in
              let _v = _menhir_action_06 e in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState061 _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_27 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_27 in
              let _v = _menhir_action_06 e in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState064 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_050 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_3 in
              let _v = _menhir_action_06 e in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_18 e1 e2 e3 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_07 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NEW (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_55 () in
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState024 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_54 () in
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState024 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_53 () in
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState024 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_NEW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | PF ->
          let _v = _menhir_action_35 () in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_046 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_08 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState031 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState031 _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState031 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState031 _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState031 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_3 in
              let _v = _menhir_action_06 e in
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState043 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (ladr, ident) = (_v, _v_0) in
          let _v = _menhir_action_52 ident ladr in
          _menhir_goto_r _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_r : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState121 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState017 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState111 ->
          _menhir_run_037_spec_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState108 ->
          _menhir_run_037_spec_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState101 ->
          _menhir_run_037_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState079 ->
          _menhir_run_037_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState072 ->
          _menhir_run_037_spec_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_037_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_037_spec_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState064 ->
          _menhir_run_037_spec_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_037_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_037_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState054 ->
          _menhir_run_037_spec_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState051 ->
          _menhir_run_037_spec_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState049 ->
          _menhir_run_037_spec_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState020 ->
          _menhir_run_037_spec_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState021 ->
          _menhir_run_037_spec_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState030 ->
          _menhir_run_037_spec_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState043 ->
          _menhir_run_037_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState031 ->
          _menhir_run_037_spec_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState040 ->
          _menhir_run_037_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState034 ->
          _menhir_run_037_spec_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState035 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState032 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState004 ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_104 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PLUS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v in
                  let _v = _menhir_action_30 n in
                  _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | EQUAL ->
              let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_04 () in
                  _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PO ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | NUM ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | NULL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_16 () in
                  _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | NEW ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | MULT ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_05 () in
                  _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ENTIER _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_3 in
                  let _v = _menhir_action_06 e in
                  _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | DENOM ->
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | CO ->
                  _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | CALL ->
                  _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | ADR ->
                  _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
              | ID _ ->
                  let _v = _menhir_action_35 () in
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState108 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_9 in
              let _v = _menhir_action_06 e in
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_109 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_r (_menhir_stack, _menhir_s, n) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_28 e1 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ADR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_3 in
              let _v = _menhir_action_06 e in
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_r (_menhir_stack, _, n) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_20 e1 n t in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CONST -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
                  let _v = _menhir_action_22 e n in
                  _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PLUS -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PLUS (_menhir_stack, _menhir_s) = _menhir_stack in
          let n = _v in
          let _v = _menhir_action_29 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_037_spec_111 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_108 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_101 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_079 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
  
  and _menhir_run_080 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
      | _ ->
          _eRR ()
  
  and _menhir_run_037_spec_072 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_23 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_037_spec_069 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_018 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
  
  and _menhir_run_037_spec_064 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_065 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_037_spec_061 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_062 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_037_spec_058 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_059 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_037_spec_054 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_055 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_037_spec_051 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_049 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
  
  and _menhir_run_037_spec_020 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
  
  and _menhir_run_037_spec_021 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_030 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_043 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_031 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState031 _tok
  
  and _menhir_run_037_spec_040 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState040 _tok
  
  and _menhir_run_040 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState040 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState040 _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState040 _tok
      | ENTIER _v_3 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v_3 in
          let _v = _menhir_action_06 e in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState040 _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState040 _tok
      | PF ->
          let _v = _menhir_action_37 () in
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_38 x xs in
      _menhir_goto_list_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState040 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState034 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_r (_menhir_stack, _, n) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let lp = _v in
      let _v = _menhir_action_02 lp n in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037_spec_034 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CALL, _menhir_box_main) _menhir_cell1_r -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let r1 = _v in
      let _v = _menhir_action_14 r1 in
      _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
  
  and _menhir_run_036 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ADR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ADR (_menhir_stack, _menhir_s) = _menhir_stack in
      let ident = _v in
      let _v = _menhir_action_17 ident in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_033 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CALL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
          | NEW ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
          | ENTIER _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_3 in
              let _v = _menhir_action_06 e in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
          | DENOM ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | CO ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | CALL ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | ADR ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState034 _tok
          | PF ->
              let _v = _menhir_action_37 () in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_010 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let n = _v in
      let _v = _menhir_action_50 n t in
      let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
      | PF ->
          let _v = _menhir_action_43 () in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_009 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_44 x xs in
      _menhir_goto_list_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState008 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState013 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_015 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_param_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_r (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_55 () in
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState008 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_54 () in
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState008 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_53 () in
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState008 _tok
          | PF ->
              let _v = _menhir_action_43 () in
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState008
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState099 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState072 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MULT ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState076
          | ID _ ->
              let _v = _menhir_action_35 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState076 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
      | NEW ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
      | DENOM ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | CO ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | CALL ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | ADR ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_34 n in
              let x = _v in
              let _v = _menhir_action_49 x in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_114 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_option_idC_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LOOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CONTINUE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_47 x in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PV ->
          let _v = _menhir_action_46 () in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CONTINUE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CONTINUE (_menhir_stack, _menhir_s) = _menhir_stack in
          let n = _v in
          let _v = _menhir_action_33 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | ID _ ->
          let _v = _menhir_action_35 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState091 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_BREAK (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_47 x in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PV ->
          let _v = _menhir_action_46 () in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BREAK -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_BREAK (_menhir_stack, _menhir_s) = _menhir_stack in
          let n = _v in
          let _v = _menhir_action_32 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_118 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_01 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState128 ->
          _menhir_run_129 _menhir_stack _v _tok
      | MenhirState016 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState082 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState080 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_123 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_typ, _menhir_box_main) _menhir_cell1_r, _menhir_box_main) _menhir_cell1_list_param_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list_param_ (_menhir_stack, _, lp) = _menhir_stack in
      let MenhirCell1_r (_menhir_stack, _, n) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_19 li lp n t in
      let _menhir_stack = MenhirCell1_fonc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState130 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState130 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState130 _tok
      | ID _ ->
          let _v = _menhir_action_39 () in
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_131 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_40 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState130 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_127 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_116 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_option_idC_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_option_idC_ (_menhir_stack, _menhir_s, n) = _menhir_stack in
          let li = _v in
          let _v = _menhir_action_31 li n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_24 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_081 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
          | _ ->
              _eRR ())
      | AF | BOOL | BREAK | CONST | CONTINUE | DEFINE | ID _ | IF | INT | LOOP | MULT | PLUS | PRINT | RAT | RETURN | WHILE ->
          let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let li1 = _v in
          let _v = _menhir_action_25 exp li1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_26 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_122 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_42 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState121 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState017 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | ID _ ->
          let _v = _menhir_action_39 () in
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
