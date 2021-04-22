;   Lab 1 - toLower
;   Convert a zero-terminated ASCIIZ string to lower characters
;   Subroutine hexToASCII
;
;   Computerarchitektur / Computer Architecture
;   (C) 2021 J. Friedrich, W. Zimmermann
;   Hochschule Esslingen
;
;   Author:   W.Zimmermann, Feb 28, 2021
;            (based on code provided by J. Friedrich)
;   Modified: -
;

; export symbols
        XDEF decToASCII

; Defines

; Defines

; RAM: Variable data section
.data: SECTION

; ROM: Constant data
.const: SECTION

; ROM: Code section
.init: SECTION
H2A: DC.B "0123456789ABCDEF";   Define H2A ROM rable to read digit as index

decToASCII:
        PSHY
        PSHX
        PSHD

        ; Check zero
        CPD #0
        BGT positiv
        MOVB #'-', 0,X
        
        ; negieren
        COMA 
        COMB
        ADDD #1
        BRA weiter

positiv:
        MOVB #' ', 0,X
        BRA weiter

weiter:
        TFR X, Y        ; Charstring in Y sichern
        MOVB #0, 6,Y    ; 0 einsetzten

        ; Teile mit 10 000
        LDX #10000      ; in X 10 000 laden
        IDIV            ; D/X->X Rest in D
        PSHD            ; Rest wird gesichert
        TFR X, D        ; Lade X in D
        ADDD #'0'       ; addiere 0
        STAB  1,Y       ; String füllen 

        ; Teile mit 1000
        LDX #1000       ; in X 1000 laden
        PULD            ; Rest in D sichern
        IDIV            ; D/X->X Rest in D
        PSHD            ; rest wird gescihert
        TFR X, D        ; Lade X in D
        ADDD #'0'       ; addiere 0
        STAB  2,Y       ; String füllen 

        ; Teile mit 100
        LDX #100       ; in X 1000 laden
        PULD            ; Rest in D sichern
        IDIV            ; D/X->X Rest in D
        PSHD            ; rest wird gescihert
        TFR X, D        ; Lade X in D
        ADDD #'0'       ; addiere 0
        STAB  3,Y       ; String füllen 

        ; Teile mit 10
        LDX #10       ; in X 1000 laden
        PULD            ; Rest in D sichern
        IDIV            ; D/X->X Rest in D
        PSHD            ; rest wird gescihert
        TFR X, D        ; Lade X in D
        ADDD #'0'       ; addiere 0
        STAB  4,Y       ; String füllen 

        ; Rest sichern
        PULD            ; Rest holen
        ADDD #'0'       ; Addiere 0
        STAB 5,Y        ; Rest CharString laden
        
    



        PULD
        PULX
        PULY
        RTS
