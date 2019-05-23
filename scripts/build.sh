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
# -p 0xCB                   Pad Value (CB = Results in Needed Crash when CPU Derailed)
find ./build -iname '*.obj' -exec rgblink -d -p 0xCB -m ./build/game.map -n ./build/game.sym -o ./build/game.gb {} +

# Fix to proper ROM
# -C                        Only for regular Gameboy
# -f lhg                    Add in the Nintendo Logo, Header Checksum, and Global Checksum
# -i PROJ                   Set Game UID as PROJ
# -j                        Game made outside of japan
# -k 00                     2 digit license string (00 = Sandbox/Unlincensed)
# -m 0x1B                   MBC code (1B = MBC5 + RAM + Battery)
# -n 0x02                   Rom Version 2
# -r 0x04                   RAM Size (0x04 = 128KB)
# -t "BOILERPLATEPROJ"      ROM Title 15 Chars
# -p 0xCB                   Pad Value (CB = Results in Needed Crash when CPU Derailed)

rgbfix -C -f lhg -i PROJ -j -k 00 -m 0x1B -n 0x02 -r 0x04 -t "BOILERPLATEPROJ" -p 0xCB ./build/game.gb

echo "Completed building"
