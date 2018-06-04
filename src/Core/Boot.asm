include "./src/Includes.inc"
include "./src/General/Charmap.inc"

section "Boot", rom0

; \1 == Amount
skip_frames:     macro
    ld b, \1 ; Frame skip of 20
.loop\@
    ld a, [rLY]
    cp SCRN_Y
    jp nz, .loop\@
    dec b
    jr nz, .loop\@
endm

; \1 == to
scroll_down:    macro
.loop\@
    skip_frames 40

    ld a, [rSCY]
    sub 1
    ld [rSCY], a ; Scrolldown 1 pixel
    cp \1
    jr nz, .loop\@
endm

; Further Animate Nintendo Logo
RunBootAnimation::

    ; Skip 50 frames and remove Nintendo "t" from logo
    skip_frames 40
    print _MAP0, $8, $8, " "
    print _MAP0, $9, $4, " "

    ; Go from SCY FF - BO
    ld a, $FF
    ld [rSCY], a

    scroll_down $E9

    print _MAP0, $8, $10, " "
    print _MAP0, $9, $C, " "

    scroll_down $E6

    print _MAP0, $8, $F, " "
    print _MAP0, $9, $5, " "

    scroll_down $E4

    print _MAP0, $A, $9, " "
    print _MAP0, $6, $8, " "

    scroll_down $E1

    print _MAP0, $9, $9, " "
    print _MAP0, $9, $B, " "

    scroll_down $D9

    print _MAP0, $8, $A, " "
    print _MAP0, $8, $C, " "

    ld a, %10101000
    ld [rBGP], a

    scroll_down $D6

    print _MAP0, $9, $F, " "

    scroll_down $D4

    print _MAP0, $9, $7, " "

    scroll_down $D1

    print _MAP0, $8, $D, " "
    print _MAP0, $9, $D, " "

    scroll_down $C9

    ld a, %01010100
    ld [rBGP], a

    print _MAP0, $8, $5, " "

    scroll_down $C6

    print _MAP0, $9, $8, " "
    print _MAP0, $9, $E, " "

    scroll_down $C4

    print _MAP0, $9, $6, " "
    
    scroll_down $C1

    print _MAP0, $8, $B, " "
    print _MAP0, $9, $A, " "

    scroll_down $B9

    print _MAP0, $8, $4, " "
    print _MAP0, $8, $5, " "

    ld a, %00000000
    ld [rBGP], a

    skip_frames 50

    ret
