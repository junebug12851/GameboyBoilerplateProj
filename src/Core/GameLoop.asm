include "./src/Includes.inc"

section "GameLoop", rom0
GameLoop::
	wait "vblank"

	joypad_update
	dma_copy

	jp GameLoop
