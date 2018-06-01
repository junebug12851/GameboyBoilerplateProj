include "./src/Setup/Charmap.inc"
include "./src/Engine/Graphics.inc"

section "StringTable", rom0

HelloWorldStr::
	db "Hello World! ^_^;", GSTOP

GameBoyStr::
	db "▓▒░ Game Boy ░▒▓", GSTOP

BoilerPlateProjectStr::
	db "Boilerplate Proj", GSTOP

EmoticonStr::
	db "     (^.^)      ", GSTOP
