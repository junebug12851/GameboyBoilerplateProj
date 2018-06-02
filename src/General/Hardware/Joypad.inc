;               Joypad
; 
;           P14                P15
;            |                  |
;--P10-------O-Right------------O-A---------
;            |                  |
;--P11-------O-Left-------------O-B---------
;            |                  |
;--P12-------O-Up---------------O-Select----
;            |                  |
;--P13-------O-Down-------------O-Start-----
;            |                  |
; from PanDocs

; What rJOY does is allow you to literally power up the metal
; wiring underneath the buttons. When you send power through 
; the very old wiring there's a lot of initial noise that
; eventually smoothes out. Furthermore afterwards, like many
; input devices, you pick up button presses when a button presses
; down and cuts off power in specific areas. Therefore button
; presses read as 0 and non-pressed reads as 1. There are only 4
; input wires to read from and 2 power wires to control power with.

; Typically you want to wait for the noise to clear on each power change
; and invert the bits so that a button press means 1, not 0
; You also need to perform 2 reads since only 4 buttons can be read
; at a time

rJOY    EQU $FF00       ; Joypad Register (R/W)

JOYF_MASK_POWER     EQU %00110000
JOYF_BTNS           EQU %00100000
JOYF_DPAD           EQU %00010000

JOYF_MASK_READ      EQU %00001111
JOYF_DOWN           EQU %00001000
JOYF_UP             EQU %00000100
JOYF_LEFT           EQU %00000010
JOYF_RIGHT          EQU %00000001

JOYF_START          EQU %00001000
JOYF_SELECT         EQU %00000100
JOYF_B              EQU %00000010
JOYF_A              EQU %00000001

; Joypad byte after compiling joypad input
JOYB_START          EQU %10000000
JOYB_SELECT         EQU %01000000
JOYB_B              EQU %00100000
JOYB_A              EQU %00010000

JOYB_DOWN           EQU %00001000
JOYB_UP             EQU %00000100
JOYB_LEFT           EQU %00000010
JOYB_RIGHT          EQU %00000001
