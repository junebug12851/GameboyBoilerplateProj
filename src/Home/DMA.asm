section "DMA", rom0
DMAInstall:
	ld  hl,RawDMACopyFunc
	ld  de,hDMACopyFunc ;DMA routine, gets placed in HRAM
	ld  bc,RawDMACopyFuncEnd-RawDMACopyFunc
	call CopyData
	ret

RawDMACopyFunc:
	; first we load the OAM page into the DMA register at $FF46
	ld 		a, [wOamPage]
	ld      [rDMA], a

	; DMA transfer begins, we need to wait 160 microseconds while it transfers
	; the following loop takes exactly that long
	ld      a, $28
.loop:
	dec     a
	jr      nz, .loop
	ret
RawDMACopyFuncEnd:
