include "./src/Includes.inc"

section "InterruptHandlers", rom0
VBlank::
	reti

HBlank::
	reti

Timer::
	reti

Serial::
	reti
	
Joypad::
    reti
