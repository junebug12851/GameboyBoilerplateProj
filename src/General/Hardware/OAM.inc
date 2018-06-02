OAM_Y       EQU 0           ; Sprite Y Position
OAM_X       EQU 1           ; Sprite X Position
OAM_TILE    EQU 2           ; Sprite Tile Number (Always pulls from Tiles0)
OAM_FLAGS   EQU 3           ; Flags (First 4 bits are NOT USED!)

OAMF_PRI    EQU  %10000000 ; Priority
OAMF_YFLIP  EQU  %01000000 ; Y flip
OAMF_XFLIP  EQU  %00100000 ; X flip
OAMF_PAL0   EQU  %00000000 ; Palette number; 0,1
OAMF_PAL1   EQU  %00010000 ; Palette number; 0,1
