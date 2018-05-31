section "Rst 00", rom0 [$00]
	db 00 ; Rom bank 0 ID for data reads and nop for processor
	rst $38

section "Rst 08", rom0 [$08]
	rst $38

section "Rst 10", rom0 [$10]
	rst $38

section "Rst 18", rom0 [$18]
	rst $38

section "Rst 20", rom0 [$20]
	rst $38

section "Rst 28", rom0 [$28]
	rst $38

section "Rst 30", rom0 [$30]
	rst $38
	
section "Rst 38", rom0 [$38]
	rst $38
