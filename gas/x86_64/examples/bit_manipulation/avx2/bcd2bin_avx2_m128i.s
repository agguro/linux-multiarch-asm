# name        : bcd2bin_m128i_avx2.s
# description : 128-bit BCD to 128-bit Binary using AVX2 (YMM) registers
# C calling   : extern "C" __m128i bcd2bin_m128i_avx2(__m128i bcd);

.section .text
.globl bcd2bin_m128i_avx2
.type bcd2bin_m128i_avx2, @function
.align 32

bcd2bin_m128i_avx2:
    # Input: xmm0 contains 128-bit packed BCD
    pushq   %rbx
    pushq   %r12
    pushq   %rbp
    movq    %rsp, %rbp

    # 1. Extract High and Low 64-bit chunks using AVX2
    # We use vmovq for the low 64 bits and vpextrq for the high 64 bits
    vmovq   %xmm0, %r12             # r12 = Low 16 digits (BCD)
    vpextrq $1, %xmm0, %rdi         # rdi = High 16 digits (BCD)

    # 2. Convert High BCD digits to Binary
    # This calls your 64-bit SSE converter
    call    bcd2bin_uint64          # rax = Binary(High)
    
    # 3. Scale High Binary by 10^16
    # 10^16 is the "gap" between the low 16 digits and high 16 digits
    movq    $10000000000000000, %rbx 
    mulq    %rbx                    # rdx:rax = HighBinary * 10^16
    
    # 4. Save the 128-bit product result
    movq    %rax, %r8               # Lower 64 bits of product
    movq    %rdx, %r9               # Upper 64 bits of product
    
    # 5. Convert Low BCD digits to Binary
    movq    %r12, %rdi              # Move saved Low BCD to argument register
    call    bcd2bin_uint64          # rax = Binary(Low)
    
    # 6. Combine everything: (High * 10^16) + Low
    # This result fits into 128 bits (rdx:rax)
    addq    %r8, %rax               # Add low 64 bits
    adcq    %r9, %rdx               # Add high 64 bits + carry bit

    # 7. Use AVX2 to pack the 128-bit result into YMM0/XMM0
    # vmovq puts rax in the bottom 64 bits of xmm0
    # vpinsrq pins rdx into the top 64 bits of xmm0
    vmovq   %rax, %xmm0
    vpinsrq $1, %rdx, %xmm0, %xmm0

    # If you wanted the result in a YMM register specifically:
    # vinserti128 $0, %xmm0, %ymm0, %ymm0 # Result is now in the low half of ymm0

    popq    %rbp
    popq    %r12
    popq    %rbx
    ret

.section .note.GNU-stack,"",@progbits
