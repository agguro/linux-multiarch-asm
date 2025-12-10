/*
 * name        : avx512_addArrays.S
 * description : add 2 arrays with AVX-512 instructions
 * calling     : extern "C" void avx512_addArrays(float dest[], float arr1[], float arr2[]);
 * assembler   : GNU as with Intel syntax (.intel_syntax noprefix)
 */

	.intel_syntax noprefix

	.text
	.globl avx512_addArrays
	.type  avx512_addArrays, @function

	.p2align 6          // align 64  (2^6 = 64)

avx512_addArrays:
	push    rbp
	mov     rbp, rsp

	// rdi : dest
	// rsi : arr1
	// rdx : arr2

	vzeroall

	vmovaps zmm0, [rsi]			// load 64 bytes (16 floats)
	vmovaps zmm1, [rdx]			// load 64 bytes (16 floats)
	vaddps  zmm2, zmm0, zmm1
	vmovaps [rdi], zmm2			// store result

	leave
	ret

.section .note.GNU-stack,"",@progbits

