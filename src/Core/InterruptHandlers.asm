include "./src/Includes.inc"

section "InterruptHandlers", rom0
VBlank::
	joypad_update ; Update Joypad once per frame
	dma_copy ; Update DMA once per frame
	reti

LCDC::
	reti

Timer::
	reti

Serial::
	reti
	
Joypad::
    reti
