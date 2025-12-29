; name        : avx2_addArrays.asm

; description : add 2 arrays with AVX2 instructions
; C calling   : extern "C" void avx2_addArrays(float dest[], float arr1[], float arr2[]);
; build       : --- RELEASE VERSION ---
;				nasm -f elf64 -I ../../includes -o avx2_addArrays.o avx2_addArrays.asm
;				g++ -o avx2_addArrays *.o
;				--- DEBUG VERSION ---
;				nasm -f elf64 -I ../../includes -g -Fdwarf -o avx2_addArrays.debug.o avx2_addArrays.asm
;				g++ -o avx2_addArrays.debug *.o
; source      : https://www.physicsforums.com/insights/an-intro-to-avx-512-assembly-programming/
  
bits 64

global avx2_addArrays

align 32

section .text

avx2_addArrays:

	push    rbp
	mov	    rbp,rsp

	;rdi : dest array
	;rsi : pointer to array1
	;rdx : pointer to array2

	vmovaps ymm0, [rsi]         ;load the first source array
	vmovaps ymm1, [rdx]         ;load the second source array
	vaddps  ymm2, ymm0,ymm1     ;add the two arrays
	vmovaps [rdi],ymm2          ;store the array sum

	mov	    rsp,rbp
	pop	    rbp
	ret

;inform compiler that the stack isn't executable    
section .note.GNU-stack noalloc noexec nowrite progbits
