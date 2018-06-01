;***************************************************************************
;*
;* SoundChannel #2 registers
;*
;***************************************************************************

; --
; -- AUD2LEN/NR21 ($FF16)
; -- Sound Length; Wave Pattern Duty (R/W)
; --
; -- see AUD1LEN for info
; --
rNR21 EQU $FF16
rAUD2LEN	EQU rNR21


; --
; -- AUD2ENV/NR22 ($FF17)
; -- Envelope (R/W)
; --
; -- see AUD1ENV for info
; --
rNR22 EQU $FF17
rAUD2ENV	EQU rNR22


; --
; -- AUD2LOW/NR23 ($FF18)
; -- Frequency lo (W)
; --
rNR23 EQU $FF18
rAUD2LOW	EQU rNR23


; --
; -- AUD2HIGH/NR24 ($FF19)
; -- Frequency hi (W)
; --
; -- see AUD1HIGH for info
; --
rNR24 EQU $FF19
rAUD2HIGH	EQU rNR24
