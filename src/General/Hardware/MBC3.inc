MBC3_ENABLE_RAM         EQU $0000       ; RAM Enable
MBC3_ROM_SELECT         EQU $2000       ; ROM Select
MBC3_RAM_SELECT         EQU $4000       ; RAM Select
MBC3_RTC_LATCH          EQU $6000       ; RTC (Clock) Latch

MBC3_DIS_RAM_CODE       equ $0          ; Disable RAM Code to write to MBC3_ENABLE_RAM
MBC3_EN_RAM_CODE        equ $A          ; Enable RAM Code to write to MBC3_ENABLE_RAM

MBC3_LATCH_CODE_1       equ $0
MBC3_LATCH_CODE_2       equ $1          ; Code steps to latch new clock data, write to MBC3_RTC_LATCH

MBC3_RTC_S_BNK          equ $8          ; Select RTC seconds bank write to MBC3_RAM_SELECT
MBC3_RTC_M_BNK          equ $9          ; Select RTC minutes bank write to MBC3_RAM_SELECT
MBC3_RTC_H_BNK          equ $A          ; Select RTC hours bank write to MBC3_RAM_SELECT
MBC3_RTC_DL_BNK         equ $B          ; Select RTC days lower (bits 8 of 9) bank write to MBC3_RAM_SELECT
MBC3_RTC_DU_BNK         equ $C          ; Select RTC days upper (bits 9 of 9) + flags bank write to MBC3_RAM_SELECT

MBC3_RTC_DUF_DAY9       equ %00000001   ; Days Upper flag to select day bit 9
MBC3_RTC_DUF_HALT       equ %01000000   ; Halt clock flag
MBC3_RTC_DUF_CARRY      equ %10000000   ; Day carry flag on day overflow

MBC3_RTC_DUB_DAY9       equ 1           ; Days Upper flag to select day bit 9
MBC3_RTC_DUB_HALT       equ 6           ; Halt clock flag
MBC3_RTC_DUB_CARRY      equ 7           ; Day carry flag on day overflow
