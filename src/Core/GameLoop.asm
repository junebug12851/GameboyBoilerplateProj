include "./src/Includes.inc"

section "GameLoop", rom0
GameLoop::
	halt
	jp GameLoop
