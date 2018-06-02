include "./src/General/Charmap.inc"
include "./src/Core/Graphics/Graphics.inc"

section "StringTable", rom0

HelloWorldStr::
	db "Hello World! ^_^;", GSTOP

GameBoyStr::
	db "▓▒░ Game Boy ░▒▓", GSTOP

BoilerPlateProjectStr::
	db "Boilerplate Proj", GSTOP

EmoticonStr::
	db "     (^.^)      ", GSTOP
