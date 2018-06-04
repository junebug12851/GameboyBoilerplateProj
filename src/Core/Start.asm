include "./src/Includes.inc"

section "Start", rom0

Start::
	di ; Ensure interrupts are globally disabled
    ld  sp, $FFFE ; Set temporary location of stack pointer

    wait_di "vblank" ; Wait for VBlank
    lcd_power "off" ; Disable LCD Screen

    xor a ; Zero A

    ld [rIF], a ; Clear Interrupt Reason Flags
    ld [rSB], a
    ld [rSC], a ; Clear Serial Transfer
    ld [rSCY], a
    ld [rSCX], a ; Reset Background Scrolling

    ld [rWY], a
    ld a, 7
    ld [rWX], a ; Reset window placement

    set_timer 4, 0 ; Enable timer to count at 4KHz from 0 - 255 before triggering timer interrupt

    ld a, IEF_SERIAL | IEF_TIMER | IEF_LCDC | IEF_VBLANK
    ld [rIE], a ; Enable Serial, Timer, LCDC, and VBlank Interrupts

    ld a, STATF_SEL_MODE00
    ld [rSTAT], a ; Enable LCDC interuptions for HBlank

    ld a, SCRN_Y
    ld [rLYC], a ; Set LYC compare to VBlank (For now, expanded later, disabled though)
    
    call WipeMemory ; Wipe all Memory
    ld sp, wStackPointer ; Move stack pointer to cleaned up and larger memory section
                         ; From 113 bytes to 256 bytes and expandable
    fill _HRAM, 	_HRAM_SIZE, 	0 	; Clean up HRAM now that the SP has vacated it
    call MBCRunOnce ; Initialize MBC Controller and SRAM

    ld a, %11100100
    ld [rBGP], a
    ld [rOBP0], a
    ld [rOBP1], a ; Reset Palettes

    joypad_reset ; Reset Joypad

    ld a, $C0
	ld [wOamPage], a ; Set OAM page to $C0

    mbc_select "rom", 1 ; Select External ROM Bank 1

    ; Init timers
    ld a, TIMER_TMA
    ld [wTimerCount], a

    ld a, TIMER_QUART_SECOND_TMA
    ld [wTimerQuartSec], a

    ld a, TIMER_SECOND_TMA
    ld [wTimerS], a

    ld a, TIMER_MINUTE_TMA
    ld [wTimerM], a

    ld a, TIMER_HOUR_TMA
    ld [wTimerH], a

    ; Copy Font into Tile Data
	copy Tileset1, vTileset1, Tileset1End - Tileset1

    background "on"
    background "map 0" ; Enable background and switch it to map 0 ($9800)
    window "off"
    window "map 0" ; Disable window but prepare it to same map 
    sprites "off"
    sprites "8x8" ; Disable sprites but prepare them to be 8x8
    tiledata 0 ; Use tiledata 0 ($8000)

    ; Print Gameboy boiler plate project centered horizontally and vertically
	printstr GameBoyStr, 			_MAP0, 	(17/2) - 1, 	(20/2) - (16/2)
	printstr BoilerPlateProjectStr, _MAP0, 	(17/2), 		(20/2) - (16/2)
	printstr EmoticonStr, 			_MAP0, 	(17/2) + 2, 	(20/2) - (16/2)

    call DMAInstall    ;Install DMA to HRAM (also initiates first run)

    lcd_power "on"
    ei ; Turn on LCD and Enable interrupts

    jp GameLoop
