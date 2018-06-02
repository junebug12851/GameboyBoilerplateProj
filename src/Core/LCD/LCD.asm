include "./src/Includes.inc"

section "LCD", rom0

DisableLCD::
	xor a
	ld [rIF], a ; Disable Interrupt Flags
	ld a, [rIE]
	ld b, a
	res 0, a
	ld [rIE], a ; Disable VBlank

	wait_vblank ; Code for VBlank

	ld a, [rLCDC]
	res 7, a
	ld [rLCDC], a ; Disable LCD Screen
	ld a, b
	ld [rIE], a ; Restore Interrupt State
	ret

EnableLCD::
	ld a, [rLCDC]
	set 7, a
	ld [rLCDC], a ; Turn on LCD Screen
	ret
