# name        : bcd2ascii_uint64.s
# C calling   : extern "C" void bcd2ascii_uint64(uint64_t bcd, char *dest);

.section .text
.globl bcd2ascii_uint64
.type bcd2ascii_uint64, @function

bcd2ascii_uint64:
    # rdi = packed BCD (input value), rsi = dest pointer
    
    vmovq   %rdi, %xmm0             # Load 64-bit BCD into lower half of XMM0

    # Create nibble mask (0x0F)
    vpcmpeqb %xmm1, %xmm1, %xmm1    # xmm1 = all bits 1 (0xFF)
    vpsrlw  $4, %xmm1, %xmm1        # Shift out 4 bits = 0x0F in every byte

    # Extract Low and High nibbles
    vpand   %xmm1, %xmm0, %xmm2     # xmm2 = Low nibbles
    vpsrlw  $4, %xmm0, %xmm3        # Shift right 4 bits
    vpand   %xmm1, %xmm3, %xmm3     # xmm3 = High nibbles

    # Create ASCII bias ('0' = 0x30)
    movl    $0x30303030, %eax
    vmovd   %eax, %xmm4
    vpshufd $0, %xmm4, %xmm4        # Broadcast 0x30 to all bytes

    # Convert to ASCII by adding 0x30
    vpaddb  %xmm4, %xmm2, %xmm2
    vpaddb  %xmm4, %xmm3, %xmm3

    # Interleave: High/Low/High/Low to get the correct string order
    vpunpcklbw %xmm2, %xmm3, %xmm5  # Interleave low 8 bytes of xmm3 and xmm2

    # Store 16 bytes
    vmovdqu %xmm5, (%rsi)
    ret

section .note.GNU-stack noalloc noexec nowrite progbits

