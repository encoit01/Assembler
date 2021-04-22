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
        XDEF delay_0_5sec

; include derivative specific macros
        INCLUDE 'mc9s12dp256.inc'
        
; Defines
time:  EQU     2048                  ; Change this number to change counting speed

; RAM: Variable data section
.data: SECTION

; ROM: Constant data
.const:SECTION


; ROM: Code section
.init: SECTION

; Delay-function
delay_0_5sec:   
                PSHX
                PSHY
                LDX  #time ; Delay loop to control toggle Frequency 
waitO:          LDY  #time ; (Uses two nested counter loops with registers X and Y)
waitI:          DBNE Y, waitI ; --- Decrement Y and branch to waitI if not equal to 0
                DBNE X, waitO ; --- Decrement X and branch to waitO if not equal to 0
                PULY
                PULX
                RTS

                  
            

              
                
                


