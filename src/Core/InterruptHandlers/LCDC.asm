include "./src/Includes.inc"

section "LCDCHandler", rom0

LCDC::
	is_lyc
	jp nz, LYC ; Jump to LYC if LY == LYC

	; If we're in HBlank, then we don't have that much time
	; to figure out we're in HBlank, comapct uses the shortest
	; possible version and forgoes an extra check which can add
	; a few clock cycles
	which_vmode
	cp 0
	jp z, HBlank

	reti
