section "SRAM Bank 0 Setup", sram[$A000],bank[0]
sBank0No::
    ds 1

; If the RAM has been formatted then it will have the proper signature
; "CAFE BABE F1EE DECF FEED"
sSignature::
    ds 10

; Keep track of version differences and incompatibilities
sVersion::
    ds 2

section "SRAM Bank 1 Setup", sram[$A000],bank[1]
sBank1No::
    ds 1
section "SRAM Bank 2 Setup", sram[$A000],bank[2]
sBank2No::
    ds 1
section "SRAM Bank 3 Setup", sram[$A000],bank[3]
sBank3No::
    ds 1
section "SRAM Bank 4 Setup", sram[$A000],bank[4]
sBank4No::
    ds 1
section "SRAM Bank 5 Setup", sram[$A000],bank[5]
sBank5No::
    ds 1
section "SRAM Bank 6 Setup", sram[$A000],bank[6]
sBank6No::
    ds 1
section "SRAM Bank 7 Setup", sram[$A000],bank[7]
sBank7No::
    ds 1
section "SRAM Bank 8 Setup", sram[$A000],bank[8]
sBank8No::
    ds 1
section "SRAM Bank 9 Setup", sram[$A000],bank[9]
sBank9No::
    ds 1
section "SRAM Bank 10 Setup", sram[$A000],bank[10]
sBank10No::
    ds 1
section "SRAM Bank 11 Setup", sram[$A000],bank[11]
sBank11No::
    ds 1
section "SRAM Bank 12 Setup", sram[$A000],bank[12]
sBank12No::
    ds 1
section "SRAM Bank 13 Setup", sram[$A000],bank[13]
sBank13No::
    ds 1
section "SRAM Bank 14 Setup", sram[$A000],bank[14]
sBank14No::
    ds 1
section "SRAM Bank 15 Setup", sram[$A000],bank[15]
sBank15No::
    ds 1
