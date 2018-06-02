; Calls to rom bank 1+ from anywhere
; \1 label
farcallrom:      macro
    ld b, BANK(\1)
    ld hl, \1
    call FarcallRom
endm

; Jumps to rom bank 1+ from anywhere
; \1 label
farjprom:    macro
    ld b, BANK(\1)
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

; Calls from outside sram to sram and back, handles boot
; and shutdown of sram
; \1 label
callsram:      macro
    ld b, BANK(\1)
    ld hl, \1
    call CallSRam
endm

; Jumps to any sram bank from outside sram
; you are responsible for shutting down SRAM afterwards
; \1 label
jpsram:    macro
    ld b, BANK(\1)
    ld hl, \1
    jp JpSRam
endm
