# name        : avx2_addArrays.S
# description : add 2 arrays with AVX2 instructions
# calling     : extern "C" void avx2_addArrays(float dest[], float arr1[], float arr2[]);
# assembler   : GNU as (Intel syntax enabled)

	.text
	.globl avx2_addArrays
	.type  avx2_addArrays, @function
	.p2align 5

avx2_addArrays:

	# rdi : dest array
	# rsi : pointer to array1
	# rdx : pointer to array2

	vmovaps (%rsi), %ymm0          # load first array
	vmovaps (%rdx), %ymm1          # load second array
	vaddps %ymm0, %ymm1, %ymm2     # ymm2 = ymm0 + ymm1
	vmovaps %ymm2, (%rdi)          # store result

	ret

.section .note.GNU-stack,"",@progbits

