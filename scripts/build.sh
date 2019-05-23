#!/bin/sh

echo "Building..."

# Clear Build Folder
rm -Rf ./build/*

# Copy source files over
cp -R ./src/* ./build

# Compile source and image files individually
find ./build -iname '*.png' -exec rgbgfx -f -o {}.2bpp {} \;
find ./build -iname '*.asm' -exec rgbasm -o {}.obj {} \;
find ./build -iname '*.z80' -exec rgbasm -o {}.obj {} \;

# Output as gameboy file with debug map and symbols
# -d                        Original Gameboy only, disable color features
# -p 0xFF                   Pad Value (FF = RST 38H as Epic Crash Debugging)
find ./build -iname '*.obj' -exec rgblink -d -p 0xFF -m ./build/game.map -n ./build/game.sym -o ./build/game.gb {} +

# Fix to proper ROM
# -c                        Color Support but not for Color
# -f lhg                    Add in the Nintendo Logo, Header Checksum, and Global Checksum
# -i PROJ                   Set Game UID as PROJ
# -j                        Game made outside of japan
# -k 00                   2 digit license string (00 = Sandbox/Unlincensed)
# -m 0x10                   MBC code (10 = MBC3 + Timer + RAM + Battery)
# -n 0x00                   Rom Version 0
# -r 0x03                   RAM Size (0x03 = 32KB)
# -t "BOILERPLATEPROJ"      ROM Title 15 Chars
# -p 0xFF                   Pad Value (FF = RST 38H as Epic Crash Debugging)

rgbfix -c -f lhg -i PROJ -j -k 00 -m 0x10 -n 0x00 -r 0x03 -t "BOILERPLATEPROJ" -p 0xFF ./build/game.gb

echo "Completed building"
