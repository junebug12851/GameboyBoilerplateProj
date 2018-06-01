; Increments only upon breaking changes or changes that introduce compatibility requirements
SRAMVersionU EQU $00
SRAMVersionL EQU $02

; This engine provides a nice API for all of those
MBCWait:     macro
    nop
    nop
    nop
    nop
endm

; Powers on External RAM and RTC Clock
; Turn off as soon as done
MBCPowerOn:   macro
    push af
    push hl

    ld a, $a
    ld hl, $0
    ld [hl], a ; Give power on code

    pop hl
    pop af
endm

; Powers off External RAM and RTC Clock
MBCPowerOff:   macro
    push af
    push hl

    ld a, $0
    ld hl, $0
    ld [hl], a ; Give power off code

    pop hl
    pop af
endm

; Select external ROM bank
; 0x01-0x7F
MBCSelectROM:   macro
    push af
    push hl

    ld a, \1
    ld hl, $2000
    ld [hl], a ; Switch external ROM bank

    pop hl
    pop af
endm

; Register based rom select, register a
MBCSelectROMb:  macro
    push hl

    ld hl, $2000
    ld [hl], a ; Switch external ROM bank

    pop hl
endm

; Select external RAM bank
; 0x00-0x03
MBCSelectRAM:   macro
    push af
    push hl

    ld a, \1
    ld hl, $4000
    ld [hl], a ; Switch external RAM bank

    pop hl
    pop af
endm

; Register based ram select, register a
MBCSelectRAMb:   macro
    push hl

    ld hl, $4000
    ld [hl], a ; Switch external RAM bank

    pop hl
endm

MBCSelectRTCSec:    macro
    push af
    push hl

    ld a, $8
    ld hl, $4000
    ld [hl], a ; Switch external RTC seconds bank

    MBCWait ; Give it 4 cycles to kick on

    pop hl
    pop af
endm

MBCSelectRTCMin:    macro
    push af
    push hl

    ld a, $9
    ld hl, $4000
    ld [hl], a ; Switch external RTC minutes bank

    MBCWait ; Give it 4 cycles to kick on

    pop hl
    pop af
endm

MBCSelectRTCHour:    macro
    push af
    push hl

    ld a, $A
    ld hl, $4000
    ld [hl], a ; Switch external RTC hours bank

    MBCWait ; Give it 4 cycles to kick on

    pop hl
    pop af
endm

MBCSelectRTCDayL:    macro
    push af
    push hl

    ld a, $B
    ld hl, $4000
    ld [hl], a ; Switch external RTC days lower bank

    MBCWait ; Give it 4 cycles to kick on

    pop hl
    pop af
endm

; Bit 0  Most significant bit of Day Counter (Bit 8)
; Bit 6  Halt (0=Active, 1=Stop Timer) (Set this before changing the timer)
; Bit 7  Day Counter Carry Bit (1=Counter Overflow)
MBCSelectRTCDayU:    macro
    push af
    push hl

    ld a, $C
    ld hl, $4000
    ld [hl], a ; Switch external RTC days upper bank with flags

    MBCWait ; Give it 4 cycles to kick on

    pop hl
    pop af
endm

; Latch new RTC Data
MBCLatchRTC:        macro
    push af
    push hl

    ld a, $0
    ld hl, $6000
    ld [hl], a ; 1st step in latching new RTC

    MBCWait ; Give it 4 cycles to kick in

    ld a, $1
    ld hl, $6000
    ld [hl], a ; 2nd step in latching

    MBCWait ; Give it 4 cycles to kick in

    pop hl
    pop af
endm

; Copies to or from an MBC Bank
; Copy bc bytes from hl to de on bank <arg 1>
MBCCopy:        MACRO
    MBCPowerOn
    MBCSelectRAM \1
    call CopyData
    MBCPowerOff
endm

; Fills data to MBC Bank
; Fills bc bytes at de with a value on bank <arg 1>
MBCFill:        MACRO
    MBCPowerOn
    MBCSelectRAM \1
    call FillData
    MBCPowerOff
endm

; Verifies data in MBC Bank
; Verify Bytes matchup from HL to DE for BC bytes or stops immidiately
; Returns a=0 if didn't verify and a=1 if did verify
MBCVerify:        MACRO
    MBCPowerOn
    MBCSelectRAM \1
    call VerifyData
    MBCPowerOff
endm

; Gets a single byte from the sram at HL and saves it to A
MBCGetByte:        MACRO
    MBCPowerOn
    MBCSelectRAM \1

    ld a, [hl]

    MBCPowerOff
endm
