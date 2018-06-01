include "./src/Home/Joypad.inc"
include "./src/Setup/Hardware.inc"

section "JoypadMngmt", rom0

ReadJoypad::
	ld  a,JOYF_DPAD ;select dpad
	JOY_DEBOUNCE
	cpl 			 ;complement a (Invert)
	and JOYF_MASK_READ   ;Keep dpad buttons
	swap a

	ld  b,a ; Load DPAD Buttons only on upper half

	ld  a,JOYF_BTNS ;select btns
	JOY_DEBOUNCE
	cpl 			 ;complement a (Invert)
	and JOYF_MASK_READ   ;Keep dpad buttons

	or  b ; Merge dpad buttons with other buttons

	ld  b,a
	ld  a,[wJoyDown]
	cpl
	and b
	ld  [wJoyUp],a ; Save which buttons were pressed and then released
	ld  a,b
	ld  [wJoyDown],a ; Save which buttons are being pressed
	ret
