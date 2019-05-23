include "./src/Includes.inc"

section "Memory", rom0

WipeMemory::
	fill _TILES0, 	_TILES0_SIZE * 3,	0 	; Erase Tile Data
	fill _MAP0, 	_MAP0_SIZE * 2,		63 	; Set all tiles to be the space character
	fill _WRAM, 	_WRAM_SIZE, 		0 	; Erase WRAM
	fill _OAMRAM, 	_OAMRAM_SIZE, 		0	; Erase OAM RAM
ret
