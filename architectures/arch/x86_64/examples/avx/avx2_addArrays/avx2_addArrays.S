/* arch/x86_64/examples/avx/avx2_addArrays/avx2_addArrays.S */

/*
 * name        : avx2_addArrays.S
 * description : Add 2 arrays with AVX2 instructions (Simd 256-bit)
 * calling     : extern "C" void avx2_addArrays(float dest[], float arr1[], float arr2[]);
 * assembler   : GNU as (AT&T Syntax)
 */

    .text
    .globl avx2_addArrays
    .type  avx2_addArrays, @function
    
    /* Align to 32 bytes boundary for optimal AVX performance */
    .p2align 5

avx2_addArrays:
    push    %rbp
    mov     %rsp, %rbp

    /*
     * Registers (System V ABI):
     * %rdi : dest  (Address of destination array)
     * %rsi : arr1  (Address of source array 1)
     * %rdx : arr2  (Address of source array 2)
     */

    /* * Load Data
     * Note: In AT&T syntax, use parentheses () for memory, not brackets [].
     */
    vmovaps (%rsi), %ymm0       // Load 8 floats (256 bits) from arr1
    vmovaps (%rdx), %ymm1       // Load 8 floats (256 bits) from arr2

    /* * Perform Addition
     * AT&T Syntax for 3-operand AVX instructions:
     * vop   src2,   src1,   dest
     */
    vaddps  %ymm1, %ymm0, %ymm2 // %ymm2 = %ymm0 + %ymm1

    /* * Store Result
     * Syntax: vmovaps source, destination
     */
    vmovaps %ymm2, (%rdi)       // Write result to memory at dest

    leave
    ret

/* Security Fix: Mark stack as non-executable */
.section .note.GNU-stack,"",@progbits
