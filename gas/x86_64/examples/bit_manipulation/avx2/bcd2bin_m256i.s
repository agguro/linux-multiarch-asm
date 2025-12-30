# name        : bcd2bin_m256i.s
# description : 256-bit BCD (64 digits) -> 256-bit Binary
# C calling   : extern "C" __m256i bcd2bin_m256i(__m256i bcd);

.section .text
.globl bcd2bin_m256i
.type bcd2bin_m256i, @function
.align 32

bcd2bin_m256i:
    # Input: ymm0 = 256-bit BCD
    pushq   %rbx
    pushq   %r12
    pushq   %r13
    subq    $32, %rsp               # Allocate stack space
    
    vmovdqa %ymm0, (%rsp)           # Store original BCD to stack

    # 1. Process High 128-bit BCD (Digits 32-63)
    vextracti128 $1, %ymm0, %xmm0   # Pull high half into xmm0
    call    bcd2bin_m128i           # Result (binary) in rdx:rax
    
    movq    %rax, %r12              # Save Bin_High_Lo
    movq    %rdx, %r13              # Save Bin_High_Hi

    # 2. Multiply High-Binary by 10^32 
    # 10^32 = 0x4EE2D6D415B85ACEF810000000000000
    # Note: Low 64 bits of 10^32 are 0, simplifying the math.
    
    movq    %r12, %rax              # High_Binary_Lo
    movq    $0xF810000000000000, %rbx # Middle 64 bits of 10^32
    mulq    %rbx
    movq    %rax, %r9               # First partial product
    movq    %rdx, %r10
    xorq    %r8, %r8                # Result[0] is 0 because 10^32_Lo is 0

    movq    %r13, %rax              # High_Binary_Hi
    mulq    %rbx                    # Multiply by middle constant
    addq    %rax, %r10
    adcq    %rdx, %r11
    
    movq    %r12, %rax              # High_Binary_Lo
    movq    $0x4EE2D6D415B85ACE, %rbx # Top 64 bits of 10^32
    mulq    %rbx
    addq    %rax, %r10
    adcq    %rdx, %r11
    
    movq    %r13, %rax              # High_Binary_Hi
    mulq    %rbx                    # Multiply by top constant
    addq    %rax, %r11
    # Carry from here goes to r11 (highest 64 bits of 256-bit result)

    # 3. Process Low 128-bit BCD (Digits 0-31)
    vmovdqa (%rsp), %xmm0           # Pull low half from stack
    call    bcd2bin_m128i           # Result in rdx:rax
    
    # 4. Merge: Add LowBinary to (HighBinary * 10^32)
    addq    %rax, %r8
    adcq    %rdx, %r9
    adcq    $0, %r10
    adcq    $0, %r11

    # 5. Pack result into YMM0
    vmovq   %r8, %xmm0
    vpinsrq $1, %r9, %xmm0, %xmm0
    vmovq   %r10, %xmm1
    vpinsrq $1, %r11, %xmm1, %xmm1
    vinserti128 $1, %xmm1, %ymm0, %ymm0

    addq    $32, %rsp
    popq    %r13
    popq    %r12
    popq    %rbx
    ret

.section .note.GNU-stack,"",@progbits
