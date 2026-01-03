.section .text
.globl bcd2bin_avx2_m256i
.type  bcd2bin_avx2_m256i, @function
.align 32

# ------------------------------------------------------------
# MACRO: DECODE_BCD_64
# Decodeert 16 BCD nibbles (8 bytes) naar een 64-bit binair getal in %rsi
# ------------------------------------------------------------
.macro DECODE_BCD_64 offset
    movq    \offset(%rdi), %rax
    movq    %rax, %rdx
    shr     $4, %rdx
    movabsq $0x0F0F0F0F0F0F0F0F, %rbx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x00FF00FF00FF00FF, %rbx
    movq    %rax, %rdx
    shr     $8, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $100, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x0000FFFF0000FFFF, %rbx
    movq    %rax, %rdx
    shr     $16, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10000, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %rdx
    shr     $32, %rdx
    imul    $100000000, %rdx, %rdx
    addq    %rdx, %rax
    movq    %rax, %rsi
.endm

# ------------------------------------------------------------
# MACRO: MUL_ACC_10_16
# Vermenigvuldigt de 256-bit accumulator (r8-r11) met 10^16
# ------------------------------------------------------------
.macro MUL_ACC_10_16
    movabsq $10000000000000000, %rcx
    
    # r8 * 10^16
    movq    %r8, %rax
    mulq    %rcx
    movq    %rax, %r8
    movq    %rdx, %r12  # r12 houdt de carry vast

    # r9 * 10^16
    movq    %r9, %rax
    mulq    %rcx
    addq    %r12, %rax
    adcq    $0, %rdx
    movq    %rax, %r9
    movq    %rdx, %r12

    # r10 * 10^16
    movq    %r10, %rax
    mulq    %rcx
    addq    %r12, %rax
    adcq    $0, %rdx
    movq    %rax, %r10
    movq    %rdx, %r12

    # r11 * 10^16
    movq    %r11, %rax
    mulq    %rcx
    addq    %r12, %rax
    # Carry naar r12 (voor 256-bit overflow detectie, hoewel we 256-bit output hebben)
    movq    %rax, %r11
.endm

# ------------------------------------------------------------
# Entry Point
# ------------------------------------------------------------
bcd2bin_avx2_m256i:
    pushq %rbx
    pushq %rbp
    pushq %r12

    # Initialiseer Acc met de hoogste 13 digits (offset 32)
    # We gebruiken een masker om exact 13 digits (6.5 bytes) te pakken
    movq    32(%rdi), %rax
    movabsq $0x000FFFFFFFFFFFFF, %rbx 
    andq    %rbx, %rax
    
    # SWAR decodering voor de eerste 13 digits
    movq    %rax, %rdx
    shr     $4, %rdx
    movabsq $0x0F0F0F0F0F0F0F0F, %rbx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10, %rdx, %rdx
    addq    %rdx, %rax
    # ... rest van SWAR voor dit blok ...
    movabsq $0x00FF00FF00FF00FF, %rbx
    movq    %rax, %rdx
    shr     $8, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $100, %rdx, %rdx
    addq    %rdx, %rax
    movabsq $0x0000FFFF0000FFFF, %rbx
    movq    %rax, %rdx
    shr     $16, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10000, %rdx, %rdx
    addq    %rdx, %rax
    movq    %rax, %rdx
    shr     $32, %rdx
    imul    $100000000, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %r8   # r8 is de basis van onze Acc
    xorq    %r9,  %r9
    xorq    %r10, %r10
    xorq    %r11, %r11

    # Horner Ketting: Acc = Acc * 10^16 + Block
    .irp offset, 24, 16, 8, 0
        MUL_ACC_10_16
        DECODE_BCD_64 \offset
        addq    %rsi, %r8
        adcq    $0, %r9
        adcq    $0, %r10
        adcq    $0, %r11
    .endr

    # Resultaat naar ymm0
    vmovq   %r8,  %xmm0
    vpinsrq $1, %r9,  %xmm0, %xmm0
    vmovq   %r10, %xmm1
    vpinsrq $1, %r11, %xmm1, %xmm1
    vinserti128 $1, %xmm1, %ymm0, %ymm0

    popq %r12
    popq %rbp
    popq %rbx
    ret
