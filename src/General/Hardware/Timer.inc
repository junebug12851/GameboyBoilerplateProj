; Timer Speeds Breakdown to something more manageable, compareable, and tangeable
; For the average person like me, KHz are rounds in a second so 4KHz would be 4,000 times a second
;
; Gameboy Timer Speeds (Note theres a bit more to timer triggers than just speed)
;
;                                                         (See Below)
; Speed KHz        xSecond       In 1 second                w 0 TMA
; 4.096 KHz         4,096       0.000244140625          0.062255859375
; 16.384 KHz        16,384      0.00006103515625        0.01556396484375
; 65.536 KHz        65,536      0.000015258789063       0.003890991211065
; 262.144 KHz       262,144     0.000003814697266       0.00097274780283
;
; The longest timer possible is every ~0.06 seconds (With speeds at 4.096 KHz and a TMA of 0)
; The shortest timer possible is every ~0.000004 seconds (With speeds at 262.144 KHz and a TMA of 255)

; --
; -- DIV ($FF04)
; -- Divider register (R/W)
; --
rDIV EQU $FF04


; --
; -- TIMA ($FF05)
; -- Timer counter (R/W)
; --
rTIMA EQU $FF05


; --
; -- TMA ($FF06)
; -- Timer modulo (R/W)
; --
rTMA EQU $FF06


; --
; -- TAC ($FF07)
; -- Timer control (R/W)
; --
rTAC EQU $FF07

TACF_START   EQU %00000100
TACF_STOP    EQU %00000000

TACF_4KHZ    EQU %00000000 ; 4,000 times a second (Every .00025 seconds)
TACF_16KHZ   EQU %00000011 ; 16,000 times a second (Every .0.0000625 seconds)
TACF_65KHZ   EQU %00000010 ; 65,000 times a second (Every .0.000015384615385 seconds)
TACF_262KHZ  EQU %00000001 ; 262,000 times a second (Every 0.000003816793893 seconds)
