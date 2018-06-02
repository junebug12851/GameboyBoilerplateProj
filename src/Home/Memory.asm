include "src/Setup/Hardware.inc"
include "src/Home/data.inc"

section "Memory", rom0

WipeMemory::
	fill _VRAM, 	_VRAM_SIZE, 	0 	; Erase VRAM
	fill _WRAM, 	_WRAM_SIZE, 	0 	; Erase WRAM
	fill _OAMRAM, 	_OAMRAM_SIZE, 	0	; Erase OAM RAM
ret
