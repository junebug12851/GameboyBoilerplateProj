; Special Graphic Engine Commands

GSTOP   EQU     $FF

; Convers Y, X coords to address offset and adds them to base address
; \1 = Y
; \2 = X
; \3 = Base Address
coord:      macro
    ld b, \1
    ld c, \2
    ld de, \3
    call CoordToAddr
endm

; Prints a tile at address
; \1 = Address
; \2 = Tile
raw_print:      macro
    ld de, \1
    ld a, \2
    call PrintTile
endm

; Prints a tile at coords in address
; \1 = Address
; \2 = Y
; \3 = X
; \4 = Tile
print:      macro
    ld de, \1
    ld b, \2
    ld c, \3
    ld a, \4
    call PrintTileAt
endm

; Prints tiles at address using engine (Stops at GSTOP)
; \1 = From Address
; \2 = To Address
raw_printstr:      macro
    ld hl, \1
    ld de, \2
    call PrintTiles
endm

; Prints tiles at address using engine (Stops at GSTOP)
; \1 = From Address
; \2 = To Address
; \3 = Y
; \4 = X
printstr:      macro
    ld hl, \1
    ld de, \2
    ld b, \3
    ld c, \4
    call PrintTilesAt
endm
