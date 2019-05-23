; Font Tileset
;
; Info:
;   Section              : FontTileset
;   Format               : Gameboy 4 color.
;   Compression          : None.
;   Counter              : Tile-count as Byte.
;   Tile size            : 8 x 8
;   Tiles                : 128

section "FontTileset", rom0

FontTilesetCount::
db 128

FontTileset::
incbin "./build/Data/Tilesets/Font/Font.tileset.png.2bpp"
FontTilesetEnd::
