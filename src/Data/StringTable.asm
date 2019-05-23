include "./src/Includes.inc"
include "./src/General/Charmap.inc"

section "StringTable", romx,bank[1]

HelloWorldStr::
	db "Hello World! ^_^;", GSTOP

GameBoyStr::

	db "▓▒░ Game Boy ░▒▓", GSTOP

BoilerPlateProjectStr::
	db "Boilerplate Proj", GSTOP

EmoticonStr::
	db "     (^.^)      ", GSTOP
