include "./src/General/Hardware.inc"
include "./src/Core/Data/Data.inc"

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

; Powers on or off External RAM and RTC Clock
; Turn off as soon as done
; \1 = on or off
mbc_power:   macro
    push af
    push hl

    if \1 == "on"
        ld a, MBC3_EN_RAM_CODE
    else
        ld a, MBC3_DIS_RAM_CODE
    endc

    ld hl, MBC3_ENABLE_RAM
    ld [hl], a ; Give power on code

    pop hl
    pop af
endm

; Select external ROM bank
; 0x01-0x7F
; \1 = ROM Bank Number or "runtime" (Use register a instead)
mbc_selectrom:   macro
    push af
    push hl

    if \1 != "runtime"
        ld a, \1
    endc

    ld hl, MBC3_ROM_SELECT
    ld [hl], a ; Switch external ROM bank

    pop hl
    pop af
endm

; Select external RAM bank
; 0x00-0x03
; \1 = RAM Bank Number or "runtime" (Use register a instead)
mbc_selectram:   macro
    push af
    push hl

    if \1 != "runtime"
        ld a, \1
    endc

    ld hl, MBC3_RAM_SELECT
    ld [hl], a ; Switch external RAM bank

    pop hl
    pop af
endm

; Selects an RTC register in MBC
; \1 = register name
;       "s", "m", "h", "dl", "du"
mbc_selectrtc:      macro
    if \1 == "s"
        mbc_selectram MBC3_RTC_S_BNK
    elif \1 == "m"
        mbc_selectram MBC3_RTC_M_BNK
    elif \1 == "h"
        mbc_selectram MBC3_RTC_H_BNK
    elif \1 == "dl"
        mbc_selectram MBC3_RTC_DL_BNK
    elif \1 == "du"
        mbc_selectram MBC3_RTC_DU_BNK
    endc

    mbc_wait
endm

; Performs one of 3 MBC Selects
; \1 = "rom", "ram", or "rtc"
; \2 = arg to mbc_select <check specific macro>
mbc_select:         macro
    if \1 == "rom"
        mbc_selectrom \2
    elif \1 == "ram"
        mbc_selectram \2
    elif \1 == "rtc"
        mbc_selectrtc \2
    endc
endm

; Latch new RTC Data
mbc_latchrtc:        macro
    push af
    push hl

    ld a, MBC3_LATCH_CODE_1
    ld hl, MBC3_RTC_LATCH
    ld [hl], a ; 1st step in latching new RTC

    mbc_wait ; Give it 4 cycles to kick in

    ld a, MBC3_LATCH_CODE_2
    ld hl, MBC3_RTC_LATCH
    ld [hl], a ; 2nd step in latching

    mbc_wait ; Give it 4 cycles to kick in

    pop hl
    pop af
endm

; Copies to or from an MBC Bank
; Copy bc bytes from hl to de on bank #
; \1 = "ram" or "rom"
; \2 = bank number
; \3 = from
; \4 = to
; \5 = count
mbc_copy:        macro
    if \1 == "ram"
        mbc_power "on"
    endc

    mbc_select \1, \2
    copy \3, \4, \5

    if \1 == "ram"
        mbc_power "off"
    endc
endm

; Fills data to MBC Bank
; Fills bc bytes at de with a value on bank #
; \1 = "ram" or "rom"
; \2 = bank number
; \3 = to
; \4 = count
; \5 = value
mbc_fill:        macro
    if \1 == "ram"
        mbc_power "on"
    endc

    mbc_select \1, \2
    fill \3, \4, \5

    if \1 == "ram"
        mbc_power "off"
    endc
endm

; Verifies data in MBC Bank
; Verify Bytes matchup from HL to DE for BC bytes or stops immidiately
; Returns a=0 if didn't verify and a=1 if did verify
; \1 = "ram" or "rom"
; \2 = bank number
; \3 = from
; \4 = to
; \5 = count
mbc_verify:        macro
    if \1 == "ram"
        mbc_power "on"
    endc

    mbc_select \1, \2
    verify \3, \4, \5

    if \1 == "ram"
        mbc_power "off"
    endc
endm

; Gets a single byte from rom or ram at HL and saves it to A
; \1 = "ram" or "rom"
; \2 = bank number
; \3 = address
mbc_byte:        MACRO
    if \1 == "ram"
        mbc_power "on"
    endc

    mbc_select \1, \2
    ld a, [hl]

    if \1 == "ram"
        mbc_power "off"
    endc
endm

; Becuase it's prettier

mbc_getrtc: macro
    call MBCGetRTC
endm

mbc_setrtc: macro
    call MBCSetRTC
endm

mbc_updatever: macro
    call MBCUpdateRamVersion
endm
