; Master include file

include "./src/General/Hardware.inc"
;include "./src/General/Charmap.inc" ; Disabled since it can be dangerous to auto-include everywhere
include "./src/General/WRAMCodes.inc"
include "./src/General/Misc.inc"

include "./src/Core/Banks/Banks.inc"
include "./src/Core/Data/Data.inc"
include "./src/Core/DMA/DMA.inc"
include "./src/Core/Graphics/Graphics.inc"
include "./src/Core/Joypad/Joypad.inc"
include "./src/Core/LCD.inc"
include "./src/Core/MBC/MBC.inc"
include "./src/Core/InterruptHandlers/Timer.inc"
