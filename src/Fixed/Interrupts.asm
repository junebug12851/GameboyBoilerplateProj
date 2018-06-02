; Hardware interrupts
section "iVBlank", rom0 [$40]
	jp VBlank

section "iLCDC", rom0 [$48]
	jp LCDC

section "iTimer",  rom0 [$50]
	jp Timer

section "iSerial", rom0 [$58]
	jp Serial
	
section "iJoypad", rom0 [$60]
	jp Joypad
