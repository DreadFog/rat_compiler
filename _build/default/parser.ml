
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
    | LOOP
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
  
end

include MenhirBasics

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 65 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState006 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 006.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState009 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 009.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState012 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_, _menhir_box_main) _menhir_state
    (** State 012.
        Stack shape : typ ID list(param).
        Start symbol: main. *)

  | MenhirState013 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 013.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState014 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 014.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState016 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 016.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState017 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 017.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState021 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 021.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState022 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 022.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState025 : (('s, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 025.
        Stack shape : CALL ID.
        Start symbol: main. *)

  | MenhirState028 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 028.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState031 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 031.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState037 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 037.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState039 : (((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 039.
        Stack shape : PO e e.
        Start symbol: main. *)

  | MenhirState042 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 042.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState046 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 046.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState049 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 049.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState052 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 052.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState055 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 055.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState057 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 057.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState060 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 060.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState067 : (('s, _menhir_box_main) _menhir_cell1_LOOP, _menhir_box_main) _menhir_state
    (** State 067.
        Stack shape : LOOP.
        Start symbol: main. *)

  | MenhirState069 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 069.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState070 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 070.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState072 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 072.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState078 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 078.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState081 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 081.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState085 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 085.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState102 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 102.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState107 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 107.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState114 : (('s, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 114.
        Stack shape : list(fonc) ID.
        Start symbol: main. *)

  | MenhirState116 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 116.
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
# 274 "parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (string)
# 281 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LOOP = 
  | MenhirCell1_LOOP of 's * ('s, 'r) _menhir_state

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
# 69 "parser.mly"
                        (li)
# 313 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_02 =
  fun lp n ->
    (
# 102 "parser.mly"
                          (AppelFonction (n,lp))
# 321 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_03 =
  fun e1 e2 ->
    (
# 103 "parser.mly"
                          (Binaire(Fraction,e1,e2))
# 329 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_04 =
  fun n ->
    (
# 104 "parser.mly"
                          (Ident n)
# 337 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_05 =
  fun () ->
    (
# 105 "parser.mly"
                          (Booleen true)
# 345 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun () ->
    (
# 106 "parser.mly"
                          (Booleen false)
# 353 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun e ->
    (
# 107 "parser.mly"
                          (Entier e)
# 361 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun e1 ->
    (
# 108 "parser.mly"
                          (Unaire(Numerateur,e1))
# 369 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun e1 ->
    (
# 109 "parser.mly"
                          (Unaire(Denominateur,e1))
# 377 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e1 e2 ->
    (
# 110 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 385 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 111 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 393 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 112 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 401 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun e1 e2 ->
    (
# 113 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 409 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun exp ->
    (
# 114 "parser.mly"
                          (exp)
# 417 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun e1 e2 e3 ->
    (
# 116 "parser.mly"
                                   (Ternaire (e1,e2,e3))
# 425 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun li lp n t ->
    (
# 65 "parser.mly"
                                          (Fonction(t,n,lp,li))
# 433 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_17 =
  fun e1 n t ->
    (
# 72 "parser.mly"
                                    (Declaration (t,n,e1))
# 441 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_18 =
  fun e1 n ->
    (
# 73 "parser.mly"
                                    (Affectation (n,e1))
# 449 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_19 =
  fun e n ->
    (
# 74 "parser.mly"
                                    (Constante (n,e))
# 457 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_20 =
  fun e1 ->
    (
# 75 "parser.mly"
                                    (Affichage (e1))
# 465 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_21 =
  fun exp li1 li2 ->
    (
# 76 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 473 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_22 =
  fun exp li1 ->
    (
# 78 "parser.mly"
                                    (Conditionnelle (exp,li1,[]))
# 481 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_23 =
  fun exp li ->
    (
# 79 "parser.mly"
                                    (TantQue (exp,li))
# 489 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_24 =
  fun exp ->
    (
# 80 "parser.mly"
                                    (Retour (exp))
# 497 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_25 =
  fun e1 n ->
    (
# 82 "parser.mly"
                                    (Affectation (n,Binaire (Plus,Ident n,e1)))
# 505 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_26 =
  fun n ->
    (
# 84 "parser.mly"
                                    (Affectation (n,Binaire (Plus,Ident n,Entier 1)))
# 513 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_27 =
  fun n ->
    (
# 85 "parser.mly"
                                    (Affectation (n,Binaire (Plus,Ident n,Entier 1)))
# 521 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_28 =
  fun li n ->
    (
# 87 "parser.mly"
                                    (Boucle(Some(n),li))
# 529 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_29 =
  fun li ->
    (
# 88 "parser.mly"
                                    (Boucle(None,li))
# 537 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_30 =
  fun n ->
    (
# 89 "parser.mly"
                                    (Break(Some(n)))
# 545 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_31 =
  fun () ->
    (
# 90 "parser.mly"
                                    (Break(None))
# 553 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_32 =
  fun n ->
    (
# 91 "parser.mly"
                                    (Continue(Some(n)))
# 561 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_33 =
  fun () ->
    (
# 92 "parser.mly"
                                    (Continue(None))
# 569 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_34 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 577 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_35 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 585 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_36 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 593 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_37 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 601 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_38 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 609 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_39 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 617 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_40 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 625 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_41 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 633 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_42 =
  fun lfi ->
    (
# 61 "parser.mly"
                        (lfi)
# 641 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_43 =
  fun n t ->
    (
# 67 "parser.mly"
                    ((t,n))
# 649 "parser.ml"
     : (Type.typ * string))

let _menhir_action_44 =
  fun lf li ->
    (
# 63 "parser.mly"
                            (Programme (lf,li))
# 657 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_45 =
  fun () ->
    (
# 97 "parser.mly"
          (Bool)
# 665 "parser.ml"
     : (Type.typ))

let _menhir_action_46 =
  fun () ->
    (
# 98 "parser.mly"
          (Int)
# 673 "parser.ml"
     : (Type.typ))

let _menhir_action_47 =
  fun () ->
    (
# 99 "parser.mly"
          (Rat)
# 681 "parser.ml"
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
  
  let rec _menhir_run_115 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_44 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let lfi = _v in
          let _v = _menhir_action_42 lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
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
                  let _v = _menhir_action_47 () in
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState006 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_46 () in
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState006 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_45 () in
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState006 _tok
              | PF ->
                  let _v = _menhir_action_40 () in
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState006
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (n, t) = (_v_0, _v) in
          let _v = _menhir_action_43 n t in
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_47 () in
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_46 () in
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_45 () in
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
          | PF ->
              let _v = _menhir_action_40 () in
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_010 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_41 x xs in
      _menhir_goto_list_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState006 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState009 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_011 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_param_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState012
      | _ ->
          _eRR ()
  
  and _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | RETURN ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
      | PRINT ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | PLUS ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | LOOP ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_46 () in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
      | IF ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | ID _v ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013
      | CONTINUE ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | CONST ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | BREAK ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_45 () in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
      | AF ->
          let _v = _menhir_action_38 () in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState016 _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState016 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState016 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState016 _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QMARK ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState037 _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | ID _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_04 n in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState037 _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState037 _tok
          | ENTIER _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_4 in
              let _v = _menhir_action_07 e in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState037 _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | ID _v_7 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_7 in
              let _v = _menhir_action_04 n in
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_10 in
              let _v = _menhir_action_07 e in
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
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
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
          | ID _v_13 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_13 in
              let _v = _menhir_action_04 n in
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_16 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_16 in
              let _v = _menhir_action_07 e in
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | ID _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_19 in
              let _v = _menhir_action_04 n in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_22 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_22 in
              let _v = _menhir_action_07 e in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | ID _v_25 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_25 in
              let _v = _menhir_action_04 n in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_28 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_28 in
              let _v = _menhir_action_07 e in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | ID _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_04 n in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_4 in
              let _v = _menhir_action_07 e in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_040 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
      | MenhirState102 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState078 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState057 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState014 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState049 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState046 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState042 ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState039 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState037 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState017 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState021 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState031 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState022 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState025 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_103 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | RETURN ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState107 _tok
      | PRINT ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | PLUS ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | LOOP ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_46 () in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState107 _tok
      | IF ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | ID _v_2 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState107
      | CONTINUE ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | CONST ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | BREAK ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_45 () in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState107 _tok
      | AF ->
          let _v = _menhir_action_38 () in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | _ ->
          _eRR ()
  
  and _menhir_run_058 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_24 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_08 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_021 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | _ ->
          _eRR ()
  
  and _menhir_run_034 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_09 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_022 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState022 _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState022 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState022 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState022 _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | _ ->
          _eRR ()
  
  and _menhir_run_030 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
          | ID _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_04 n in
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_4 in
              let _v = _menhir_action_07 e in
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
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
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | PO ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
              | NUM ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
              | ID _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_1 in
                  let _v = _menhir_action_04 n in
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | ENTIER _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_4 in
                  let _v = _menhir_action_07 e in
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
              | DENOM ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
              | CO ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
              | CALL ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
              | PF ->
                  let _v = _menhir_action_34 () in
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState028 _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | ID _v_1 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_1 in
          let _v = _menhir_action_04 n in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState028 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState028 _tok
      | ENTIER _v_4 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v_4 in
          let _v = _menhir_action_07 e in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState028 _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
      | PF ->
          let _v = _menhir_action_34 () in
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_35 x xs in
      _menhir_goto_list_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState028 ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_026 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let lp = _v in
      let _v = _menhir_action_02 lp n in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_100 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
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
                  _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PO ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
              | NUM ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_2 in
                  let _v = _menhir_action_04 n in
                  _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ENTIER _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_5 in
                  let _v = _menhir_action_07 e in
                  _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | DENOM ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
              | CO ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
              | CALL ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_063 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v in
                  let _v = _menhir_action_26 n in
                  _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LOOP (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState069 _tok
      | PO ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | NUM ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_04 n in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState069 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState069 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState069 _tok
      | DENOM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | CO ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | CALL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
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
                  let _v = _menhir_action_27 n in
                  _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | EQUAL ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_05 () in
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PO ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
              | NUM ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
              | ID _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_1 in
                  let _v = _menhir_action_04 n in
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ENTIER _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_4 in
                  let _v = _menhir_action_07 e in
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | DENOM ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
              | CO ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
              | CALL ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | NUM ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | ID _v_7 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_7 in
              let _v = _menhir_action_04 n in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_10 in
              let _v = _menhir_action_07 e in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | CO ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | CALL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | _ ->
              _eRR ())
      | COLON ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LOOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | AO ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, n) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_25 e1 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_087 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_33 () in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_32 n in
              _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
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
  
  and _menhir_run_096 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_31 () in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_30 n in
              _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_39 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState013 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_105 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_01 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState114 ->
          _menhir_run_115 _menhir_stack _v _tok
      | MenhirState012 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState085 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState070 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_109 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
          let _v = _menhir_action_47 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState116 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_46 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState116 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_45 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState116 _tok
      | ID _ ->
          let _v = _menhir_action_36 () in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_37 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState116 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_113 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_086 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, n) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_28 li n in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_073 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_21 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_071 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
          | _ ->
              _eRR ())
      | AF | BOOL | BREAK | CONST | CONTINUE | ID _ | IF | INT | LOOP | PLUS | PRINT | RAT | RETURN | WHILE ->
          let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let li1 = _v in
          let _v = _menhir_action_22 exp li1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LOOP -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LOOP (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_29 li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_056 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_23 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_053 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_050 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_047 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  and _menhir_run_043 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
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
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_46 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_45 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | ID _ ->
          let _v = _menhir_action_36 () in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
