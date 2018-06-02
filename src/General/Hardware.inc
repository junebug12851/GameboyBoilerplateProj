;*
;* Gameboy Hardware definitions
;*
;* Based on Jones' hardware.inc
;* And based on Carsten Sorensen's ideas.
;*
;* Rev 1.1 - 15-Jul-97 : Added define check
;* Rev 1.2 - 18-Jul-97 : Added revision check macro
;* Rev 1.3 - 19-Jul-97 : Modified for RGBASM V1.05
;* Rev 1.4 - 27-Jul-97 : Modified for new subroutine prefixes
;* Rev 1.5 - 15-Aug-97 : Added _HRAM, PAD, CART defines
;*                     :  and Nintendo Logo
;* Rev 1.6 - 30-Nov-97 : Added rDIV, rTIMA, rTMA, & rTAC
;* Rev 1.7 - 31-Jan-98 : Added _SCRN0, _SCRN1
;* Rev 1.8 - 15-Feb-98 : Added rSB, rSC
;* Rev 1.9 - 16-Feb-98 : Converted I/O registers to $FFXX format
;* Rev 2.0 -           : Added GBC registers
;* Rev 2.1 -           : Added MBC5 & cart RAM enable/disable defines
;* Rev 2.2             : Fixed NR42,NR43, & NR44 equates
;* Rev 2.3 -           : Fixed incorrect _HRAM equate
;* Rev 2.4 -           : Completed CART defines
;* Rev 2.5 -           : Fixed bug in CART defines
;* Rev 2.6 -           : Corrected and fixed several parts, broke apart

if      !def(HARDWARE_INC)
HARDWARE_INC  set  1

include "./src/General/Hardware/MemoryMap.inc"
include "./src/General/Hardware/MBC3.inc"
include "./src/General/Hardware/OAM.inc"

include "./src/General/Hardware/Joypad.inc"
include "./src/General/Hardware/Serial.inc"
include "./src/General/Hardware/Timer.inc"
include "./src/General/Hardware/Interrupts.inc"
include "./src/General/Hardware/LCD.inc"
include "./src/General/Hardware/WindowBG.inc"

include "./src/General/Hardware/Sound/SoundControl.inc"
include "./src/General/Hardware/Sound/Sound1.inc"
include "./src/General/Hardware/Sound/Sound2.inc"
include "./src/General/Hardware/Sound/Sound3.inc"

include "./src/General/Hardware/Header.inc"

endc
