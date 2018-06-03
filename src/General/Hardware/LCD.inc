;***************************************************************************
;*
;* Screen related
;*
;***************************************************************************

SCRN_X     EQU  160 ; Width of screen in pixels
SCRN_Y     EQU  144 ; Height of screen in pixels
SCRN_X_B   EQU  20  ; Width of screen in bytes
SCRN_Y_B   EQU  18  ; Height of screen in bytes

SCRN_VX    EQU  256 ; Virtual width of screen in pixels
SCRN_VY    EQU  256 ; Virtual height of screen in pixels
SCRN_VX_B  EQU  32  ; Virtual width of screen in bytes
SCRN_VY_B  EQU  32  ; Virtual height of screen in bytes

; --
; -- LCDC ($FF40)
; -- LCD Control (R/W)
; --
rLCDC               EQU $FF40

LCDCF_OFF           EQU %00000000 ; LCD Power
LCDCF_ON            EQU %10000000 ; LCD Power

LCDCF_WIN9800       EQU %00000000 ; Window Tilemap Select
LCDCF_WIN9C00       EQU %01000000 ; Window Tilemap Select

LCDCF_WINOFF        EQU %00000000 ; Window Display
LCDCF_WINON         EQU %00100000 ; Window Display

LCDCF_TD8800        EQU %00000000 ; BG & Window Tile Data Select
LCDCF_TD8000        EQU %00010000 ; BG & Window Tile Data Select

LCDCF_BG9800        EQU %00000000 ; BG Tilemap Select
LCDCF_BG9C00        EQU %00001000 ; BG Tilemap Select

LCDCF_OBJ8          EQU %00000000 ; OBJ Construction
LCDCF_OBJ16         EQU %00000100 ; OBJ Construction

LCDCF_OBJOFF        EQU %00000000 ; OBJ Display
LCDCF_OBJON         EQU %00000010 ; OBJ Display

LCDCF_BGOFF         EQU %00000000 ; BG Display
LCDCF_BGON          EQU %00000001 ; BG Display

; --
; -- STAT ($FF41)
; -- LCDC Status   (R/W)
; --
rSTAT               EQU $FF41

; Interrupt Selection
STATF_SEL_LYC       EQU %01000000 ; LYCEQULY Coincidence
STATF_SEL_MODE10    EQU %00100000 ; Mode 10
STATF_SEL_MODE01    EQU %00010000 ; Mode 01 (V-Blank)
STATF_SEL_MODE00    EQU %00001000 ; Mode 00 (H-Blank)

; Interrupt Reason
STATF_LYCF          EQU %00000100 ; Coincidence Flag

STATF_MODE_MASK     EQU %00000011
STATF_HB            EQU %00000000 ; H-Blank
STATF_VB            EQU %00000001 ; V-Blank
STATF_BUSY          EQU %00000010
STATF_LCD           EQU %00000011 ; OAM and VRAM Busy

; --
; -- LY ($FF44)
; -- LCDC Y-Coordinate (R)
; --
; -- Values range from 0->153. 144->153 is the VBlank period.
; --
rLY                 EQU $FF44

; --
; -- LYC ($FF45)
; -- LY Compare (R/W)
; --
; -- When LYEQUEQULYC, STATF_LYCF will be set in STAT
; --
rLYC                EQU $FF45
