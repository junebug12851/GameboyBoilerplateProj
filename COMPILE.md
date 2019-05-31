## Heres how to get a compiler setup and begin compiling

## Short version

In short you need `rgbds`, if you already have it just run `./scripts/build.sh`. 
If you want more elaboration or don't have rgbds installed then read below.

## Linux

	sudo apt-get install make git gcc

	sudo apt-get install byacc flex pkg-config libpng-dev
	git clone https://github.com/rednex/rgbds
	cd rgbds
	sudo make install
	cd ..

	git clone https://github.com/junebug12851/GameboyBoilerplateProj.git
	cd GameboyBoilerplateProj

To build:

	./scripts/build.sh

# Mac

Get [**Homebrew**](http://brew.sh/).

Then in **Terminal**, run:

	xcode-select --install
	brew install rgbds

	git clone https://github.com/junebug12851/GameboyBoilerplateProj.git
	cd GameboyBoilerplateProj

To build:

	./scripts/build.sh

# Windows

Download [**Cygwin**](http://cygwin.com/install.html): **setup-x86_64.exe** for 64-bit Windows, **setup-x86.exe** for 32-bit.

Run setup and leave the default settings. At "Select Packages", choose to install the following:

- `make`
- `git`
- `gcc-core`

Then download [**rgbds**](https://github.com/rednex/rgbds/releases/): the latest **win64.tar.gz** or **win32.tar.gz** release. Extract it and put all the `exe` and `dll` files individually in **C:\cygwin64\usr\local\bin**.

In the **Cygwin terminal**, enter these commands:

	git clone https://github.com/junebug12851/GameboyBoilerplateProj.git
	cd GameboyBoilerplateProj

To build:

	./scripts/build.sh

# Using the Makefile

Note: rgbds must be installed and in your PATH

The provided makefile is an alternative to the build script. Using make allows
for incremental builds as opposed to rebuilding everything. The makefile should
work with any system that has GNU Make installed (windows users will need to
install a port or use mingw).

Just run the make command in the top directory of the source tree
```sh
make
```

The default target is build/game.gb. When adding new assembly files, add its
corresponding object file to the `OBJ_FILES` variable. The Makefile will only
build these files.

The build directory can be cleaned (for a complete rebuild) using the clean
target:
```sh
make clean
```

To test the ROM with the bgb emulator, use the utility run target:
```sh
make run  # NOTE: this will rebuild the rom if any changes have been made
```

## The `user.mk` file

This file is not tracked by git and is to contain user-specific overrides for
the makefile. The Makefile includes this file (if it exists) after the
variables have been set. See the Makefile for possible variables to override.

If your RGBDS toolchain is not in your PATH, you can specify the
location of each tool manually in this file.

You can also specify a different location for the build directory (BUILD_DIR).
The directory must exist when building.
