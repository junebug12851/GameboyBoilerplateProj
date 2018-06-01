include "./src/Engine/MBC.inc"

section "MBC Engine", rom0

; SRAM Signature of being formatted correctly
; Cafe Babe F1ee Decaf Feed
; (Not the Decaf 。゜゜(´Ｏ`) ゜゜。 ...Runs Away)
SRAMSig::
    db $CA,$FE,$BA,$BE,$F1,$EE,$DE,$CF,$FE,$ED
SRAMSigEnd::

; This game uses Memory Bank Controller 3
; 128 ROM Banks (2MB)
; 4 RAM Banks (32KB)
; RTC Clock

; Gets RTC Data
MBCGetRTC::
    ld hl, $A000 ; Load RTC Clock Read Address
    ld de, wClock ; Load Save address

    MBCPowerOn
    MBCLatchRTC ; Power on and latch new data

    MBCSelectRTCSec
    ld a, [hl]
    ld [de], a
    inc de ; Save seconds to byte 1

    MBCSelectRTCMin
    ld a, [hl]
    ld [de], a
    inc de ; Save minutes to byte 2

    MBCSelectRTCHour
    ld a, [hl]
    ld [de], a
    inc de ; Save hours to byte 3

    MBCSelectRTCDayL
    ld a, [hl]
    ld [de], a
    inc de ; Save 8 of 9 day bits to byte 4

    MBCSelectRTCDayU
    ld a, [hl]
    ld [de], a ; Save 9th day bit and flags to byte 5

    MBCPowerOff ; Power off
    ret

; Updates RTC Clock with data from wClock
MBCSetRTC::
    ld hl, wClock
    ld de, $A000

    MBCPowerOn
    MBCLatchRTC ; Power on and latch new data

    MBCSelectRTCDayU
    ld a, [de]
    set 6, a
    ld [de], a ; Before changing the RTC clock we have to stop it first

    MBCSelectRTCSec
    ld a, [hli]
    ld [de], a

    MBCSelectRTCMin
    ld a, [hli]
    ld [de], a

    MBCSelectRTCHour
    ld a, [hli]
    ld [de], a

    MBCSelectRTCDayL
    ld a, [hli]
    ld [de], a

    MBCSelectRTCDayU
    ld a, [hli]
    res 6, a ; Re-enable clock also
    ld [de], a

    MBCPowerOff
    ret

; Formats the RAM if it needs formatting
; A=1 if formatting was needed
; A=0 if not
MBCRamAutoFormat::

    MBCPowerOn
    MBCSelectRAM 0 ; Power on and switch to RAM 0

    ld hl, SRAMSig
    ld de, sSignature
    ld bc, SRAMSigEnd - SRAMSig
    call VerifyData ; Very signature matches

    cp 1
    jr nz, MBCRamFormat

    ; External RAM doesn't need formatting
    MBCPowerOff
    ld a, 0
    ret

; Format Ram without checking if it needs formatting
MBCRamFormat::
    ld de, $A000 ; Start of SRAM
	ld bc, $BFFF - $A000 ; All through SRAM
	ld a, 0
	call FillData

    MBCSelectRAM 1

    ld de, $A000 ; Start of SRAM
	ld bc, $BFFF - $A000 ; All through SRAM
	ld a, 0
	call FillData

    MBCSelectRAM 2
    
    ld de, $A000 ; Start of SRAM
	ld bc, $BFFF - $A000 ; All through SRAM
	ld a, 0
	call FillData

    MBCSelectRAM 3
    
    ld de, $A000 ; Start of SRAM
	ld bc, $BFFF - $A000 ; All through SRAM
	ld a, 0
	call FillData

    ; Formatted 32 KB of RAM
    ; Now initial setup the RAM

    MBCSelectRAM 0

    ld hl, SRAMSig
    ld de, sSignature
    ld bc, SRAMSigEnd - SRAMSig
    call CopyData ; Insert Signature

    call MBCUpdateRamVersion ; Update RAM Version

    ; This code adds the ram bank number to the first byte of each
    ; ram bank whcih is used in a number of code points as an easy
    ; and efficient optimization. The same is also done for the ROM

    ; MBCUpdateRamVersion is a function to be called from the outside
    ; it cleans up after itself and shuts down RAM, we need to boot
    ; RAM back up
    MBCPowerOn
    MBCSelectRAM 0

    ld hl, sBank0No
    ld a, 0
    ld [hl], a

    MBCSelectRAM 1

    ld hl, sBank1No
    ld a, 1
    ld [hl], a

    MBCSelectRAM 2

    ld hl, sBank2No
    ld a, 2
    ld [hl], a

    MBCSelectRAM 3

    ld hl, sBank3No
    ld a, 3
    ld [hl], a

    ; Shutdown RAM since we're done with RAM setup

    MBCPowerOff
    ld a, 1
    ret

MBCUpdateRamVersion::
    MBCPowerOn
    MBCSelectRAM 0

    ld a, SRAMVersionU
    ld de, sVersion
    ld [de], a
    inc de
    ld a, SRAMVersionL
    ld [de], a ; Update SRAM version

    MBCPowerOff
    ret

; Initial checks, procedures, and whatnot
MBCRunOnce::
    call MBCRamAutoFormat
    cp 1
    jr z, .formatted

    ld hl, wSRAMForm
    ld a, 0
    ld [hl], a ; Was not formatted
    jr .continue

.formatted
    ld hl, wSRAMForm
    ld a, 1
    ld [hl], a ; Was formatted

.continue
    call MBCGetRTC ; Retrive Clock Data
    ret

