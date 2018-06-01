include "./src/Setup/Hardware.inc"

is_hblank:       macro
    ld a, [rSTAT]
	and STATF_MODE_MASK
    cp 0
endm

is_vblank:       macro
    ld a, [rSTAT]
	and STATF_MODE_MASK
    cp 1
endm

is_vram_busy: macro
    ld a, [rSTAT]
	and STATF_MODE_MASK
    cp 2
endm

is_oam_vram_busy: macro
    ld a, [rSTAT]
	and STATF_MODE_MASK
    cp 3
endm

wait_hblank:		macro
.wait\@
	is_hblank
	jr nz, .wait\@ ; Proceed when LCD reports HBlank
endm

wait_vblank:		macro
.wait\@
	is_vblank
	jr nz, .wait\@ ; Proceed when LCD reports VBlank
endm

; Why? Because it looks waaayy prettier lol
lcd_on:         macro
    call EnableLCD
endm

lcd_off:        macro
    call DisableLCD
endm
