/*
 * name        : avx2_addArrays.S
 * description : add 2 arrays with AVX2 instructions
 * calling     : extern "C" void avx2_addArrays(float dest[], float arr1[], float arr2[]);
 * assembler   : GNU as (Intel syntax enabled)
 */

	.intel_syntax noprefix

	.text
	.globl avx2_addArrays
	.type  avx2_addArrays, @function
	.p2align 5

avx2_addArrays:

	push	rbp
	mov		rbp,rsp

	//rdi : dest array
	//rsi : pointer to array1
	//rdx : pointer to array2

	vmovaps	ymm0, [rsi]         //load the first source array
	vmovaps	ymm1, [rdx]         //load the second source array
	vaddps	ymm2, ymm0,ymm1     //add the two arrays
	vmovaps	[rdi],ymm2          //store the array sum

	leave
	ret

.section .note.GNU-stack,"",@progbits

