/* **************************************************************************
 * Name        : nlz.s
 * Description : Count leading zeros (64-bit). 
 * Uses the Branch-Free "Bit-Fill" method for performance.
 *
 * ABI         : System V AMD64 (Linux)
 * Input       : %rdi = 64-bit value to analyze
 * Output      : %rax = count of leading zeros (0-64)
 * * Hardware    : Requires SSE4.2 (POPCNT) or newer (approx. 2008+).
 * ************************************************************************** */

.section .text
.globl nlz
.type nlz, @function

nlz:
    # We treat this as a "leaf function" (no calls to other functions).
    # Therefore, we skip the %rbp prologue to maximize execution speed.
    
    movq    %rdi, %rax
    
    # 0. Fast path: If input is 0, NLZ is 64.
    testq   %rax, %rax
    jnz     .Lstart
    movq    $64, %rax
    ret

.Lstart:
    # 1. Bit-Fill Strategy:
    # We propagate the most significant '1' bit all the way to the right.
    # This turns a value like 00010000 into 00011111.
    # 

    movq    %rax, %rdx
    shrq    $1, %rdx
    orq     %rdx, %rax
    movq    %rax, %rdx
    shrq    $2, %rdx
    orq     %rdx, %rax
    movq    %rax, %rdx
    shrq    $4, %rdx
    orq     %rdx, %rax
    movq    %rax, %rdx
    shrq    $8, %rdx
    orq     %rdx, %rax
    movq    %rax, %rdx
    shrq    $16, %rdx
    orq     %rdx, %rax
    movq    %rax, %rdx
    shrq    $32, %rdx
    orq     %rdx, %rax

    # 2. Population Count:
    # Now %rax is a block of '1's. The number of '1's tells us the width
    # of the significant bits.
    # 
    
    popcntq %rax, %rax      # Count set bits. Requires SSE4.2.
    
    # 3. Final Calculation:
    # Leading Zeros = Total Bits (64) - Significant Bits (Popcount)
    movq    $64, %rdx
    subq    %rax, %rdx
    movq    %rdx, %rax
    
    ret

.section .note.GNU-stack,"",@progbits
