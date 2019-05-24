include "./src/Includes.inc"
include "./src/General/Charmap.inc"

section "ScreenMain", romx,bank[1]

ScreenMain::
db 126,126,126,126,125,125,125,125,125,125,125,125,125,124,124,124,124,124,124,124,GSTOP
db 126, 94,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113, 94,124,GSTOP
db 126,116,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,106,124,GSTOP
db 126,105, 63,123,113,113,113,113,113,113,113,113,113,113,113,108, 63, 63,105,124,GSTOP
db 125,105,63,102,101,100,99,7,40,47,47,50,99,100,101,102,63,63,105,124,GSTOP
db 125,105,63,109,113,113,113,113,113,113,113,113,113,113,113,122,63,63,105,124,GSTOP
db 125,105,63,63,63,63,63,91,92,94,92,81,63,63,63,63,63,63,105,124,GSTOP
db 125,105,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,105,125,GSTOP
db 125,105,63,6,36,48,40,37,50,60,63,63,63,63,63,63,63,63,105,125,GSTOP
db 125,105,63,63,1,50,44,47,40,53,51,47,36,55,40,63,63,63,105,125,GSTOP
db 125,105,63,63,63,15,53,50,45,40,38,55,63,63,63,63,63,63,105,125,GSTOP
db 124,105,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,105,125,GSTOP
db 124,105,63,112,124,125,126,125,124,103,63,63,63,63,63,63,63,63,105,125,GSTOP
db 124,105,63,102,124,125,126,125,124,102,63,63,21,40,53,62,28,63,105,125,GSTOP
db 124,105,63,115,110,120,110,120,110,107,63,63,63,63,63,63,63,63,105,126,GSTOP
db 124,115,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,107,126,GSTOP
db 124,94,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,94,126,GSTOP
db 124,124,124,124,124,124,124,125,125,125,125,125,125,125,125,125,126,126,126,126,GSTOP
db GEND