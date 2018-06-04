include "./src/Includes.inc"

section "VBlankHandler", rom0

VBlank::
	ld a, VBLANK_INTERRUPT_CODE
	ld [wLastInterrupt], a ; Save last interrupt code

	joypad_update ; Update Joypad once per frame
	dma_copy ; Update DMA once per frame
	reti
