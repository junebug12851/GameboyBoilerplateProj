include "./src/Includes.inc"

section "Start", rom0

; Local macros for code cleanliness
; It's a macro to save uneeded code jumping or stack usage

; Init System "Settings"
init_registers:     macro
    xor a ; Zero A

    ; Clear and Reset Several Registers and Flags
    ld [rIF], a ; Interrupt Reason Flags
    ld [rSB], a
    ld [rSC], a ; Serial Transfer
    ld [rSCY], a
    ld [rSCX], a ; Background Scrolling

    ; Properly setup window placement
    ld [rWY], a
    ld a, 7
    ld [rWX], a

    ; When interrupts are re-enabled at the end
    ; We're only interested in Serial, Timer, LCDC, and VBlank Interrupts only
    ld a, IEF_SERIAL | IEF_TIMER | IEF_LCDC | IEF_VBLANK
    ld [rIE], a

    ; We're also interested in H-Blank Interrupts
    ld a, STATF_SEL_MODE00
    ld [rSTAT], a

    ; For now LYC Interrupts trigger on VBlank
    ld a, SCRN_Y
    ld [rLYC], a

    ; Reset Palettes
    ; 11    22      33      44
    ; 1 = Color for Darkest Color
    ; 4 = Color for Lightest Color
    ;
    ; The default is
    ; 11    10      01      00
    ; Keep that way for now
    ld a, %11100100
    ld [rBGP], a
    ld [rOBP0], a
    ld [rOBP1], a ; Reset Palettes

    ; Enable ticking timer at 4KHz to count from 0-255
    set_timer 4, 0

     ; Enable background and switch it to map 0 ($9800)
    background "on"
    background "map 0"

    ; Disable window but prepare it to same map 
    window "off"
    window "map 0"

    ; Disable sprites but prepare them to be 8x8
    sprites "off"
    sprites "8x8"

    ; Use tiledata 0 ($8000)
    tiledata 0 
endm

; Wipe all memory and cartridge ram if needed and properly setup
init_memory:    macro
    ; Power On Cartridge RAM
    mbc_power "on"

    ; Wipe All Internal Memory
    wipe_memory

    ; Move stack pointer to cleaned up and larger memory section
    ; From 113 bytes to 256 bytes and expandable
    ld sp, wStackPointer 

    ; Clean up HRAM now that the SP has vacated it   
    fill _HRAM, 	_HRAM_SIZE, 	0

    ; Reset Joypad
    joypad_reset

    ; Init and Setup MBC Controller
    ; Format Cart RAM if need be
    mbc_init

    ; Select ROM & RAM Bank 1

    ; The Gameboy wants external RAM turned off whenever possible
    ; to protect accidental data corruption on a power cycle
    ; We use the RAM for both persistent and non-persistent data
    ; Therefore we switch to a non-persistent data bank where we
    ; don't care if this happens

    ; Leaving it on saves precious clock cycles since we do intend
    ; to use it for non-persistent data and don't need to keep turning
    ; it on and off

    ; Always ensure it's never on a persistent data bank when not needed
    mbc_select "rom", 1
    mbc_select "ram", 1

    ; Set OAM page to $C0
    ld a, $C0
	ld [wOamPage], a

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
	copy FontTileset, vTileset1, FontTilesetEnd - FontTileset
endm

; Initial setup of the Gameboy
Start::
    ; Disable Interrupts so we're left alone to initialize
    ; everything in peace
	di

    ; Place the processor stack somewhere temporary
    ; until we can setup things more
    ld  sp, $FFFE

    ; Wait for a VBlank meaning all memory is open
    ; Since interupts are disabled this is a polling wait
    ; We want to specifically wait until the start of vblank
    poll_vblank_start

    ; Disable LCD Screen
    ; This ensures everything remains uninterupted
    ; and stays in a permanent V-Blank until re-enabled
    lcd_power "off"

    ; Format and Init all Memory
    init_memory

    ; Setup All System Registers
    init_registers

    ;Install DMA to HRAM (also initiates first run)
    dma_install

    ; Print Main Screen starting at UL corner of MAP 0
    printmap ScreenMain, _MAP0, 0, 0

    ; Flip LCD back on
    lcd_power "on"

    ; Re-Enable Interupts now that everything is properly setup
    ei

    ; We're done, begin game as usual
    jp GameLoop
