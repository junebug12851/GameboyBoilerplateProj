;***************************************************************************
;*
;* Sound control registers
;*
;***************************************************************************

; --
; -- AUDVOL/NR50 ($FF24)
; -- Channel control / ON-OFF / Volume (R/W)
; --
; -- Bit 7   - Vin->SO2 ON/OFF (Vin??)
; -- Bit 6-4 - SO2 output level (volume) (# 0-7)
; -- Bit 3   - Vin->SO1 ON/OFF (Vin??)
; -- Bit 2-0 - SO1 output level (volume) (# 0-7)
; --
rNR50 EQU $FF24
rAUDVOL	EQU rNR50


; --
; -- AUDTERM/NR51 ($FF25)
; -- Selection of Sound output terminal (R/W)
; --
; -- Bit 7   - Output sound 4 to SO2 terminal
; -- Bit 6   - Output sound 3 to SO2 terminal
; -- Bit 5   - Output sound 2 to SO2 terminal
; -- Bit 4   - Output sound 1 to SO2 terminal
; -- Bit 3   - Output sound 4 to SO1 terminal
; -- Bit 2   - Output sound 3 to SO1 terminal
; -- Bit 1   - Output sound 2 to SO1 terminal
; -- Bit 0   - Output sound 0 to SO1 terminal
; --
rNR51 EQU $FF25
rAUDTERM	EQU rNR51


; --
; -- AUDENA/NR52 ($FF26)
; -- Sound on/off (R/W)
; --
; -- Bit 7   - All sound on/off (sets all audio regs to 0!)
; -- Bit 3   - Sound 4 ON flag (doesn't work!)
; -- Bit 2   - Sound 3 ON flag (doesn't work!)
; -- Bit 1   - Sound 2 ON flag (doesn't work!)
; -- Bit 0   - Sound 1 ON flag (doesn't work!)
; --
rNR52 EQU $FF26
rAUDENA	EQU rNR52
