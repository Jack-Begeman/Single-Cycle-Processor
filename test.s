; Shows the assembly code tested in SingleCycleProcTest 

.globl test
test:
    MOVZ X1, 0x1234, LSL 48
    MOVZ X2, 0x5678, LSL 32
    MOVZ X3, 0x9ABC, LSL 16
    MOVZ X9, 0xDEF0, LSL 0
    ADD X9, X9, X3
    ADD X9, X9, X2
    ADD X9, X9, X1
    STUR X9, [XZR, 0x28]
    LDUR X10, [XZR, 0x28]