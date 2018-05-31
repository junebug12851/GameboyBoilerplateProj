; Hardware interrupts
section "iVBlank", rom0 [$40]
	jp VBlank

section "iHBlank", rom0 [$48]
	jp HBlank

section "iTimer",  rom0 [$50]
	jp Timer

section "iSerial", rom0 [$58]
	jp Serial
	
section "iJoypad", rom0 [$60]
	jp Joypad
