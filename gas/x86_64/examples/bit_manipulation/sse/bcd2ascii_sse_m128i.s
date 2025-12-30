# name        : bcd2ascii_m128i.s
# C calling   : extern "C" void bcd2ascii_m128i(void *src, char *dest);

.section .text
.globl bcd2ascii_m128i
.type bcd2ascii_m128i, @function

bcd2ascii_m128i:
    # rdi = pointer to src BCD, rsi = pointer to dest ASCII
    
    vmovdqu (%rdi), %xmm0           # Load 16 bytes of packed BCD

    # Create mask 0x0F
    vpcmpeqb %xmm1, %xmm1, %xmm1
    vpsrlw  $4, %xmm1, %xmm1

    # Extract Nibbles
    vpand   %xmm1, %xmm0, %xmm2     # Low nibbles
    vpsrlw  $4, %xmm0, %xmm3        # Shift
    vpand   %xmm1, %xmm3, %xmm3     # High nibbles

    # Create ASCII bias (0x30)
    movl    $0x30303030, %eax
    vmovd   %eax, %xmm4
    vpshufd $0, %xmm4, %xmm4

    # Convert
    vpaddb  %xmm4, %xmm2, %xmm2
    vpaddb  %xmm4, %xmm3, %xmm3

    # Interleave to get 32 bytes total
    vpunpcklbw %xmm2, %xmm3, %xmm5  # First 16 ASCII chars
    vpunpckhbw %xmm2, %xmm3, %xmm6  # Next 16 ASCII chars

    # Store 32 bytes
    vmovdqu %xmm5, (%rsi)
    vmovdqu %xmm6, 16(%rsi)
    ret

section .note.GNU-stack noalloc noexec nowrite progbits

