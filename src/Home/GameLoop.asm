include "./src/Home/LCD.inc"
include "./src/Home/Joypad.inc"
include "./src/Home/DMA.inc"

section "GameLoop", rom0
GameLoop::
	wait_vblank

	joypad_update
	dma_copy

	jp GameLoop
