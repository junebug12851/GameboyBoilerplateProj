section "GameLoop", rom0
GameLoop:
	WaitVBlank
	call ReadJoypad
	call hDMACopyFunc
	halt
	jp GameLoop
