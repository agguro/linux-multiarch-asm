/* arch/x86_64/examples/avx/avx_addArrays/avx_addArrays.S */
/*
 * name        : avx_addArrays.S
 * description : add 2 arrays with AVX instructions (8 floats at once!)
 * calling     : extern "C" void avx_addArrays(float dest[], float arr1[], float arr2[]);
 * assembler   : GNU as (AT&T Syntax)
 */

    .text
    .globl avx_addArrays
    .type  avx_addArrays, @function

avx_addArrays:
    push    %rbp
    mov     %rsp, %rbp

    /*
     * Registers (System V ABI):
     * %rdi : dest  (Adres van bestemming)
     * %rsi : arr1  (Adres van array 1)
     * %rdx : arr2  (Adres van array 2)
     */

    /* * STAP 1: Laden (Load)
     * Gebruik (%reg) voor geheugenadressering in AT&T syntax.
     * Gebruik %ymm (256-bit) om 8 floats tegelijk te pakken.
     */
    vmovaps (%rsi), %ymm0      // Load 8 floats from arr1 into ymm0
    vmovaps (%rdx), %ymm1      // Load 8 floats from arr2 into ymm1

    /* * STAP 2: Optellen (Add)
     * Syntax: vaddps source1, source2, destination
     */
    vaddps  %ymm1, %ymm0, %ymm0 // ymm0 = ymm0 + ymm1

    /* * STAP 3: Opslaan (Store)
     * Syntax: vmovaps source, destination
     */
    vmovaps %ymm0, (%rdi)      // Store ymm0 result into dest address

    leave
    ret

/* Security Fix */
.section .note.GNU-stack,"",@progbits
