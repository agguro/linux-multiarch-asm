;name        : avx512_addArrays.asm
;
;description : add 2 arrays with AVX512 instructions
;
;build       : nasm -felf64 -Fdwarf -o avx512_addArrays.o avx512_addArrays.asm
;
;C calling   : extern "C" void avx512_addArrays(float dest[], float arr1[], float arr2[]);
;
;source      : https://www.physicsforums.com/insights/an-intro-to-avx-512-assembly-programming/

bits 64

global avx512_addArrays

align 64

section .text

avx512_addArrays:

    push    rbp
    mov     rbp, rsp

    ; rdi : pointer to dest
    ; rsi : pointer to array1
    ; rdx : pointer to array2

    vzeroall
    vmovaps zmm0, zword [rsi]           ; Load the first source array
    vmovaps zmm1, zword [rdx]           ; Load the second source array
    vaddps  zmm2, zmm0, zmm1            ; Add the two arrays
    vmovaps zword [rdi], zmm2           ; Store the array sum

    mov     rsp, rbp
    pop     rbp
    ret
    
;inform compiler that the stack isn't executable    
section .note.GNU-stack noalloc noexec nowrite progbits
