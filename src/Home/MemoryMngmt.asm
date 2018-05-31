section "MemoryMngmt", rom0

WipeMemory:
	ld de, $8000 ; Start of VRAM
	ld bc, $A000 - $8000 ; All through VRAM
	ld a, 0
	call FillData

	ld de, $C000 ; Start of Internal WRAM
	ld bc, $E000 - $C000 ; All through to the end
	ld a, 0
	call FillData

	ld de, $FE00 ; Start of OAM
	ld bc, $FF00 - $FE00 ; All through to the end
	ld a, 0
	call FillData

	; HRAM is too sensitive to clear
	; It would corrupt the program stack and 
	; even working around that,
	; it's never touched except by 1 write
	; what little benefit would be gained would be useless
ret
