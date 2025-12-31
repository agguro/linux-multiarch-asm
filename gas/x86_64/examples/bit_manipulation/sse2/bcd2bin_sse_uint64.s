# name        : bcd2bin_uint64.s
# description : Convert 64-bit Packed BCD -> 64-bit Binary (SSE/SIMD)
# C calling   : extern "C" uint64_t bcd2bin_uint64(uint64_t bcd);

.section .text
.globl bcd2ascii_uint64
.type bcd2ascii_uint64, @function
.align 16

bcd2bin_uint64:
    # rdi = 64-bit Packed BCD (Input)
    
    # 1. Move scalar input to XMM
    vmovq   %rdi, %xmm0             

    # 2. Generate nibble mask (0x0F) on the fly
    vpcmpeqb %xmm1, %xmm1, %xmm1    # xmm1 = 0xFF...FF
    vpsrlw   $4, %xmm1, %xmm1       # xmm1 = 0x0F in every byte

    # 3. Extract LOW nibbles
    vpand    %xmm0, %xmm1, %xmm2    # xmm2 = digits 0, 2, 4, 6, 8, 10, 12, 14

    # 4. Extract HIGH nibbles 
    vpsrlw   $4, %xmm0, %xmm3
    vpand    %xmm3, %xmm1, %xmm3    # xmm3 = digits 1, 3, 5, 7, 9, 11, 13, 15

    # 5. Convert to digits by adding weights (Manual Decimal Conversion)
    # Since we are returning a 64-bit binary in RAX, we move back to GPR
    vmovq   %xmm2, %r8              # r8 = Packed Low Nibbles
    vmovq   %xmm3, %r9              # r9 = Packed High Nibbles

    # Logic: Result = Sum(Digit[i] * 10^i)
    # We process the first few digits manually for speed
    xorq    %rax, %rax
    movq    $1, %rcx                # Multiplier (10^0)
    movq    $10, %r10               # Factor to increase multiplier

.rept 8                             # Repeat logic for 8 byte-pairs
    # Low Nibble
    movq    %r8, %rdx
    andq    $0xF, %rdx              # Get one digit
    imulq   %rcx, %rdx
    addq    %rdx, %rax
    imulq   %r10, %rcx              # Next power of 10

    # High Nibble
    movq    %r9, %rdx
    andq    $0xF, %rdx              # Get one digit
    imulq   %rcx, %rdx
    addq    %rdx, %rax
    imulq   %r10, %rcx              # Next power of 10

    shrq    $8, %r8                 # Move to next pair of nibbles
    shrq    $8, %r9
.endr

    ret

.section .note.GNU-stack,"",@progbits
