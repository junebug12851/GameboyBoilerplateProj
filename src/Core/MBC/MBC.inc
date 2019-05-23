if      !def(CORE_MBC_INC)
CORE_MBC_INC  set  1

include "./src/Includes.inc"

; Increments only upon breaking changes or changes that introduce compatibility requirements
SRAMVersionU EQU $00
SRAMVersionL EQU $02

; This engine provides a nice API for all of those
mbc_wait:     macro
    nop
    nop
    nop
    nop
endm

; Powers on or off External RAM
; Turn off as soon as done
; \1 = on or off
mbc_power:   macro
    if \1 == "on"
        ld a, MBC5_EN_RAM_CODE
    else
        ld a, MBC5_DIS_RAM_CODE
    endc

    ld hl, MBC5_ENABLE_RAM
    ld [hl], a ; Give power on code
endm

; Select external ROM bank
; 0x01-0x1FF
; \1 = ROM Bank Number or "runtime" (Use register bc instead)
mbc_selectrom:   macro
    if \1 != "runtime"
        ld bc, \1
    endc

    ld hl, MBC5_LOW_ROM_SELECT
    ld [hl], c ; Switch external ROM bank

    ld hl, MBC5_HGH_ROM_SELECT
    ld [hl], b ; Switch external ROM bank
endm

; Select external RAM bank
; 0x00-0x0F
; \1 = RAM Bank Number or "runtime" (Use register a instead)
mbc_selectram:   macro
    if \1 != "runtime"
        ld b, \1
    endc

    ld hl, MBC5_RAM_SELECT
    ld [hl], b ; Switch external RAM bank
endm

; Performs one of 3 MBC Selects
; \1 = "rom" or "ram"
; \2 = arg to mbc_select <check specific macro>
mbc_select:         macro
    if \1 == "rom"
        mbc_selectrom \2
    elif \1 == "ram"
        mbc_selectram \2
    endc
endm

; Becuase it's prettier

mbc_updatever: macro
    call MBCUpdateRamVersion
endm

mbc_init: macro
    call MBCRunOnce
endm

endc
