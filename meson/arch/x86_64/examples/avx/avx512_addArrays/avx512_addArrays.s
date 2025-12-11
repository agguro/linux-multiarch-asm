    .text
    .globl avx512_addArrays
    .type  avx512_addArrays, @function

    .p2align 6          # align 64 bytes

avx512_addArrays:

    pushq %rbp
    movq  %rsp, %rbp

    # rdi : dest
    # rsi : arr1
    # rdx : arr2

    vzeroall                        # clears all SIMD state

    vmovaps (%rsi), %zmm0           # load 16 floats (64 bytes)
    vmovaps (%rdx), %zmm1
    vaddps  %zmm0, %zmm1, %zmm2     # zmm2 = zmm0 + zmm1
    vmovaps %zmm2, (%rdi)           # store result

    leave
    ret

    .section .note.GNU-stack,"",@progbits

