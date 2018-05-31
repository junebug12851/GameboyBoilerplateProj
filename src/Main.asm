; Game Constants, Charmap Compiler fixes, Memory Location Constants, and Macros
include "./src/Setup/Hardware.asm"
include "./src/Setup/Charmap.asm"
include "./src/Structure/WRAM.asm"
include "./src/Structure/VRAM.asm"
include "./src/Structure/HRAM.asm"
include "./src/Structure/SRAM.asm"
include "./src/Structure/ROM.asm"

; Engines
include "./src/Engine/Graphics.asm"
include "./src/Engine/MBC.asm"
include "./src/Engine/Banks.asm"

; RST and Interrupts Code
include "./src/Fixed/RST.asm"
include "./src/Fixed/Interrupts.asm"

; ROM Entry and ROM Header
include "./src/Fixed/Entry.asm"
include "./src/Fixed/Header.asm"

; Various utilities and such
include "./src/Home/LCD.asm"
include "./src/Home/Data.asm"
include "./src/home/RSTHandlers.asm"

; ROM Starting Point and Game Loop
include "./src/Home/Start.asm"
include "./src/Home/GameLoop.asm"

; Various Home Code
include "./src/Home/MemoryMngmt.asm"
include "./src/Home/InterruptHandlers.asm"
include "./src/Home/DMA.asm"
include "./src/Home/Joypad.asm"

; Various Data
include "./src/Data/StringTable.asm"
include "./src/Data/Tilesets/Tileset1.z80"
