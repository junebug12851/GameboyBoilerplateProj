include "./src/Engine/MBC.inc"
include "./src/Setup/Hardware.inc"
include "./src/Home/LCD.inc"
include "./src/Home/Data.inc"
include "./src/Engine/Graphics.inc"

section "Start", rom0

Start::

	ei				 ;enable interrupts
	ld  sp,$FFFE	 ; Set stack pointer to FFFE

	lcd "off"
	ld  a,$0
	ldh [rLCDC],a
	ldh [rSTAT],a	;Disable LCD and Zero out LCDC and STAT

	ld  a,%11100100  ;shade palette (11 10 01 00)
	ldh [rBGP],a
	ldh [rOBP0],a	;setup palettes

	call WipeMemory ; Erase all VRAM, RAM, and OAM
	call MBCRunOnce ; Checks, procedures, init, potential formatting, and whatnot to the MBC and internal memory
	mbc_select "rom", 1 ; Open ROM Bank 1 for external bank

	ld a, 0
	ld [rSCY], a
	ld [rSCX], a ; Reset Background Scrolling to 0

	; Set OAM Page to initial value
	ld a, $C0
	ld [wOamPage], a

	; Copy Font into Tile Data
	copy Tileset1, vTileset1, Tileset1End - Tileset1

	; BG & LCD On
	; 8x8 Tiles
	; BG and Window share Tilemap Data $9C00-$9FFFF
	; BG Data at $8000-$8FFF
	; Window Off
	lcd "on"
	ld  a,LCDCF_BGON | LCDCF_OBJON | LCDCF_TD8000 | LCDCF_BG9C00 | LCDCF_WIN9C00 | LCDCF_ON
	ldh [rLCDC],a

	; Print Gameboy boiler plate project centered horizontally and vertically
	printstr GameBoyStr, 			_MAP1, 	(17/2) - 1, 	(20/2) - (16/2)
	printstr BoilerPlateProjectStr, _MAP1, 	(17/2), 		(20/2) - (16/2)
	printstr EmoticonStr, 			_MAP1, 	(17/2) + 2, 	(20/2) - (16/2)

	call DMAInstall    ;Install DMA to HRAM (also initiates first run)
	jp GameLoop
