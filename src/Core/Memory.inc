if      !def(CORE_MEMORY_INC)
CORE_MEMORY_INC  set  1

wipe_memory:       macro
    call WipeMemory
endm

endc
