# name        : avx2_addarrays.s
# description : SIMD addition of floats using AVX (processes in blocks of 8)
# C calling   : extern "C" void avx2_addArrays(float *dest, float *src1, float *src2, int n);
#
# build       : as --64 -o avx2_addarrays.o avx2_addarrays.s
# debug       : as --64 -g -o avx2_addarrays.o avx2_addarrays.s
# link        : g++ -o my_program main.cpp avx2_addarrays.o

.section .text

.globl avx2_addarrays
.type avx2_addarrays, @function
.align 32

avx2_addarrays:
    # rdi = dest, rsi = src1, rdx = src2, rcx = n (number of floats)
    
    # We process 8 floats per iteration. 
    # Shift Right by 3 bits is the same as dividing by 8.
    shrq    $3, %rcx          
    jz      done              # If count is 0, exit

loop:
    vmovups (%rsi), %ymm0     # Load 8 floats from src1
    vmovups (%rdx), %ymm1     # Load 8 floats from src2
    
    vaddps  %ymm1, %ymm0, %ymm2 # Parallel Add: ymm2 = ymm0 + ymm1
    
    vmovups %ymm2, (%rdi)     # Store 8 results to dest

    # Update pointers: 8 floats * 4 bytes = 32 bytes
    addq    $32, %rsi         
    addq    $32, %rdx         
    addq    $32, %rdi         
    
    decq    %rcx              # Decrement iteration counter
    jnz     loop              # Jump back if rcx > 0

done:
    ret

# Inform the system that the stack does not need to be executable
.section .note.GNU-stack,"",@progbits
