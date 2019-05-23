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

; Did the SRAM have to be formatted this time around?
; 1 = Yes, 0 = No
wSRAMForm::
    ds 1

; Last Interrupt code
; 0 = HBlank
; 1 = VBlank
; 2 = Timer
; 3 = Serial
; 4 = LYC
; 5 = Joypad
wLastInterrupt::
    ds 1

; Counts every 1/17 of a second
; from 251 to 255 (4 times = ~.25 seconds)
wTimerCount::
    ds 1

; Counts every quarter of a second
; from 251 to 255 (4 times = ~1 second)
wTimerQuartSec::
    ds 1

; Counts every second
; from 195 to 255 (60 times = ~1 minute)
wTimerS::
    ds 1

; Counts every minute
; from 195 to 255 (60 times = ~1 hour)
wTimerM::
    ds 1

; Counts every hour
; from 231 to 255 (24 times = ~1 day)
wTimerH::
    ds 1

; Counts every day
; from 0 to 255
wTimerD::
    ds 1
