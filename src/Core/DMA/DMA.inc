if      !def(CORE_DMA_INC)
CORE_DMA_INC  set  1

include "./src/Includes.inc"

dma_install:    macro
    call DMAInstall
endm

dma_copy:    macro
    call hDMACopyFunc
endm

endc
