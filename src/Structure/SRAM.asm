section "SRAM Bank 0 Header", sram[$A000],bank[0]

; Bank Number
sBank0No::
    ds 1

; If the RAM has been formatted then it will have the proper signature
; "CAFE BABE F1EE DECF FEED"
sSignature::
    ds 10

; Keep track of version differences and incompatibilities
sVersion::
    ds 2

section "SRAM", sram,bank[0]

; Has the clock been set
sClockSet::
    ds 1

section "SRAM Bank 1 Header", sram[$A000],bank[1]

; Bank Number
sBank1No::
    ds 1

section "SRAM Bank 2 Header", sram[$A000],bank[2]

; Bank Number
sBank2No::
    ds 1

section "SRAM Bank 3 Header", sram[$A000],bank[3]

; Bank Number
sBank3No::
    ds 1
