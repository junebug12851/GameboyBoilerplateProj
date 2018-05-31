#!/bin/sh

echo "Building..."

# Compile to object
rgbasm -o ./build/hello.obj ./src/Main.asm

# Output as gameboy file with debug map and symbols
rgblink -m ./build/hello.map -n ./build/hello.sym -o ./build/hello.gb ./build/hello.obj

# Fix to proper ROM
# -c                        Color Support but not for Color
# -f lhg                    Add in the Nintendo Logo, Header Checksum, and Global Checksum
# -i HANA                   Set Game UID as HANA
# -j                        Game made outside of japan
# -k 00                   2 digit license string (00 = Sandbox/Unlincensed)
# -m 0x10                   MBC code (10 = MBC3 + Timer + RAM + Battery)
# -n 0x00                   Rom Version 0
# -r 0x03                   RAM Size (0x03 = 32KB)
# -t "HELLO WORLD    "      ROM Title 15 Chars
# -p 0xFF                   Pad Value (FF = RST 38H as Epic Crash Debugging)

rgbfix -c -f lhg -i HANA -j -k 00 -m 0x10 -n 0x00 -r 0x03 -t "HELLO WORLD    " -p 0xFF ./build/hello.gb

echo "Completed building"
