# name        : avx512_addarrays.s
# description : Fixed addition of exactly 16 floats using AVX-512
# C calling   : extern "C" void avx512_addarrays(float *dest, float *src1, float *src2);
# run:        : on non supported systems: /opt/sde/sde64 -icl -- ./avx512_addarrays

.section .text
.globl avx512_addarrays
.type avx512_addarrays, @function
.align 64

avx512_addarrays:
    # rdi = dest, rsi = src1, rdx = src2
    # We assume n is 16, so we do exactly one operation.

    vmovups (%rsi), %zmm0      # Load 16 floats (64 bytes) from src1
    vmovups (%rdx), %zmm1      # Load 16 floats (64 bytes) from src2
    
    vaddps  %zmm1, %zmm0, %zmm2 # Parallel add 16 floats
    
    vmovups %zmm2, (%rdi)      # Store 16 results into dest

    vzeroupper                 # Transition state back for OS/C++
    ret

.section .note.GNU-stack,"",@progbits
