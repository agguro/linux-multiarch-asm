
    .text
    .globl avx_addArrays
    .type  avx_addArrays, @function

avx_addArrays:

    # rdi : dest
    # rsi : arr1
    # rdx : arr2

    vmovaps (%rsi), %xmm0
    vmovaps (%rdx), %xmm1
    vaddps %xmm0, %xmm1, %xmm2
    vmovaps %xmm2, (%rdi)

    ret

.section .note.GNU-stack,"",@progbits

