include "./src/Includes.inc"

section "InterruptHandlers", rom0
VBlank::
	reti

LCDC::
	reti

Timer::
	reti

Serial::
	reti
	
Joypad::
    reti
