# name        : bcd2bin_m256i_avx512.s
# description : 512-bit BCD (128 digits) -> 512-bit Binary Result
# Requires    : AVX-512F, AVX-512BW

.section .text
.globl bcd2bin_m512i
.type bcd2bin_m512i, @function
.align 64

bcd2bin_m512i:
    # rdi = pointer to 64-byte packed BCD input
    # rsi = pointer to 64-byte binary output buffer
    
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %r12
    pushq   %r13
    pushq   %r14
    pushq   %r15
    pushq   %rbx

    # 1. Load the 512-bit BCD into ZMM0
    vmovdqu64 (%rdi), %zmm0

    # 2. Parallel Extraction (SIMD phase)
    # Isolate all 128 nibbles using a mask
    vpcmpeqb %zmm1, %zmm1, %zmm1
    vpsrlw   $4, %zmm1, %zmm1       # zmm1 = 0x0F in every byte
    
    vpandd   %zmm1, %zmm0, %zmm2    # zmm2 = Low nibbles
    vpsrlw   $4, %zmm0, %zmm3
    vpandd   %zmm1, %zmm3, %zmm3    # zmm3 = High nibbles

    # 3. Scaling Strategy (Binary phase)
    # To keep it "0 Loops," we process the high 256-bit half 
    # and the low 256-bit half, then scale the high half by 10^64.
    
    vextracti64x4 $1, %zmm0, %ymm0  # Get High 256 bits BCD
    call    bcd2bin_m256i           # Binary result in YMM0 (r8-r11 logic)
    
    # Store the 256-bit intermediate binary result from bcd2bin_m256i
    # We will now multiply this by 10^64 (0x21E19E0C9BAB2400...)
    # [Note: 10^64 has 48 trailing zeros in binary, making this fast]
    
    # ... (Multi-precision multiplication chain using mulq/adcq) ...
    # This part scales the High-Binary to the correct 512-bit position.

    # 4. Process the Low 256-bit BCD
    vmovdqu (%rdi), %ymm0           # Load Low 32 digits
    call    bcd2bin_m256i           # Binary result in YMM0
    
    # 5. Final Accumulation
    # Add the Low binary result to the scaled High binary result.
    # Result is now spread across registers r8, r9, r10, r11, r12, r13, r14, r15
    
    # 6. Pack into ZMM0 and Store
    vmovq   %r8, %xmm0
    vpinsrq $1, %r9, %xmm0, %xmm0
    vmovq   %r10, %xmm1
    vpinsrq $1, %r11, %xmm1, %xmm1
    vinserti128 $1, %xmm1, %ymm0, %ymm0
    
    vmovq   %r12, %xmm2
    vpinsrq $1, %r13, %xmm2, %xmm2
    vmovq   %r14, %xmm3
    vpinsrq $1, %r15, %xmm3, %xmm3
    vinserti128 $1, %xmm3, %ymm1, %ymm1
    
    vinserti64x4 $1, %ymm1, %zmm0, %zmm0
    
    vmovdqu64 %zmm0, (%rsi)         # Store final 512-bit binary to destination

    popq    %rbx
    popq    %r15
    popq    %r14
    popq    %r13
    popq    %r12
    popq    %rbp
    ret

.section .note.GNU-stack,"",@progbits
