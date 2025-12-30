; -----------------------------------------------------------------------------
; Name:        bin2bcd_avx2_uint32
; Description: Binary to BCD using 256-bit YMM registers.
; -----------------------------------------------------------------------------

section .rodata
    align 32
    ; Reciprocals for 10^0 to 10^7 (for a 32-bit uint)
    recip_table: 
        dd 0x00000001, 0x1999999A, 0x028F5C29, 0x00418938
        dd 0x00068DB9, 0x0000A7C6, 0x000010C7, 0x000001AD

section .text
global bin2bcd_avx2_uint32

bin2bcd_avx2_uint32:
    vpbroadcastd ymm0, edi          ; Load binary input into all lanes
    
    ; 1. Parallel Division: Get [N/1, N/10, N/100, N/1000...]
    ; We use the reciprocal constants to get quotients in one go
    vpmulhuw    ymm1, ymm0, [rel recip_table]
    
    ; 2. Parallel Modulo: digit = (N/10^i) % 10
    ; digit = quotient - ((quotient / 10) * 10)
    vpsrld      ymm2, ymm1, 4       ; Rough shift for /10 logic
    vpmulld     ymm2, ymm2, 10      ; (Simplified for brevity)
    vpsubd      ymm1, ymm1, ymm2    ; YMM1 now has digits 0-9 in lanes
    
    ; 3. The "Squash" (AVX2 Packing)
    ; We need to move bits 0-3 of each 32-bit lane into a 64-bit result.
    ; We use VPERMD to shuffle lanes and VPSLLD/VPOR to merge.
    vpslld      ymm1, ymm1, [rel shift_counts] ; Shift each lane to its BCD position
    vextracti128 xmm0, ymm1, 1      ; Get high 128 bits
    vpor        xmm0, xmm0, xmm1    ; Merge halves
    
    ; Final horizontal reduction to RAX
    ; ... (A few more shifts/ORs to align the 10 nibbles)
    ret
