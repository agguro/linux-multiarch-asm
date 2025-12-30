# name        : bcd2ascii_m256i.s
# description : Convert 32 bytes packed BCD -> 64 bytes ASCII
# C calling   : extern "C" void bcd2ascii_m256i(void *src, char *dest);
# Requires    : AVX2

.section .text
.globl bcd2ascii_m256i
.type bcd2ascii_m256i, @function
.align 32

bcd2ascii_m256i:
    # rdi = pointer to src BCD (32 bytes), rsi = pointer to dest ASCII (64 bytes)
    
    # 1. Load 32 bytes of packed BCD
    vmovdqu (%rdi), %ymm0

    # 2. Create nibble mask (0x0F)
    vpcmpeqb %ymm1, %ymm1, %ymm1    # ymm1 = all bits 1 (0xFF)
    vpsrlw   $4, %ymm1, %ymm1       # ymm1 = 0x0F in every byte

    # 3. Extract LOW nibbles
    vpand    %ymm1, %ymm0, %ymm2    # ymm2 = Low nibbles

    # 4. Extract HIGH nibbles
    vpsrlw   $4, %ymm0, %ymm3       # Shift right 4 bits
    vpand    %ymm1, %ymm3, %ymm3    # ymm3 = High nibbles

    # 5. Create ASCII bias ('0' = 0x30)
    movl     $0x30, %eax
    vpbroadcastb %eax, %ymm4        # Spread 0x30 across all 32 bytes of ymm4

    # 6. Convert digits -> ASCII
    vpaddb   %ymm4, %ymm2, %ymm2
    vpaddb   %ymm4, %ymm3, %ymm3

    # 7. Interleave HIGH / LOW digits
    # Note: In AVX2, punpck instructions work WITHIN 128-bit lanes (in-lane).
    vpunpcklbw %ymm2, %ymm3, %ymm5  # ASCII bytes for low parts of both 128-bit lanes
    vpunpckhbw %ymm2, %ymm3, %ymm6  # ASCII bytes for high parts of both 128-bit lanes

    # 8. Store 64 bytes of ASCII
    vmovdqu  %ymm5, (%rsi)          # First 32 bytes
    vmovdqu  %ymm6, 32(%rsi)        # Second 32 bytes

    vzeroupper                      # Clean up for AVX/SSE transition
    ret

.section .note.GNU-stack,"",@progbits
