include "./src/Home/LCD.inc"

section "GameLoop", rom0
GameLoop::
	wait_vblank
	call ReadJoypad
	call hDMACopyFunc
	halt
	jp GameLoop
