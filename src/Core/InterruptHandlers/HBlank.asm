include "./src/Includes.inc"

section "HBlankHandler", rom0

HBlank::
	ld a, HBLANK_INTERRUPT_CODE
	ld [wLastInterrupt], a ; Save last interrupt code
	reti
