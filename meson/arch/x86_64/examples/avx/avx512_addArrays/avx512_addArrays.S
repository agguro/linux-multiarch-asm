/* arch/x86_64/examples/avx/avx512_addArrays/main.cpp */

/*
 * name        : avx512_addArrays.S
 * description : add 2 arrays with AVX-512 instructions
 * calling     : extern "C" void avx512_addArrays(float dest[], float arr1[], float arr2[]);
 * assembler   : GNU as with Intel syntax (.intel_syntax noprefix)
 */

/* arch/x86_64/examples/avx/avx512_addArrays/avx512_addArrays.S */

/*
 * name        : avx512_addArrays.S
 * description : Add 2 arrays with AVX-512 instructions (Simd 512-bit)
 * calling     : extern "C" void avx512_addArrays(float dest[], float arr1[], float arr2[]);
 * assembler   : GNU as (AT&T Syntax)
 */

    .text
    .globl avx512_addArrays
    .type  avx512_addArrays, @function

    /* * ALIGNMENT CRITICAL:
     * AVX-512 uses 512-bit registers (ZMM).
     * 512 bits = 64 bytes.
     * So we need 2^6 = 64 byte alignment.
     */
    .p2align 6

avx512_addArrays:
    push    %rbp
    mov     %rsp, %rbp

    /*
     * Registers (System V ABI):
     * %rdi : dest
     * %rsi : arr1
     * %rdx : arr2
     */

    /* optional: clear all AVX registers to avoid penalty state transitions */
    vzeroall

    /* * Load Data (16 floats at once!)
     * ZMM registers are 512-bit wide.
     */
    vmovaps (%rsi), %zmm0       // Load 16 floats from arr1
    vmovaps (%rdx), %zmm1       // Load 16 floats from arr2

    /* * Perform Addition
     * AT&T Syntax: vop src2, src1, dest
     */
    vaddps  %zmm1, %zmm0, %zmm2 // %zmm2 = %zmm0 + %zmm1

    /* * Store Result */
    vmovaps %zmm2, (%rdi)       // Write result to memory

    leave
    ret

/* Security Fix */
.section .note.GNU-stack,"",@progbits
