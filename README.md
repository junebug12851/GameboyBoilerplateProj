## Gameboy Boilerplate Project
There are a million ways to program for the Gameboy, here I provide
a boilerplate assembly project that I like which is commented and 
documented throughout to get you off the ground. I also include a 
tileset I made which includes English upper and lower case letters, 
numbers, and several symbols including 2 or 3 ascii art characters.

There have been lots of starter stuff I've seen but many were poorly 
documented, often very incomplete and very basic to the point where it's
not even useable in a real game and would all have to be scrapped. I always 
wanted to see one that had more to it especially in terms of realism in a 
real project so I began making my own while having a lot of fun and enjoying 
game dev-ing on the Gameboy.

My goal is to really make this advanced or at least comprehensive and cover 
a good range of stuff well so you can just jump right in. Of course as a 
starter project your more than welcome to dive in and make whatever changes 
you want, it's your project after all - I just provide the boiler plate stuff.

### Contributions Welcome and Encouraged

I'm not the best developer in the world, not by a longshot lol, so I 
welcome any contributions and hope this can really be expanded by others into
a more unified and larger project with a lot of collaboration and ideas from
others especially ^_^. Regardless just fork, make changes, and send 
a pull request if your interested or have something quick to add.

### What is this for?

This is for the original gameboy or DMG Gameboy however it can always
be molded pretty easily to the later models and such.

### What cartridge does it run on?

It uses an MBC3 cartridge that has 

* 128 ROM Banks (2MB)
* 4 RAM Banks (32KB)
* RTC Clock

I chose MBC3 for a few reasons

1. It has a good amount of ROM and External RAM memory
2. It provides external RAM ~_^ which I love
3. It has a clock
4. Some issues with earlier MBC controllers like 3 unusable banks are all fixed
5. It's extremely well documented and known

There are better ones out there, some I'd love to use, but documentation
is scarce, implementation is poor and/or theres awesome features that are 
missing. MBC3 I find is the best middle ground.

### What's in it so far

* Bank switching capability including even cross bank jumping and calling
even to and/or from sram

* Simple graphics system which I plan to expand that can print individual
tiles at certain locations or a string of tiles at one location onward.
It does need expanding.

* MBC controlling capability from small stuff like controlling the individual 
aspects of MBC to large stuff like formatting and initializing the SRAM.

* Various code for a basic game loop, dma routine that installs in HRAM,
LCD code, joypad code, memory code like formatting memory, and startup code.
It also contains a lot of constants and such to make things easier.

* Initial structuring of the memory and ROM

* A sample tileset I made that I might expand on later containing 
A-Z, a-z, 0-9, several symbols, and a few ascii art symbols. I based the 
letters and numbers off some open and free references I found however I 
did draw them. The symbols and ascii art was entirely done from scratch.

### Optimizations and Some extra features

**1st Byte of bank indicates bank number**

A single byte is placed at the start of each rom and external ram bank
that indicates the bank number. While this seems simple or redundant
it skips the need to track which bank your on in memory and it's relatively
easy to always read it out fairly quickly and accurately in one line cutting 
various code and memory usage as well as simplifying things.

**External RAM Formatting**

1. Contains the first byte bank number mentioned above
2. Contains a small hex signature which it uses to verify if the external ram is 
formatted for the first time or not. If the signature is missing or invalid 
then it's cue the external ram needs formatting and does so on boot.
3. Contains a version code for compatibility, now this may seem kind of weird
for a gameboy rom as usually it's read-only memory in a cart however in the modern
world where most people load up an emulator it can be nice to "update" the game
by downloading the latest update and it not mess up the save file for example.
The save file will contain the version code of it's data and the game could
work around that in compatibility or "upgrade" the save file while preserving
the save data. Basically a modern touch option on the old classic that can
totally be ignored or removed with ease.

## How do I compile? What do I need?

All your answers are in the COMPILE.md file from what to install, how and where 
to get it, to compiling. The super short version though is use `rgbds` and run
`./scripts/build.sh` any more elaboration can all be found in the seperate file.

## Enjoy ^_^
