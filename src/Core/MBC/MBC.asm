include "./src/Includes.inc"

section "MBC Engine", rom0

; SRAM Signature of being formatted correctly
; Cafe Babe F1ee Decaf Feed
; (Not the Decaf 。゜゜(´Ｏ`) ゜゜。 ...Runs Away)
SRAMSig::
    db $CA,$FE,$BA,$BE,$F1,$EE,$DE,$CF,$FE,$ED
SRAMSigEnd::

; This game uses Memory Bank Controller 5
; 512 ROM Banks (8MB)
; 16 RAM Banks (128KB)

; Formats the RAM if it needs formatting
; A=TRUE if formatting was needed
; A=FALSE if not
MBCRamAutoFormat::
    mbc_select "ram", 0 ; Switch to RAM 0

    verify SRAMSig, sSignature, SRAMSigEnd - SRAMSig ; Very signature matches

    cp TRUE
    jr nz, MBCRamFormat

    ; External RAM doesn't need formatting
    ld a, FALSE
    ret

; Format Ram without checking if it needs formatting
MBCRamFormat::
    mbc_select "ram", 0 ; Remember this is also an external function
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank0No
    ld a, 0
    ld [hl], a

    mbc_select "ram", 1
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank1No
    ld a, 1
    ld [hl], a

    mbc_select "ram", 2
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank2No
    ld a, 2
    ld [hl], a

    mbc_select "ram", 3
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank3No
    ld a, 3
    ld [hl], a

    mbc_select "ram", 4
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank4No
    ld a, 4
    ld [hl], a

    mbc_select "ram", 5
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank5No
    ld a, 5
    ld [hl], a

    mbc_select "ram", 6
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank6No
    ld a, 6
    ld [hl], a

    mbc_select "ram", 7
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank7No
    ld a, 7
    ld [hl], a

    mbc_select "ram", 8
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank8No
    ld a, 8
    ld [hl], a

    mbc_select "ram", 9
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank9No
    ld a, 9
    ld [hl], a

    mbc_select "ram", 10
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank10No
    ld a, 10
    ld [hl], a

    mbc_select "ram", 11
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank11No
    ld a, 11
    ld [hl], a

    mbc_select "ram", 12
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank12No
    ld a, 12
    ld [hl], a

    mbc_select "ram", 13
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank13No
    ld a, 13
    ld [hl], a

    mbc_select "ram", 14
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank14No
    ld a, 14
    ld [hl], a

    mbc_select "ram", 15
    fill _SRAM, _SRAM_SIZE, 0
    ld hl, sBank15No
    ld a, 15
    ld [hl], a

    ; Formatted 128 KB of RAM
    ; Now initial setup the RAM

    mbc_select "ram", 0
    copy SRAMSig, sSignature, SRAMSigEnd - SRAMSig ; Copy signature

    call MBCUpdateRamVersion ; Update RAM Version

    ; This code adds the ram bank number to the first byte of each
    ; ram bank whcih is used in a number of code points as an easy
    ; and efficient optimization. The same is also done for the ROM

    ld a, 1
    ret

MBCUpdateRamVersion::
    mbc_select "ram", 0

    ld a, SRAMVersionU
    ld de, sVersion
    ld [de], a
    inc de
    ld a, SRAMVersionL
    ld [de], a ; Update SRAM version

    ret

; Initial checks, procedures, and whatnot
MBCRunOnce::
    call MBCRamAutoFormat
    cp TRUE
    jr z, .formatted

    ld hl, wSRAMForm
    ld a, FALSE
    ld [hl], a ; Was not formatted
    jr .continue

.formatted
    ld hl, wSRAMForm
    ld a, TRUE
    ld [hl], a ; Was formatted

.continue
    call MBCUpdateRamVersion ; Update version on MBC RAM
    ret
