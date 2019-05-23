if      !def(CORE_BANKS_INC)
CORE_BANKS_INC  set  1

include "./src/Includes.inc"

; Calls to rom bank 1+ from anywhere
; \1 label
farcallrom:      macro
    ld bc, BANK(\1)
    ld hl, \1
    call FarcallRom
endm

; Jumps to rom bank 1+ from anywhere
; \1 label
farjprom:    macro
    ld bc, BANK(\1)
    ld hl, \1
    jp FarJpRom
endm

; Calls from one ram bank to another ram bank and back
; \1 label
farcallsram:      macro
    ld b, BANK(\1)
    ld hl, \1
    call FarcallSRam
endm

; Jumps to any sram bank from another sram bank
; \1 label
farjpsram:    macro
    ld b, BANK(\1)
    ld hl, \1
    jp FarJpSRam
endm

; Calls from outside sram to sram and back
; \1 label
callsram:      macro
    ld b, BANK(\1)
    ld hl, \1
    call GotoSram
endm

; Jumps to any sram bank from outside sram
; \1 label
jpsram:    macro
    ld b, BANK(\1)
    ld hl, \1
    jp GotoSram
endm

endc
