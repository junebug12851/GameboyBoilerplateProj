JOY_DEBOUNCE:   MACRO
    ld  a,[rJOY]		 ;takes a few cycles to get accurate reading
	ld  a,[rJOY]
	ld  a,[rJOY]
	ld  a,[rJOY]
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
