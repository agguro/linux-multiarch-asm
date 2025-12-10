/*
 * name        : avx_addArrays.S
 * description : add 2 arrays with AVX instructions
 * calling     : extern "C" void avx_addArrays(float dest[], float arr1[], float arr2[]);
 * assembler   : GNU as (Intel syntax enabled)
 */

	.intel_syntax noprefix

	.text
	.globl avx_addArrays
	.type  avx_addArrays, @function

avx_addArrays:
	push    rbp
	mov     rbp, rsp

	// rdi : dest
	// rsi : arr1
	// rdx : arr2

	vmovaps xmm0, [rsi]				// load arr1
	vmovaps xmm1, [rdx]				// load arr2
	vaddps  xmm2, xmm0, xmm1		// xmm2 = xmm0 + xmm1
	vmovaps [rdi], xmm2				// store result

	leave
	ret

.section .note.GNU-stack,"",@progbits

