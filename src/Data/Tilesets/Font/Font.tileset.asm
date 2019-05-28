; Font Tileset
;
; Info:
;   Section              : FontTileset
;   Format               : Gameboy 4 color.
;   Compression          : None.
;   Counter              : Tile-count as Byte.
;   Tile size            : 8 x 8
;   Tiles                : 128 (Placed in 9000 Tileblock)

section "FontTileset", romx

FontTilesetCount::
db 128

FontTileset::
incbin "./build/Data/Tilesets/Font/Font.tileset.png.2bpp"
FontTilesetEnd::
