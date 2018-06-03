; Allow more than one set of OAM buffers which also allows multiple sets to be used in one frame
; by calling DMA transfer multiple times a frame
section "OAM Buffer", wram0[$C000]

wOamBuffer::
    ds 4*40

; Moving stack pointer down here to expand on it's memory
section "WRAM", wram0

; Because the stack pointer counts down instead of up, reverse it
wStackPointerEnd::
    ds 256
wStackPointer::
    ds 1 ; Just to have the stack pointer top sit on an empty byte and not a used byte

; Page of OAM data to load into OAM
; As a shortcut it contains the High Nibble Address Offset as the page number
wOamPage::
    ds 1

; Currently Pressing Buttons
wJoyDown::
    ds 1

; Pressed and Released Buttons
wJoyUp::
    ds 1

; 5 clock bytes directly from the RTC clock
; Seconds, Minutes, Hours, DaysL (Bits 8 of 9), DaysU (Bits 9 of 9 + Flags)
; DaysU Flags
;       Bit 6 - Halt status (Auto Set on Clock Update)
;       Bit 7 - Day carry
wClock::
    ds 5

; Did the SRAM have to be formatted this time around?
; 1 = Yes, 0 = No
wSRAMForm::
    ds 1
