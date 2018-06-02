include "./src/Includes.inc"

section "Start", rom0

Start::
	di ; Ensure interrupts are globally disabled
    ld  sp,$FFFE ; Set location of stack pointer
    lcd "off" ; Disable LCD Screen

    xor a ; Zero A

    ld [rIF], a ; Clear Interrupt Reason Flags
    ld [rSB], a
    ld [rSC], a ; Clear Serial Transfer
    ld [rSCY], a
    ld [rSCX], a ; Reset Background Scrolling

    ld [rWY], a
    ld a, 7
    ld [rWX], a ; Reset window placement

    ; Timer Setup
    ld a, 0
    ld [rDIV], a
    ld [rTIMA], a ; Reset Divider and current timer count

    ld a, 0
    ld [rTMA], a ; Enable full timer (counts from 0-255 before triggering interrupt)

    ld a, TACF_START | TACF_4KHZ
    ld [rTAC], a ; Enable timer to count at 4KHz from 0 - 255 before triggering timer interrupt

    ld a, IEF_SERIAL | IEF_TIMER | IEF_LCDC | IEF_VBLANK
    ld [rIE], a ; Enable Serial, Timer, LCDC, and VBlank Interrupts

    ld a, STATF_SEL_MODE00
    ld [rSTAT], a ; Enable LCDC interuptions for HBlank

    ld a, SCRN_Y
    ld [rLYC], a ; Set LYC compare to VBlank (For now, expanded later, disabled though)
    
    call WipeMemory ; Wipe all Memory
    call MBCRunOnce ; Initialize MBC Controller and SRAM

    ld a, %11100100
    ld [rBGP], a
    ld [rOBP0], a
    ld [rOBP1], a ; Reset Palettes

    joypad_reset ; Reset Joypad

    ld a, $C0
	ld [wOamPage], a ; Set OAM page to $C0

    mbc_select "rom", 1 ; Select External ROM Bank 1

    ; Copy Font into Tile Data
	copy Tileset1, vTileset1, Tileset1End - Tileset1

    ; BG On
    ; Window & Sprites Off
	; 8x8 Tiles
	; BG and Window share Tilemap Data $9800
	; BG Data at $8000-$8FFF
    ld  a,LCDCF_OFF | LCDCF_WIN9800 | LCDCF_WINOFF | LCDCF_TD8000 | LCDCF_BG9800 | LCDCF_OBJ8 | LCDCF_OBJOFF | LCDCF_BGON
	ldh [rLCDC],a

    ; Print Gameboy boiler plate project centered horizontally and vertically
	printstr GameBoyStr, 			_MAP0, 	(17/2) - 1, 	(20/2) - (16/2)
	printstr BoilerPlateProjectStr, _MAP0, 	(17/2), 		(20/2) - (16/2)
	printstr EmoticonStr, 			_MAP0, 	(17/2) + 2, 	(20/2) - (16/2)

    call DMAInstall    ;Install DMA to HRAM (also initiates first run)

    lcd "on"
    ei ; Turn on LCD and Enable interrupts

    jp GameLoop
