; Allow more than one set of OAM buffers which also allows multiple sets to be used in one frame
; by calling DMA transfer multiple times a frame
section "OAM Buffer Page 1", wram0[$C000]

wOamBuffer1:
    ds 4*40

section "WRAM", wram0

; Page of OAM data to load into OAM
; As a shortcut it contains the High Nibble Address Offset as the page number
wOamPage:
    ds 1

; Currently Pressing Buttons
wJoyDown:
    ds 1

; Pressed and Released Buttons
wJoyUp:
    ds 1

; 5 clock bytes directly from the RTC clock
; Seconds, Minutes, Hours, DaysL (Bits 8 of 9), DaysU (Bits 9 of 9 + Flags)
; DaysU Flags
;       Bit 6 - Halt status (Auto Set on Clock Update)
;       Bit 7 - Day carry
wClock:
    ds 5

; Did the SRAM have to be formatted this time around?
; 1 = Yes, 0 = No
wSRAMForm:
    ds 1
