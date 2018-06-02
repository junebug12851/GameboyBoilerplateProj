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

TACF_4KHZ    EQU %00000000
TACF_16KHZ   EQU %00000011
TACF_65KHZ   EQU %00000010
TACF_262KHZ  EQU %00000001
