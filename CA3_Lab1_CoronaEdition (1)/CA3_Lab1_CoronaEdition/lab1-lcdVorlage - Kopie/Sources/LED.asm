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
        XDEF initLED
        XDEF setLED
        XDEF getLED
        XDEF toggleLED

; import symbols


; include derivative specific macros
        INCLUDE 'mc9s12dp256.inc'


; ROM: Code section
.init: SECTION

initLED:
        BSET DDRJ, #2                   ; Bit Set:   Port J.1 as output
        BCLR PTJ,  #2                   ; Bit Clear: J.1=0 --> Activate LEDs

        ifdef SEVEN_SEGS_OFF        
        MOVB #$0F, DDRP                 ; Port P.3..0 as outputs (seven segment display control)
        MOVB #$0F, PTP                  ; Turn off seven segment display
        endif

        MOVB #$FF, DDRB                 ; $FF -> DDRB:  Port B.7...0 as outputs (LEDs)
        MOVB #0, PORTB
        RTS

setLED:
        STAB PORTB                      ;Initsialisieren von LEDs
        RTS

getLED:
        LDAB PORTB
        RTS

toggleLED:
        EORB PORTB
        STAB PORTB
        RTS  








                
