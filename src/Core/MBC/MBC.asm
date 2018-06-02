include "./src/Includes.inc"

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
    ld hl, _SRAM ; Load RTC Clock Read Address
    ld de, wClock ; Load Save address

    mbc_power "on"
    mbc_latchrtc ; Power on and latch new data

    mbc_select "rtc", "s"
    ld a, [hl]
    ld [de], a
    inc de ; Save seconds to byte 1

    mbc_select "rtc", "m"
    ld a, [hl]
    ld [de], a
    inc de ; Save minutes to byte 2

    mbc_select "rtc", "h"
    ld a, [hl]
    ld [de], a
    inc de ; Save hours to byte 3

    mbc_select "rtc", "dl"
    ld a, [hl]
    ld [de], a
    inc de ; Save 8 of 9 day bits to byte 4

    mbc_select "rtc", "du"
    ld a, [hl]
    ld [de], a ; Save 9th day bit and flags to byte 5

    mbc_power "off" ; Power off
    ret

; Updates RTC Clock with data from wClock
MBCSetRTC::
    ld hl, wClock
    ld de, _SRAM

    mbc_power "on"
    mbc_latchrtc ; Power on and latch new data

    mbc_select "rtc", "du"
    ld a, [de]
    set MBC3_RTC_DUB_HALT, a
    ld [de], a ; Before changing the RTC clock we have to stop it first
    mbc_wait

    mbc_select "rtc", "s"
    ld a, [hli]
    ld [de], a
    mbc_wait

    mbc_select "rtc", "m"
    ld a, [hli]
    ld [de], a
    mbc_wait

    mbc_select "rtc", "h"
    ld a, [hli]
    ld [de], a
    mbc_wait

    mbc_select "rtc", "dl"
    ld a, [hli]
    ld [de], a
    mbc_wait

    mbc_select "rtc", "du"
    ld a, [hli]
    res MBC3_RTC_DUB_HALT, a ; Re-enable clock also
    ld [de], a
    mbc_wait

    mbc_power "off"
    ret

; Formats the RAM if it needs formatting
; A=1 if formatting was needed
; A=0 if not
MBCRamAutoFormat::

    mbc_power "on"
    mbc_select "ram", 0 ; Power on and switch to RAM 0

    verify SRAMSig, sSignature, SRAMSigEnd - SRAMSig ; Very signature matches

    cp TRUE
    jr nz, MBCRamFormat

    ; External RAM doesn't need formatting
    mbc_power "off"
    ld a, FALSE
    ret

; Format Ram without checking if it needs formatting
MBCRamFormat::

    mbc_power "on"

    mbc_select "ram", 0 ; Remember this is also an external function
    fill _SRAM, _SRAM_SIZE, 0

    mbc_select "ram", 1
    fill _SRAM, _SRAM_SIZE, 0

    mbc_select "ram", 2
    fill _SRAM, _SRAM_SIZE, 0

    mbc_select "ram", 3
    fill _SRAM, _SRAM_SIZE, 0

    ; Formatted 32 KB of RAM
    ; Now initial setup the RAM

    mbc_select "ram", 0
    copy SRAMSig, sSignature, SRAMSigEnd - SRAMSig ; Copy signature

    call MBCUpdateRamVersion ; Update RAM Version

    ; This code adds the ram bank number to the first byte of each
    ; ram bank whcih is used in a number of code points as an easy
    ; and efficient optimization. The same is also done for the ROM

    ; MBCUpdateRamVersion is a function to be called from the outside
    ; it cleans up after itself and shuts down RAM, we need to boot
    ; RAM back up
    mbc_power "on"
    mbc_select "ram", 0

    ld hl, sBank0No
    ld a, 0
    ld [hl], a

    mbc_select "ram", 1

    ld hl, sBank1No
    ld a, 1
    ld [hl], a

    mbc_select "ram", 2

    ld hl, sBank2No
    ld a, 2
    ld [hl], a

    mbc_select "ram", 3

    ld hl, sBank3No
    ld a, 3
    ld [hl], a

    ; Shutdown RAM since we're done with RAM setup

    mbc_power "off"
    ld a, 1
    ret

MBCUpdateRamVersion::
    mbc_power "on"
    mbc_select "ram", 0

    ld a, SRAMVersionU
    ld de, sVersion
    ld [de], a
    inc de
    ld a, SRAMVersionL
    ld [de], a ; Update SRAM version

    mbc_power "off"
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
    mbc_updatever ; Update version on MBC RAM
    ret
