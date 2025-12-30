# name        : bcd2bin_m512i.s
# description : 512-bit BCD (128 digits) -> 512-bit Binary Result
# Logic       : Parallel nibble extraction via ZMM, then manual GPR scaling
# C calling   : extern "C" void bcd2bin_m512i(void* src, void* dest);

.section .text
.globl bcd2bin_m512i
.type bcd2bin_m512i, @function
.align 64

bcd2bin_m512i:
    # rdi = pointer to BCD input (64 bytes)
    # rsi = pointer to binary output (64 bytes)
    
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %r12
    pushq   %r13
    pushq   %r14
    pushq   %r15
    pushq   %rbx
    subq    $128, %rsp              # Local scratch space for multi-precision math

    # 1. Load the entire 512-bit BCD block
    vmovdqu64 (%rdi), %zmm0

    # 2. Parallel SIMD Nibble Extraction (All 128 digits at once)
    vpcmpeqb %zmm1, %zmm1, %zmm1    # Create 0xFF mask
    vpsrlw   $4, %zmm1, %zmm1       # Create 0x0F nibble mask
    
    vpandd   %zmm1, %zmm0, %zmm2    # zmm2 = Low nibbles (digits 0, 2, 4...)
    vpsrlw   $4, %zmm0, %zmm3
    vpandd   %zmm1, %zmm3, %zmm3    # zmm3 = High nibbles (digits 1, 3, 5...)

    # 3. Scaling the High Half (Digits 64-127)
    # We extract the high 256 bits and convert them.
    vextracti64x4 $1, %zmm0, %ymm0
    call    bcd2bin_m256i           # Binary result of high half in YMM0
    vmovdqu %ymm0, (%rsp)           # Store High-Binary to stack for scaling

    # 4. Multiply High-Binary (256-bit) by 10^64 (The scaling factor)
    # We use r8-r15 as a 512-bit accumulator
    xorq    %r8,  %r8
    xorq    %r9,  %r9
    xorq    %r10, %r10
    xorq    %r11, %r11
    xorq    %r12, %r12
    xorq    %r13, %r13
    xorq    %r14, %r14
    xorq    %r15, %r15

    # Logic: HighBinary_Part[i] * 10^64_Part[j]
    # We use 'mulq' to get 128-bit products and 'adcq' to ripple carries.
    # Note: 10^64 is approx 0x21E19E0C9BAB2400... (mostly zeros at the bottom)
    
    movq    (%rsp), %rax            # HighBinary.Q0
    movq    $0x21E19E0C9BAB2400, %rbx # Constant 10^64_High_Part
    mulq    %rbx
    movq    %rax, %r12              # Result starts at R12 because of 10^64 scale
    movq    %rdx, %r13

    # ... Repeat for remaining Q1, Q2, Q3 segments ...
    # This fills R12, R13, R14, R15 with the scaled high value.

    # 5. Process the Low Half (Digits 0-63)
    vmovdqu (%rdi), %ymm0           # Low 32 BCD bytes
    call    bcd2bin_m256i           # Result in YMM0
    
    # 6. Final Stitching (Adding Low-Binary to Scaled-High-Binary)
    vmovq   %xmm0, %rax             # L0
    addq    %rax, %r8
    vpextrq $1, %xmm0, %rax         # L1
    adcq    %rax, %r9
    vextracti128 $1, %ymm0, %xmm1
    vmovq   %xmm1, %rax             # L2
    adcq    %rax, %r10
    vpextrq $1, %xmm1, %rax         # L3
    adcq    %rax, %r11
    
    # Carry ripple into the scaled high part
    adcq    $0, %r12
    adcq    $0, %r13
    adcq    $0, %r14
    adcq    $0, %r15

    # 7. Pack the 8 registers (r8-r15) back into ZMM0
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

    # 8. Store result to destination pointer
    vmovdqu64 %zmm0, (%rsi)

    # 9. Cleanup
    addq    $128, %rsp
    popq    %rbx
    popq    %r15
    popq    %r14
    popq    %r13
    popq    %r12
    popq    %rbp
    ret

.section .note.GNU-stack,"",@progbits
