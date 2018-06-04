include "./src/Includes.inc"

section "SerialHandler", rom0

Serial::
	ld a, SERIAL_INTERRUPT_CODE
	ld [wLastInterrupt], a
	reti
