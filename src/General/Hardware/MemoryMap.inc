_ROM0           EQU $0000 ; $0000->$3FFF    Rom Bank 0
_ROM0_SIZE      EQU $3FFF

_ROMX           EQU $4000 ; $4000->$7FFF    Rom Bank 1-...
_ROMX_SIZE      EQU $3FFF

_VRAM           EQU $8000 ; $8000->$9FFF    Video RAM
_VRAM_SIZE      EQU $1FFF

_TILES0         EQU $8000 ; $8000->$87FF    Video RAM Tile Data 0
_TILES0_SIZE    EQU $7FF
_TILESS         EQU $8800 ; $8800->$8FFF    Video RAM Tile Data Shared
_TILESS_SIZE    EQU $7FF
_TILES1         EQU $9000 ; $9000->$97FF    Video RAM Tile Data 1
_TILES1_SIZE    EQU $7FF
_MAP0           EQU $9800 ; $9800->$9BFF    Video RAM Tile Map 0
_MAP0_SIZE      EQU $3FF
_MAP1           EQU $9C00 ; $9C00->$9FFF    Video RAM Tile Map 1
_MAP1_SIZE      EQU $3FF

_SRAM           EQU $A000 ; $A000->$BFFF    External/Save RAM
_SRAM_SIZE      EQU $1FFF

_WRAM           EQU $C000 ; $C000->$DFFF    Work RAM
_WRAM_SIZE      EQU $1FFF

_ECHO           EQU $E000 ; $E000->$FDFF    Echo RAM of Work RAM !! Strictly Off-limits
_ECHO_SIZE      EQU $1DFF

_OAMRAM         EQU $FE00 ; $FE00->$FE9F    OAM RAM (Sprite Attribute Table)
_OAMRAM_SIZE    EQU $9F

_IO	            EQU $FF00 ; $FF00->$FF7F    IO Registers
_IO_SIZE        EQU $7F

_HRAM           EQU $FF80 ; $FF80->$FFFE    High RAM
_HRAM_SIZE      EQU $7E

_IE             EQU $FFFF ; $FFFF           Interrupts Enable
