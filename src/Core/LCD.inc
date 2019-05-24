if      !def(CORE_LCD_INC)
CORE_LCD_INC  set  1

include "./src/Includes.inc"

; Check LCD Power
is_lcd_on:      macro
    ld a, [rLCDC]
    bit 7, a
endm

; Sets LCD Power (Requires you to be in VBlank first)
; \1 = "on" or "off"
lcd_power:      macro
    ld a, [rLCDC]

    if \1 == "off"
        res 7, a
    elif \1 == "on"
        set 7, a
    endc

    ld [rLCDC], a ; Disable LCD Screen
endm

; Asks questions about window
; "on" - Is the window on
; "map 1" - Is the window using tilemap 1
is_window:      macro
    ld a, [rLCDC]

    if \1 == "on"
        bit 5, a
    elif \1 == "map 1"
        bit 6, a
    endc
endm

; Set details on window
; "on" or "off" - Turn window on or off
; "map 0" or "map 1" - Switch window to map 0 or 1
window:         macro
    ld a, [rLCDC]

    if \1 == "on"
        set 5, a
    elif \1 == "off"
        res 5, a
    elif \1 == "map 0"
        res 6, a
    elif \1 == "map 1"
        set 6, a
    endc

    ld [rLCDC], a
endm

; Are tiles using tiledata 0 or tiledata 1
is_tiledata_0:      macro
    ld a, [rLCDC]
    bit 4, a
endm

; Set tile data location
; "0" or "1" - Tile data 0 or 1
tiledata:         macro
    ld a, [rLCDC]

    if \1 == 0
        set 4, a
    elif \1 == 1
        res 4, a
    endc

    ld [rLCDC], a
endm

; Asks questions about background
; "on" - Is the background on
; "map 1" - Is the background using tilemap 1
is_background:      macro
    ld a, [rLCDC]

    if \1 == "on"
        bit 0, a
    elif \1 == "map 1"
        bit 3, a
    endc
endm

; Set details on background
; "on" or "off" - Turn background on or off
; "map 0" or "map 1" - Switch background to map 0 or 1
background:         macro
    ld a, [rLCDC]

    if \1 == "on"
        set 0, a
    elif \1 == "off"
        res 0, a
    elif \1 == "map 0"
        res 3, a
    elif \1 == "map 1"
        set 3, a
    endc

    ld [rLCDC], a
endm

; Asks questions about sprites
; "on" - Are the sprites on
; "8x16" - Are the sprites in 8x16 format
is_sprites:      macro
    ld a, [rLCDC]

    if \1 == "on"
        bit 1, a
    elif \1 == "8x16"
        bit 2, a
    endc
endm

; Set details on sprites
; "on" or "off" - Turn sprites on or off
; "8x8" or "8x16" - Switch sprites to 8x8 or 8x16
sprites:         macro
    ld a, [rLCDC]

    if \1 == "on"
        set 1, a
    elif \1 == "off"
        res 1, a
    elif \1 == "8x8"
        res 2, a
    elif \1 == "8x16"
        set 2, a
    endc

    ld [rLCDC], a
endm

; Does the LCD report pixel line y == LYC
is_lyc:        macro
    ld a, [rSTAT]
    bit 2, a
endm

; What mode is the graphic system and LCD in
; 0 is HBlank - Safe to do just about any changes anywhere
; 1 is VBlank - Safe to do just about any changes anywhere
; 2 is OAM Busy, VBlank Free
; 3 is OAM Busy, VBlank Busy 
which_vmode:    macro
    ld a, [rSTAT]
    and STATF_MODE_MASK
endm

; Is the VRAM and OAM Free
is_vfree:       macro
    which_vmode
    cp 0
    jr z, .endTrue\@
    cp 1
    jr z, .endTrue\@ ; VRAM and OAM are free only in VBlank or HBlank
    jr .endFalse\@

.endTrue\@
    ld a, TRUE
    jr .end\@

.endFalse\@
    ld a, FALSE
.end\@
endm

; Wait for VBlank period
wait_vblank:        macro
.loop\@
    which_vmode
    cp 1
    jr z, .end\@
    halt
    jr .loop\@
.end\@
endm

; Wait for VBlank period
poll_vblank:        macro
.loop\@
    which_vmode
    cp 1
    jr z, .end\@
    jr .loop\@
.end\@
endm

; Polling Wait for VBlank period
poll_vblank_start:        macro
.loop\@
    ld a, [rLY]
    cp 145
    jr z, .end\@
    jr .loop\@
.end\@
endm

; Wait for HBlank period
wait_hblank:        macro
.loop\@
    which_vmode
    cp 0
    jr z, .end\@
    halt
    jr .loop\@
.end\@
endm

; Poll for HBlank period
poll_hblank:        macro
.loop\@
    which_vmode
    cp 0
    jr z, .end\@
    jr .loop\@
.end\@
endm

; Wait for VRAM being free in some way
wait_vram_free:        macro
.loop\@
    which_vmode
    cp 0
    jr z, .end\@
    cp 1
    jr z, .end\@
    cp 2
    jr z, .end\@
    halt
    jr .loop\@
.end\@
endm

; Poll for VRAM being free in some way
poll_vram_free:        macro
.loop\@
    which_vmode
    cp 3
    jr z, .loop\@
.end\@
endm

wait_oam_free:        macro
.loop\@
    which_vmode
    cp 0
    jr z, .end\@
    cp 1
    jr z, .end\@
    halt
    jr .loop\@
.end\@
endm

poll_oam_free:        macro
.loop\@
    which_vmode
    cp 0
    jr z, .end\@
    cp 1
    jr z, .end\@
    jr .loop\@
.end\@
endm

; Waits for "vblank" or "hblank"
wait:       macro
    if \1 == "vblank"
        wait_vblank
    elif \1 == "hblank"
        wait_hblank
    endc
endm

; Waits for "vblank" or "hblank"
poll:       macro
    if \1 == "vblank"
        poll_vblank
    elif \1 == "hblank"
        poll_hblank
    endc
endm

endc
