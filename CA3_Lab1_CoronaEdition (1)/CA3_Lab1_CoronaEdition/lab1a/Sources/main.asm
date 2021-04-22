
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

        BSET DDRJ, #2                   ; Bit Set:   Port J.1 as output
        BCLR PTJ,  #2                   ; Bit Clear: J.1=0 --> Activate LEDs

  ifdef SEVEN_SEGS_OFF        
        MOVB #$0F, DDRP                 ; Port P.3..0 as outputs (seven segment display control)
        MOVB #$0F, PTP                  ; Turn off seven segment display
  endif

        MOVB #$FF, DDRB                 ; $FF -> DDRB:  Port B.7...0 as outputs (LEDs)
        MOVB #$55, PORTB 


restart:        LDD #0 ;Initsialisieren vom D-Register mit 0
                MOVB #0, PORTB ;Alle LEDs auscchalten

vonvorne:       CPD #63 ;D-Register mit 63 vergleichen
                BLO unter63 ;Wenn D < 63 spring zu unter63
                BHI restart ;Wenn D > 63 spring zu restart
                
unter63:        STAB PORTB ;Initsialisieren von LEDs
                ADDD #2 ;Addiere 2 aufs D-Register  

                LDX  #time ; Delay loop to control toggle Frequency 
waitO:          LDY  #time ; (Uses two nested counter loops with registers X and Y)
waitI:          DBNE Y, waitI ; --- Decrement Y and branch to waitI if not equal to 0
                DBNE X, waitO ; --- Decrement X and branch to waitO if not equal to 0

                BRA vonvorne ;Springe immer zu vonvorne                    
                
                


