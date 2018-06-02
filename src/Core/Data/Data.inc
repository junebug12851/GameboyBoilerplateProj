if      !def(CORE_DATA_INC)
CORE_DATA_INC  set  1

include "./src/Includes.inc"

; Copies data
; \1 = from
; \2 = to
; \3 = count
copy:       macro
    ld hl, \1
    ld de, \2
    ld bc, \3

    call CopyData
endm

; Fills data
; \1 = to
; \2 = count
; \3 = value
fill:       macro
    ld de, \1
    ld bc, \2
    ld a, \3

    call FillData
endm

; Verifies data
; \1 = from
; \2 = to
; \3 = count
verify:     macro
    ld hl, \1
    ld de, \2
    ld bc, \3

    call VerifyData
endm

endc
