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
        XREF decToASCII

; include derivative specific macros
        INCLUDE 'mc9s12dp256.inc'

; Defines

; RAM: Variable data section
.data:  SECTION
        val: DS.W 1                     ; define 16 Bit value for second parameter
        charString: DS.B 7              ; define charString with 7 Bytes (0x____0)


; ROM: Constant data
.const: SECTION

; ROM: Code section
.init:  SECTION

main:                                   ; Begin of the program
Entry:
        LDS  #__SEG_END_SSTACK          ; Initialize stack pointer
        CLI                             ; Enable interrupts, needed for debugger

        LDX #charString
        MOVW #-256, val
        LDD val
        JSR decToASCII

loop:
        BRA loop