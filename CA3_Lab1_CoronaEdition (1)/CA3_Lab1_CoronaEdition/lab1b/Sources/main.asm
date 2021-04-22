
;   Lab 1 - Problem 2.1
;   Incrementing a value once per second and binary output to LEDs
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
        XREF delay_0_5sec
        XREF initLED
        XREF setLED
        XREF getLED
        XREF toggleLED


; include derivative specific macros
        INCLUDE 'mc9s12dp256.inc'
        time: EQU 2048
; Defines
SPEED:  EQU     $FFFF                   ; Change this number to change counting speed

; RAM: Variable data section
.data: SECTION

; ROM: Constant data
.const:SECTION


; ROM: Code section
.init: SECTION

main:                                   ; Begin of the program
Entry:
        LDS  #__SEG_END_SSTACK          ; Initialize stack pointer
        CLI                             ; Enable interrupts, needed for debugger
        JSR initLED





restart:        
                LDD #0 ;Initsialisieren vom D-Register mit 0
                MOVB #0, PORTB ;Alle LEDs auscchalten

vonvorne:       
                CPD #63 ;D-Register mit 63 vergleichen
                BLO unter63 ;Wenn D < 63 spring zu unter63
                BHI restart ;Wenn D > 63 spring zu restart
                
unter63:        
                
                JSR setLED
                JSR getLED
                ADDB #2

                JSR delay_0_5sec
                BRA vonvorne ;Springe immer zu vonvorne                    
                
                


