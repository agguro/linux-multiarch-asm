/* **************************************************************************
 * Name: rotate_sig
 * Input: %rdi = Value to rotate
 * %rsi = Number of bits to rotate (positive = left, negative = right)
 * Output: %rax = Result
 ° Description : Rotates significant bits. Ignores leading zeros (padding).
 * ************************************************************************** */
 
.globl rotate_sig
.type rotate_sig, @function

rotate_sig:
    testq   %rdi, %rdi
    jz      .Lzero_exit

    # 1. Get Window Width (W)
    lzcntq  %rdi, %rcx          # %rcx = Leading Zeros (P)
    movq    $64, %r8
    subq    %rcx, %r8           # %r8 = Width (W)

    # 2. Normalize Shift (N % W)
    movq    %rsi, %rax
    cqo
    idivq   %r8                 # %rdx = Remainder
    testq   %rdx, %rdx
    jz      .Lreturn_orig       # If N%W == 0, do nothing

    # If shift is negative (Right), convert to equivalent Left shift
    # Example: In a 7-bit window, Right 2 is the same as Left 5
    jns     .Lprepare_mask
    addq    %r8, %rdx           # %rdx = W + (-N)

.Lprepare_mask:
    # 3. The Masked Rotation
    # Instead of shifting to the top of 64-bits, we do it in-place
    # Result = ((Value << N) | (Value >> (W - N))) & Mask
    
    # Create Mask (r9): (1 << W) - 1
    movq    $1, %r9
    movb    %r8b, %cl
    shlq    %cl, %r9
    decq    %r9                 # r9 is now the mask for W bits

    # Do the rotation math
    movq    %rdx, %rcx          # rcx = N
    movq    %rdi, %rax
    shlq    %cl, %rax           # rax = Value << N
    
    movq    %r8, %r11
    subq    %rdx, %r11          # r11 = W - N
    movq    %rdi, %r10
    movb    %r11b, %cl
    shrq    %cl, %r10           # r10 = Value >> (W - N)
    
    orq     %r10, %rax          # rax = (V<<N) | (V>>(W-N))
    andq    %r9, %rax           # Clean up any bits outside the window
    ret

.Lreturn_orig:
    movq    %rdi, %rax
    ret
.Lzero_exit:
    xorq    %rax, %rax
    ret

.section .note.GNU-stack,"",@progbits
