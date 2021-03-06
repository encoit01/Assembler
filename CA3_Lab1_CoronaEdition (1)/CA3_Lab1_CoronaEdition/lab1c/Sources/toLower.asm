;   Lab 1 - toLower
;   Convert a zero-terminated ASCIIZ string to lower characters
;   Subroutine toLower
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
        XDEF toLower

; Defines

; Defines

; RAM: Variable data section
.data: SECTION

; ROM: Constant data
.const: SECTION

; ROM: Code section
.init: SECTION

toLower:
        PSHD ;Registern sichern
        PSHX 
        PSHY
        TFR D,X
weiter: 
        LDAB 0,X 
        TSTB 
        BEQ ende      
        CMPB #'A'
        BLO next
        CMPB #'Z'
        BHI next
        ADDB #32
        STAB 0,X 
next:
        INX 
        BRA weiter  
ende:
        PULY
        PULX
        PULD
        RTS
                      