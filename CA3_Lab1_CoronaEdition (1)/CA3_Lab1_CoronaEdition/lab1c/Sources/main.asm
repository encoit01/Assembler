;   Lab 1 - Test program for toLower
;   Convert a zero-terminated ASCIIZ string to lower characters
;   Main program
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
        XDEF Entry, main

; import symbols
        XREF __SEG_END_SSTACK           ; End of stack
        XREF toLower

; include derivative specific macros
        INCLUDE 'mc9s12dp256.inc'

; Defines

; RAM: Variable data section
.data:  SECTION
Vtext:  DS.B    80                      ; String array (in RAM)

; ROM: Constant data
.const: SECTION
Ctext:  DC.B  "Test 12345 *!? ABCDE abcde zZ", 0

; ROM: Code section
.init:  SECTION

main:                                   ; Begin of the program
Entry:
        LDS  #__SEG_END_SSTACK          ; Initialize stack pointer
        CLI                             ; Enable interrupts, needed for debugger

        LDX #Ctext
        LDY #Vtext
        JSR STRCPY
        LDD #Vtext
        JSR toLower
loop:
        BRA loop
STRCPY:
        MOVB 0,X , 1,Y+
        TST 1,X+
        BNE STRCPY
        RTS 




