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
