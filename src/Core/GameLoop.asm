include "./src/Core/LCD/LCD.inc"
include "./src/Core/Joypad/Joypad.inc"
include "./src/Core/DMA/DMA.inc"

section "GameLoop", rom0
GameLoop::
	wait_vblank

	joypad_update
	dma_copy

	jp GameLoop
