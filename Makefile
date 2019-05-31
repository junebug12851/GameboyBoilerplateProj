#
# Makefile for building the ROM, as an alternative to scripts/build.sh
#

#------------------------------------------------------------------------------
# VARIABLES

# some important paths (no trailing slash)
BUILD_DIR := build
SRC_DIR := src

#
# ROM file name
#
ROM_NAME := game

#
# game ID string (must be 4 characters)
#
ROM_ID := PROJ

#
# game title (truncated to 16 characters)
#
ROM_TITLE := BOILERPLATEPROJ

ROM_GB := $(BUILD_DIR)/$(ROM_NAME).gb
ROM_MAP := $(BUILD_DIR)/$(ROM_NAME).map
ROM_SYM := $(BUILD_DIR)/$(ROM_NAME).sym

#
# Variables for the RGB toolchain (just the command name if you have PATH set)
#
RGBASM := rgbasm
RGBLINK := rgblink
RGBFIX := rgbfix
RGBGFX := rgbgfx

ASM_FLAGS :=
LINK_FLAGS := -d -p 0xFF -m $(ROM_MAP) -n $(ROM_SYM)
FIX_FLAGS := -c -f lhg -i "$(ROM_ID)" -j -k 00 -m 0x10 -n 0x00 -r 0x03 -t "$(ROM_TITLE)" -p 0xFF

# (optional) user-specific overrides
# this can be used to specify the location of the RGBDS toolchain manually
# or a different build directory can be used by overriding BUILD_DIR
-include user.mk

#
# List of object files to build, when adding a new assembly file, add its
# object file here (preferably in alphabetical order).
# Note: globbing could be used, but I do not recommend it for various reasons
#       (speed, excluding files is a pain, etc)
#
OBJ_FILES := Core/Banks/Banks.obj \
             Core/Data/Data.obj \
             Core/DMA/DMA.obj \
             Core/Graphics/Graphics.obj \
             Core/InterruptHandlers/HBlank.obj \
             Core/InterruptHandlers/Joypad.obj \
             Core/InterruptHandlers/LCDC.obj \
             Core/InterruptHandlers/LYC.obj \
             Core/InterruptHandlers/Serial.obj \
             Core/InterruptHandlers/Timer.obj \
             Core/InterruptHandlers/VBlank.obj \
             Core/Joypad/Joypad.obj \
             Core/MBC/MBC.obj \
             Core/Boot.obj \
             Core/GameLoop.obj \
             Core/Memory.obj \
             Core/RSTHandlers.obj \
             Core/Start.obj \
             Data/Tilemaps/Main.tilemap.obj \
             Data/Tilesets/Font/Font.tileset.obj \
             Data/StringTable.obj \
             Fixed/Entry.obj \
             Fixed/Header.obj \
             Fixed/Interrupts.obj \
             Fixed/RST.obj \
             Structure/HRAM.obj \
             Structure/ROM.obj \
             Structure/SRAM.obj \
             Structure/VRAM.obj \
             Structure/WRAM.obj
OBJ_FILES := $(addprefix $(BUILD_DIR)/,$(OBJ_FILES))

# dependency files to be created by the assembler
# not currently used due to the way files are include'd currently
# NOTE: this actually stalls the build due to repeated includes, some .d files
# end up being ~200 lines long due to no guards on src/Includes.inc and a
# possible bug with RGBASM (duplicate entries)
#OBJ_DEPS := $(OBJ_FILES:.obj=.d)

# get a list of all directories that will need to be created when building
# patsubst removes the trailing slash
# (for some reason if this was left in, make would always remake the directories)
# sort is used to remove duplicates
OBJ_DIRS := $(patsubst %/,%,$(sort $(dir $(OBJ_FILES))))


# -----------------------------------------------------------------------------
# RULES

#
# default target is the ROM file
#
all: $(ROM_GB)

define ASSEMBLE_RULE
	@echo "ASM      $@"
	@$(RGBASM) $(ASM_FLAGS) -o $@ $<
endef
#	@$(RGBASM) $(ASM_FLAGS) -M $(BUILD_DIR)/$*.d -o $@ $<


#
# Pattern rule for assembly source to an object file
#
$(BUILD_DIR)/%.obj: $(SRC_DIR)/%.asm $(MAKEFILE_LIST)
	$(ASSEMBLE_RULE)

#
# Same as above except for *.z80 files
#
$(BUILD_DIR)/%.obj: $(SRC_DIR)/%.z80 $(MAKEFILE_LIST)
	$(ASSEMBLE_RULE)

#
# Pattern rule for png images to planar tile format
# (Note: I removed the '-f' option from the build script)
#
$(BUILD_DIR)/%.png.2bpp: $(SRC_DIR)/%.png $(MAKEFILE_LIST)
	@echo "GFX      $@"
	@$(RGBGFX) -o $@ $<

$(ROM_GB): $(OBJ_FILES) $(MAKEFILE_LIST)
	@echo "LINK     $@"
	@$(RGBLINK) $(LINK_FLAGS) -o $@ $(OBJ_FILES)
	@echo "FIX      $@"
	@$(RGBFIX) $(FIX_FLAGS) $@

$(OBJ_FILES): | $(OBJ_DIRS)

$(OBJ_DIRS):
	@echo "MKDIR    $@"
	@mkdir -p $@

#
# Clean will delete everything in the build directory except for:
#    - .gitkeep
#    - $(BUILD_DIR) itself
#
clean:
	find "$(BUILD_DIR)" ! -name .gitkeep ! -path $(BUILD_DIR) -delete

#
# Keep these files for debugging
#
.PRECIOUS: $(ROM_MAP) $(ROM_SYM)

# -----------------------------------------------------------------------------
# EXTRA DEPENDENCIES

#
# Tile dependencies
#
$(BUILD_DIR)/Data/Tilesets/Font/Font.tileset.obj: $(BUILD_DIR)/Data/Tilesets/Font/Font.tileset.png.2bpp

#
# assembler-generated dependency files
# NOT USED
#
#-include $(OBJ_DEPS)