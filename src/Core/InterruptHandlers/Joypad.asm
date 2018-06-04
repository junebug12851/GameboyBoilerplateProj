include "./src/Includes.inc"

section "JoypadHandler", rom0

; Unused and really shouldn't be used
Joypad::
	ld a, JOYPAD_INTERRUPT_CODE
	ld [wLastInterrupt], a
    reti
