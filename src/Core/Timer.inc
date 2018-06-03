if      !def(CORE_TIMER_INC)
CORE_TIMER_INC  set  1

; Turn timer on or off
;\1 = "on" or "off"
timer:      macro
    if \1 == "on"

        ld a, [rTAC]
        or TACF_START
        ld [rTAC], a ; Load timer settings and ensure power is on 

    else \1 == "off"
        ld a, TACF_START
        cpl
        ld b, a ; Invert power on bit (Creating bitmask minus power bit) and backup

        ld a, [rTAC]
        and b ; Load timer settings and keep all but the power bit (disable it)

        ld [rTAC], a ; Save to timer disabling it
    endc
endm

; Enables and sets the timer
; \1 = Speed 4, 16, 65, and 262
; \2 = Base Count to count up to 255
;      0 means start coutning from lowest possible option (longest before trigger)
;      255 means no counting and trigger everytime
set_timer:  macro

    ; Stop Timer and clear settings in one go
    ld a, TACF_STOP
    ld [rTAC], a

    ld a, 0
    ld [rDIV], a ; Reset Divider

    ld a, \2
    ld [rTIMA], a ; Set base count

    ld a, \2
    ld [rTMA], a ; Set timer count

    if \1 == 4
        ld a, TACF_START | TACF_4KHZ
    elif \1 == 16
        ld a, TACF_START | TACF_16KHZ
    elif \1 == 65
        ld a, TACF_START | TACF_65KHZ
    else \1 == 262
        ld a, TACF_START | TACF_262KHZ
    endc

    ld [rTAC], a ; Enable timer and begin counting at chosen speed and base
endm

endc
