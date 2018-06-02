include "./src/Includes.inc"
include "./src/General/Charmap.inc"

section "StringTable", rom0

HelloWorldStr::
	db "Hello World! ^_^;", GSTOP

GameBoyStr::
	db "▓▒░ Game Boy ░▒▓", GSTOP

BoilerPlateProjectStr::
	db "Boilerplate Proj", GSTOP

EmoticonStr::
	db "     (^.^)      ", GSTOP
