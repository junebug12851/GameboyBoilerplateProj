if      !def(CORE_JOYPAD_INC)
CORE_JOYPAD_INC  set  1

include "./src/Includes.inc"

; Wait for noise to clear on joypad
debounce:   macro
    ld  a,[rJOY]		 ;takes a few cycles to get accurate reading
	ld  a,[rJOY]
	ld  a,[rJOY]
	ld  a,[rJOY]
    ld  a,[rJOY]
    ld  a,[rJOY]
endm

; Power up and read a column of buttons on the joypad
; \1 = "buttons" or "dpad"
joypad_column:   macro
    if \1 == "buttons"
        ld a, JOYF_BTNS
    else
        ld a, JOYF_DPAD
    endc

	ld [rJOY], a ; Power on requested joypad buttons
	debounce ; wait for noise to clear
	cpl ; invert so that a button press equal 1 instead of 0
	and JOYF_MASK_READ ; Keep only button press bits
endm

; Reads all joypad buttons into a single byte
; Start, Select, B, A, Down, Up, Left, Right
joypad_columns:     macro
    joypad_column "buttons" ;Read joypad buttons a, b, select, and start

	swap a ; Move 4 buttons in lower half to upper half of byte
	ld b, a ; Backup

	joypad_column "dpad" ;Read joypad buttons up, down, left, and right

	or b ; Bring buttons all together
endm

joypad_reset:   macro
    ld a, JOYF_MASK_POWER
	ld [rJOY], a ; Reset
endm

; Save joypad data to RAM
; b = current joypad byte
joypad_save:    macro
    ld a, [wJoyDown]; Read old joy data
	cpl   ; Remove buttons held down between last frame and this frame
		  ; Add in buttons pressed last frame and not this frame
	and b ; Only keep the buttons pressed and released between this and the previous frame

	ld [wJoyUp], a ; Save as buttons pressed & released

	ld b, a
	ld [wJoyDown], a ; Restore backup and save as buttons pressed and held
endm

; Prettier

joypad_update:		macro
	call ReadJoypad
endm

endc
