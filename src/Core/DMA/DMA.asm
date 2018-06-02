include "./src/Includes.inc"

section "DMA", rom0
DMAInstall::
	; Copy DMA Routine to HRAM
	copy RawDMACopyFunc, hDMACopyFunc, RawDMACopyFuncEnd-RawDMACopyFunc
	ret

RawDMACopyFunc:
	di ; Disable Interrupts so as to not offtrack CPU off HRAM

	; first we load the OAM page into the DMA register at $FF46
	ld 		a, [wOamPage]
	ld      [rDMA], a

	; DMA transfer begins, we need to wait 160 microseconds while it transfers
	; the following loop takes exactly that long
	ld      a, $28
.loop:
	dec     a
	jr      nz, .loop

	ei ; Enable Interrupts
	ret
RawDMACopyFuncEnd:
