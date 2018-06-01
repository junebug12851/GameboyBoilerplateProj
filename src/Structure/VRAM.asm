; Tileset 1 (Window, BG, Sprites)
section "VRAM Tileset 1", vram[$8000]

vTileset1::
    ds 128*16

; Tileset Shared (Overalp between tileset 1 and 2)
section "VRAM Tileset Shared", vram[$8800]

vTilesetShared::
    ds 128*16

; Tileset 2 (Window, BG)
section "VRAM Tileset 2", vram[$9000]

vTileset2::
    ds 128*16

; Tilemap 1 (Window and/or BG)
section "VRAM Tilemap 1", vram[$9800]

vTilemap1::
    ds 32*32

; Tilemap 2 (Window and/or BG)
section "VRAM Tilemap 2", vram[$9C00]

vTilemap2::
    ds 32*32
