.section .text
.globl bcd2bin_sse2_m128i
.type  bcd2bin_sse2_m128i, @function
.align 16

# ------------------------------------------------------------
# PROCESS_BLOCK_16
#   Acc = Acc * 10^16 + block
# ------------------------------------------------------------
.macro PROCESS_BLOCK_16 offset
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

    movabsq $10000000000000000, %rcx

    movq    %r8, %rax
    mulq    %rcx
    movq    %rax, %r8
    movq    %rdx, %rbx

    movq    %r9, %rax
    mulq    %rcx
    addq    %rbx, %rax
    adcq    $0, %rdx
    movq    %rax, %r9

    addq    %rsi, %r8
    adcq    $0, %r9
.endm

# ------------------------------------------------------------
# PROCESS_BLOCK_6
#   Acc = block (top 6 digits)
# ------------------------------------------------------------
.macro PROCESS_BLOCK_6 offset
    movq    \offset(%rdi), %rax
    movabsq $0x00000000000FFFFF, %rbx
    andq    %rbx, %rax

    movq    %rax, %rdx
    shr     $4, %rdx
    movabsq $0x0F0F0F0F0F, %rbx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x00FF00FF00FF, %rbx
    movq    %rax, %rdx
    shr     $8, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $100, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %r8
.endm

# ------------------------------------------------------------
# __m128i bcd2bin_sse2_m128i(const void* bcd)
# ------------------------------------------------------------
bcd2bin_sse2_m128i:
    pushq %rbp
    pushq %rbx

    xorq %r8, %r8
    xorq %r9, %r9

    # 38-digit Horner chain (MSB → LSB)
    PROCESS_BLOCK_6   16
    PROCESS_BLOCK_16   8
    PROCESS_BLOCK_16   0

    # pack r8:r9 → xmm0
    movq    %r8, %xmm0
    pinsrq  $1, %r9, %xmm0

    popq %rbx
    popq %rbp
    ret

