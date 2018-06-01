;***************************************************************************
;*
;* SoundChannel #1 registers
;*
;***************************************************************************

; --
; -- AUD1SWEEP/NR10 ($FF10)
; -- Sweep register (R/W)
; --
; -- Bit 6-4 - Sweep Time
; -- Bit 3   - Sweep Increase/Decrease
; --           0: Addition    (frequency increases???)
; --           1: Subtraction (frequency increases???)
; -- Bit 2-0 - Number of sweep shift (# 0-7)
; -- Sweep Time: (n*7.8ms)
; --
rNR10 EQU $FF10
rAUD1SWEEP	EQU rNR10


; --
; -- AUD1LEN/NR11 ($FF11)
; -- Sound length/Wave pattern duty (R/W)
; --
; -- Bit 7-6 - Wave Pattern Duty (00:12.5% 01:25% 10:50% 11:75%)
; -- Bit 5-0 - Sound length data (# 0-63)
; --
rNR11 EQU $FF11
rAUD1LEN	EQU rNR11


; --
; -- AUD1ENV/NR12 ($FF12)
; -- Envelope (R/W)
; --
; -- Bit 7-4 - Initial value of envelope
; -- Bit 3   - Envelope UP/DOWN
; --           0: Decrease
; --           1: Range of increase
; -- Bit 2-0 - Number of envelope sweep (# 0-7)
; --
rNR12 EQU $FF12
rAUD1ENV	EQU rNR12


; --
; -- AUD1LOW/NR13 ($FF13)
; -- Frequency lo (W)
; --
rNR13 EQU $FF13
rAUD1LOW	EQU rNR13


; --
; -- AUD1HIGH/NR14 ($FF14)
; -- Frequency hi (W)
; --
; -- Bit 7   - Initial (when set, sound restarts)
; -- Bit 6   - Counter/consecutive selection
; -- Bit 2-0 - Frequency's higher 3 bits
; --
rNR14 EQU $FF14
rAUD1HIGH	EQU rNR14
