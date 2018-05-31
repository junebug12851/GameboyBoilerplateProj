section "LCD", rom0

IsHBlank:       MACRO
    ld a, [rSTAT]
	and STATF_LCD
    cp 0
ENDM

IsVBlank:       MACRO
    ld a, [rSTAT]
	and STATF_LCD
    cp 1
ENDM

IsSearchingOAM: MACRO
    ld a, [rSTAT]
	and STATF_LCD
    cp 2
ENDM

IsUpdatingLCD: MACRO
    ld a, [rSTAT]
	and STATF_LCD
    cp 3
ENDM

WaitHBlank:		MACRO
.wait\@
	IsHBlank
	jr nz, .wait\@ ; Proceed when LCD reports HBlank
ENDM

WaitVBlank:		MACRO
.wait\@
	IsVBlank
	jr nz, .wait\@ ; Proceed when LCD reports VBlank
ENDM

DisableLCD:
	xor a
	ld [rIF], a ; Disable Interrupt Flags
	ld a, [rIE]
	ld b, a
	res 0, a
	ld [rIE], a ; Disable VBlank

	WaitVBlank ; Wait until next VBlank

	ld a, [rLCDC]
	res 7, a
	ld [rLCDC], a ; Disable LCD Screen
	ld a, b
	ld [rIE], a ; Restore Interrupt State
	ret

EnableLCD:
	ld a, [rLCDC]
	set 7, a
	ld [rLCDC], a ; Turn on LCD Screen
	ret
