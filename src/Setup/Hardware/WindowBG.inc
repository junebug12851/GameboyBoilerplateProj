; --
; -- SCY ($FF42)
; -- Scroll Y (R/W)
; --
rSCY  EQU $FF42

; --
; -- SCY ($FF43)
; -- Scroll X (R/W)
; --
rSCX  EQU $FF43

; --
; -- WY ($FF4A)
; -- Window Y Position (R/W)
; --
; -- 0 <= WY <= 143
; --
rWY EQU $FF4A

; --
; -- WX ($FF4B)
; -- Window X Position (R/W)
; --
; -- 7 <= WX <= 166
; --
rWX EQU $FF4B

; --
; -- DMA ($FF46)
; -- DMA Transfer and Start Address (W)
; --
rDMA  EQU $FF46


; --
; -- BGP ($FF47)
; -- BG Palette Data (W)
; --
; -- Bit 7-6 - Intensity for %11
; -- Bit 5-4 - Intensity for %10
; -- Bit 3-2 - Intensity for %01
; -- Bit 1-0 - Intensity for %00
; --
rBGP  EQU $FF47


; --
; -- OBP0 ($FF48)
; -- Object Palette 0 Data (W)
; --
; -- See BGP for info
; --
rOBP0 EQU $FF48


; --
; -- OBP1 ($FF49)
; -- Object Palette 1 Data (W)
; --
; -- See BGP for info
; --
rOBP1 EQU $FF49
