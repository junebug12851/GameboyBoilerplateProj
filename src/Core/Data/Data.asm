include "./src/General/Misc.inc"

section "Data", rom0

CopyData::
; Copy bc bytes from hl to de.
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyData
	ret

FillData::
; Fills bc bytes at de with a value
	ld [de], a
	inc de
	dec bc

	ld h, a ; Backup A

	ld a, c
	or b ; Merge BC Together into A (We need to check for zero and we can't on 16-bit numbers)

	ld a, h ; Restore A

	jr nz, FillData
	ret

VerifyData::
	; Verify Bytes matchup from HL to DE for BC bytes or stops immidiately
	; Returns a=0 if didn't verify and a=1 if did verify

	push bc ; Backup BC
	ld b, [hl]
	ld a, [de]
	cp b
	pop bc ; Restore BC
	jr nz, .retFalse ; Compare and return false if invalid match

	dec bc

	ld a, c
	or b ; Can only check for zero on 8-bit numbers
	jr z, .retTrue ; Return true since we're out of bytes to compare

	inc hl
	inc de ; Move pointers up by 1
	jr VerifyData ; Next loop

.retFalse
	ld a, FALSE
	ret

.retTrue
	ld a, TRUE
	ret
