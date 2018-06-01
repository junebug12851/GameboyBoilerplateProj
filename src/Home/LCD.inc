include "./src/Setup/Hardware.inc"

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
