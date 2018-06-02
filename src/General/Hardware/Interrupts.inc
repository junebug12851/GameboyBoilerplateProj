; --
; -- IF ($FF0F)
; -- Interrupt Flag (R/W)
; --
rIF EQU $FF0F

; --
; -- IE ($FFFF)
; -- Interrupt Enable (R/W)
; --
rIE EQU $FFFF


IEF_JOYPAD  EQU  %00010000 ; Transition from High to Low of Pin number P10-P13
IEF_SERIAL  EQU  %00001000 ; Serial I/O transfer end
IEF_TIMER   EQU  %00000100 ; Timer Overflow
IEF_LCDC    EQU  %00000010 ; LCDC (see STAT)
IEF_VBLANK  EQU  %00000001 ; V-Blank
