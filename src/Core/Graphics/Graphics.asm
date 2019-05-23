include "./src/Includes.inc"

section "graphics", rom0

; Given Y and X Coordinates, and a base address, adds offset to it
; B - Y coordinate between 0-31
; C - X coordinate between 0-31
; DE - Base Destination
CoordToAddr::
    push af
    push hl ; Prevent destruction of these registers, back them up

    ld h, 0
    ld l, b ; Load y coord into hl

    ld a, b
    cp 0
    jr z, .continue ; If row is zero then skip multiplication

    push bc
    ld c, b 
    ld b, 0 ; Prepare to multiply by 32 - backup Y,X Coords and set it to equal y only

    ld a, 31
.loop
    add hl, bc ; Add Y coordinate 31 more times to Y coord
    dec a
    jr nz, .loop

    pop bc ; Restore Y,X coord

.continue

    ld b, 0 ; Erase Y Coord
    add hl, bc ; Add column offset
    add hl, de ; Add base address to column and row offset

    ld d, h
    ld e, l ; Copy HL to DE

    pop hl
    pop af ; Restore these registers
ret

; Prints Tile A to DE and increment so it can be used consecutively
PrintTile::
    ld [de], a
    inc de
    ret

; Print Tile A to Y,X Coords at BC and Base address at DE
PrintTileAt::
    call CoordToAddr
    call PrintTile
    ret

; Prints tiles at HL to DE, will stop at $FF
PrintTiles::
    ldi a, [hl]
    cp GSTOP
    jr z, .done ; End here if we're at the end

    call PrintTile
    jr PrintTiles ; Print char and start over

.done
    ret

; Print Tiles HL to Y,X coords at BC with base address DE, will stop at $FF
PrintTilesAt::
    call CoordToAddr
    call PrintTiles
    ret

; Prints a tilemap to screen at specified coordinate
; A tilemap is simply tile numbers followed by a GSTOP on each line
; and fully terminated with a GEND. They can be copied to any location
; and align left on each line down to the starting pos
;
; hl    Tile Map Data
; b     Y Coord
; c     X Coord
; de    Destination Address
PrintTileMap::
    ld hl, ScreenMain
    ld b, 0
    ld c, 0
    ld de, _MAP0

.loop
    call PrintTiles

    ld a, [hl]
    cp GEND
    jr z, .end

    ld a, b
    inc a
    ld b, a
    ld c, 0
    ld de, _MAP0
    push bc
    call CoordToAddr
    pop bc
    jr .loop

.end
    ret
