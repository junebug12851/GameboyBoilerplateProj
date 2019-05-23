include "./src/Includes.inc"

section "Banks", rom0

; This game uses Memory Bank Controller 5
; 512 ROM Banks (8MB)
; 16 RAM Banks (128KB)

; Makes a call from anywhere to rom bank1+ and back
; given your calling from the non-home bank
; This makes a lot of clever hacks to get this to work
; BC = Bank #
; HL = Call address
FarcallRom::
	ld a, [_ROMX]
	ld d, a
	ld a, [_ROMX+1]
	ld e, a
	push de ; Save 9-bit current rom bank

	push hl
	mbc_select "rom", "runtime" ; Switch to new ROM Bank
	pop hl

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
    ; the de from above that we pushed which contained current
    ; rom bank. We pop it into BC instead here to switch rom banks
	pop bc
	mbc_select "rom", "runtime" ; Switch to previous ROM Bank
	ret

; Switches to new ROM Bank and jumps to an address there
; Callable from anywhere to rom bank 1+
; bc = Bank Number
; hl = Address
FarJpRom::
	push hl
	mbc_select "rom", "runtime" ; Switch to new ROM Bank
	pop hl
    jp hl

; Similar to FarCallRom but works for strictly within SRAM
; Makes a call from one sram bank to another and back
; B = Bank #
; HL = Call address
FarcallSRam::
	ld a, [_SRAM]
	ld d, a
	push de ; Save current sram bank

	push hl
	mbc_select "ram", "runtime" ; Switch to new sram Bank
	pop hl
	ld bc, .return
	push bc

	jp hl ; Jump (call in this case) to address

.return
	pop bc
	mbc_select "ram", "runtime" ; Switch to previous sram Bank
	ret

; Switches to new RAM Bank and jumps to an address there
; You can call this or jump to this depending on if your calling
; or jumping to target code
; b = Bank Number
; hl = Address
GotoSram::
	push hl
	mbc_select "ram", "runtime" ; Switch to new ROM Bank
	pop hl
    jp hl
