nintendo_logo:   MACRO
    ;
    ; Nintendo scrolling logo
    ; (Code won't work on a real GameBoy)
    ; (if next six lines are altered.)
    DB $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D
    DB $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99
    DB $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E
ENDM

;***************************************************************************
;*
;* Cart related
;*
;***************************************************************************

CART_ROM                  EQU 0   ; ROM
CART_ROM_MBC1             EQU 1   ; ROM+MBC1
CART_ROM_MBC1_RAM         EQU 2   ; ROM+MBC1+RAM
CART_ROM_MBC1_RAM_BAT     EQU 3   ; ROM+MBC1+RAM+BATTERY
CART_ROM_MBC2             EQU 5   ; ROM+MBC2
CART_ROM_MBC2_BAT         EQU 6   ; ROM+MBC2+BATTERY
CART_ROM_RAM              EQU 8   ; ROM+RAM
CART_ROM_RAM_BAT          EQU 9   ; ROM+RAM+BATTERY
CART_ROM_MMM              EQU $b  ; ROM+MMM01
CART_ROM_RAM_MMM          EQU $c  ; ROM+RAM+MMM01
CART_ROM_RAM_MMM_BAT      EQU $d  ; ROM+RAM+MMM01+BATTERY
CART_ROM_MBC3_TIM_BAT     EQU $f  ; ROM+MBC3+TIMER+BATTERY
CART_ROM_MBC3_TIM_RAM_BAT EQU $10 ; ROM+MBC3+TIMER+RAM+BATTERY
CART_ROM_MBC3             EQU $11 ; ROM+MBC3
CART_ROM_MBC3_RAM         EQU $12 ; ROM+MBC3+RAM
CART_ROM_MBC3_RAM_BAT     EQU $13 ; ROM+MBC3+RAM+BATTERY
CART_ROM_MBC4             EQU $15 ; ROM+MBC4
CART_ROM_MBC4_RAM         EQU $16 ; ROM+MBC4+RAM
CART_ROM_MBC4_RAM_BAT     EQU $17 ; ROM+MBC4+RAM+BATTERY
CART_ROM_MBC5             EQU $19 ; ROM+MBC5
CART_ROM_MBC5_RAM         EQU $1a ; ROM+MBC5+RAM
CART_ROM_MBC5_RAM_BAT     EQU $1b ; ROM+MBC5+RAM+BATTERY
CART_ROM_MBC5_RUM         EQU $1c ; ROM+MBC5+RUMBLE
CART_ROM_MBC5_RUM_RAM     EQU $1d ; ROM+MBC5+RUMBLE+RAM
CART_ROM_MBC5_RUM_RAM_BAT EQU $1e ; ROM+MBC5+RUMBLE+RAM+BATTERY
CART_CAMERA               EQU $fc ; Camera ROM
CART_TAMA5                EQU $fd ; Bandai Tama 5
CART_HuC3                 EQU $fe ; HuC3
CART_HuC1_RAM_BAT         EQU $ff ; HuC1+RAM+BATTERY

CART_ROM_256K  EQU 0
CART_ROM_512K  EQU 1
CART_ROM_1M    EQU 2
CART_ROM_2M    EQU 3
CART_ROM_4M    EQU 4
CART_ROM_8M    EQU 5
CART_ROM_16M   EQU 6

CART_RAM_NONE  EQU 0
CART_RAM_16K   EQU 1
CART_RAM_64K   EQU 2
CART_RAM_256K  EQU 3
