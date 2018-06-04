include "./src/Includes.inc"

section "LYCHandler", rom0

LYC::
	ld a, LYC_INTERRUPT_CODE
	ld [wLastInterrupt], a ; Save last interrupt code
	reti
