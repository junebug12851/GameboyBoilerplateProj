; Hotel Tileset
;
; Info:
;   Section              : HotelTileset
;   Format               : Gameboy 4 color.
;   Compression          : None
;   Counter              : Tile-count as Byte.
;   Tile size            : 8 x 8
;   Tiles                : 128  (Placed in 8800 Tileblock)

section "HotelTileset", romx

HotelTilesetCount::
db 128

HotelTileset::
incbin "./build/Data/Tilesets/Hotel/Hotel.tileset.png.2bpp"
HotelTilesetEnd::
