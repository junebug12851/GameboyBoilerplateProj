section "JoypadMngmt", rom0
JOY_DEBOUNCE:   MACRO
    ld  a,[JOY]		 ;takes a few cycles to get accurate reading
	ld  a,[JOY]
	ld  a,[JOY]
	ld  a,[JOY]
ENDM

JoyBtnDown:     MACRO
    ld a, [joyDown]
    ld b, \1
    and b
    cp b
ENDM

JoyBtnUp:       MACRO
    ld a, [joyUp]
    ld b, \1
    and b
    cp b
ENDM

ReadJoypad:
	ld  a,JOY_DPAD ;select dpad
	JOY_DEBOUNCE
	cpl 			 ;complement a (Invert)
	and JOY_INP_MASK   ;Keep dpad buttons
	swap a

	ld  b,a ; Load DPAD Buttons only on upper half

	ld  a,JOY_BTNS ;select btns
	JOY_DEBOUNCE
	cpl 			 ;complement a (Invert)
	and JOY_INP_MASK   ;Keep dpad buttons

	or  b ; Merge dpad buttons with other buttons

	ld  b,a
	ld  a,[wJoyDown]
	cpl
	and b
	ld  [wJoyUp],a ; Save which buttons were pressed and then released
	ld  a,b
	ld  [wJoyDown],a ; Save which buttons are being pressed
	ret
