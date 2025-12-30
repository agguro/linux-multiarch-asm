# name        : bcd2bin_m128i.s
# description : 128-bit BCD to 128-bit Binary using SSE/GPR hybrid
# C calling   : extern "C" __m128i bcd2bin_m128i(__m128i bcd);

.section .text
.globl bcd2bin_m128i
.type bcd2bin_m128i, @function
.align 16

bcd2bin_m128i:
    # Input: xmm0 contains 128-bit packed BCD
    pushq   %rbx
    pushq   %r12
    
    # 1. Extract High 64-bit BCD and Low 64-bit BCD
    vmovq   %xmm0, %r12             # r12 = Low 64-bit BCD
    vpextrq $1, %xmm0, %rdi         # rdi = High 64-bit BCD (Argument for next call)

    # 2. Convert High BCD to Binary
    # Note: We call our previously created sse-based bcd2bin_uint64
    call    bcd2bin_uint64          # rax = Binary(High)
    
    # 3. Multiply High Binary by 10^16
    # 10^16 = 0x2386F26FC10000 (Fits in 64 bits)
    movq    $10000000000000000, %rbx 
    mulq    %rbx                    # rdx:rax = Binary(High) * 10^16
    
    # 4. Save High result temporarily
    movq    %rax, %r8
    movq    %rdx, %r9
    
    # 5. Convert Low BCD to Binary
    movq    %r12, %rdi              # rdi = Low 64-bit BCD
    call    bcd2bin_uint64          # rax = Binary(Low)
    
    # 6. Combine: (High * 10^16) + Low
    # Low is 64-bit, so it only adds to the lower part of the 128-bit sum
    addq    %r8, %rax               # Add low part of product
    adcq    %r9, %rdx               # Add high part of product + carry

    # 7. Move 128-bit result back to xmm0 for C++ __m128i return
    vmovq   %rax, %xmm0
    vpinsrq $1, %rdx, %xmm0

    popq    %r12
    popq    %rbx
    ret

.section .note.GNU-stack,"",@progbits
