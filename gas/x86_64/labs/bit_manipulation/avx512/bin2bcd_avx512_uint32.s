; -----------------------------------------------------------------------------
; Name:        bin2bcd_avx512_uint32
; Description: Binary to BCD using AVX-512 Parallel Reciprocals.
; Input:       EDI (32-bit Binary)
; Output:      RAX (Packed BCD in 40 bits / 10 nibbles)
; -----------------------------------------------------------------------------

section .rodata
    align 64
    ; Reciprocals for 10^0, 10^1, 10^2... 10^9
    ; These are pre-calculated magic numbers (0xCCCCCCCD etc.) 
    ; scaled for 32-bit lanes.
    recip_table: dd 0x00000001, 0x1999999A, 0x028F5C29, 0x00418938, ... 

section .text
global bin2bcd_avx512_uint32

bin2bcd_avx512_uint32:
    ; 1. Broadcast the input to all 16 lanes of a ZMM register
    vpbroadcastd zmm0, edi
    
    ; 2. Multiply by our table of powers of 10 reciprocals
    ; This calculates [N/1, N/10, N/100, N/1000...] in one instruction
    vpmulhuw    zmm1, zmm0, [rel recip_table]
    
    ; 3. Use Parallel Modulo to get the digits
    ; Digit = Quotient - (Quotient_of_next_lane * 10)
    vpslldq     zmm2, zmm1, 4       ; Shift the quotients vector
    vpmullow    zmm2, zmm2, 10      ; Multiply next-lane quotients by 10
    vpsubd      zmm1, zmm1, zmm2    ; ZMM1 now contains digits [0-9] in lanes
    
    ; 4. The "Magic" Packing (AVX-512VBMI)
    ; This instruction picks the 4-bit nibbles from each lane and
    ; packs them into a single 64-bit integer.
    vpmultishiftqb zmm0, zmm1, [rel pack_mask]
    
    vmovq       rax, xmm0           ; Move the final BCD to RAX
    ret
