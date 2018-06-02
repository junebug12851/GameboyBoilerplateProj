include "./src/Core/Banks/Banks.inc"
include "./src/Core/MBC/MBC.inc"
include "./src/General/Hardware.inc"

section "Banks", rom0

; This game uses Memory Bank Controller 3
; 128 ROM Banks (2MB)
; 4 RAM Banks (32KB)
; RTC Clock

; Makes a call from anywhere to rom bank1+ and back
; given your calling from the non-home bank
; This makes a lot of clever hacks to get this to work
; B = Bank #
; HL = Call address
FarcallRom::
	ld a, [_ROMX]
	push af ; Save current rom bank

	ld a, b
	mbc_select "rom", "runtime" ; Switch to new ROM Bank

    ; We're going to emulate a stack call in a hack
    ; Save the .return address below onto the stack
    ; And jp, the next ret will jump there as though
    ; we made a function call
	ld bc, .return
	push bc

	jp hl ; Jump (call in this case) to address

.return

    ; This is another hack, the processor popped off the
    ; above push, so what we're popping off here is actually
    ; the af from above that we pushed which contained current
    ; rom bank in a
	pop af
	mbc_select "rom", "runtime" ; Switch to previous ROM Bank
	ret

; Switches to new ROM Bank and jumps to an address there
; Callable from anywhere to rom bank 1+
; b = Bank Number
; hl = Address
FarJpRom::
    ld a, b
	mbc_select "rom", "runtime" ; Switch to new ROM Bank
    jp hl

; Similar to FarCallRom but works for strictly within SRAM
; Makes a call from one sram bank to another and back
; B = Bank #
; HL = Call address
FarcallSRam::
	ld a, [_SRAM]
	push af ; Save current sram bank

	ld a, b
	mbc_select "ram", "runtime" ; Switch to new sram Bank
	ld bc, .return
	push bc

	jp hl ; Jump (call in this case) to address

.return
	pop af
	mbc_select "ram", "runtime" ; Switch to previous sram Bank
	ret

; Switches to new RAM Bank and jumps to an address there
; Callable from any sram bank to any sram bank
; b = Bank Number
; hl = Address
FarJpSram::
    ld a, b
	mbc_select "ram", "runtime" ; Switch to new ROM Bank
    jp hl

; Calls a bank in SRAM from outside the RAM
; Boot up and shuts down ram when done
; 
; WARNING: Since this handles boot and shutdown and since other code exists
; which does the same, be careful calling code from sram especially calling
; code outside sram from sram because theres a good chance another function
; outside sram may shutdown sram when it's called from sram therefore crashing
; the game/program
; 
; B = Bank #
; HL = Call address
CallSRam::
    mbc_power "on"
	ld a, b
	mbc_select "ram", "runtime" ; Switch to sram Bank
	ld bc, .return
	push bc

	jp hl ; Jump (call in this case) to address

.return
    mbc_power "off"
	ret

; Boots up SRAM to a bank and jumps to an address there
; Callable from any non-sram bank to any sram bank
; You will be responsible for shutting down SRAM when done
; b = Bank Number
; hl = Address
JpSram::
    mbc_power "on"
    ld a, b
	mbc_select "ram", "runtime" ; Switch to new RAM Bank
    jp hl
