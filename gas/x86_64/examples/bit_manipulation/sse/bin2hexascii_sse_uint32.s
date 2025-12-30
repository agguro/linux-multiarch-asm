# name: bin2hex_sse_uint32.s
# Input:  EDI (32-bit binary)
# Output: RAX (8 ASCII characters)

.section .text
.globl dword2hex_pure_sse
.align 16

dword2hex_pure_sse:
    # 1. Load and Unpack
    movd      %edi, %xmm0          # Load 32 bits
    vpmovzxbw %xmm0, %xmm1         # Expand bytes to words
    
    # 2. Generate 0x0F mask in-register (No .rodata)
    vpcmpeqd  %xmm9, %xmm9, %xmm9  # All 1s
    vpsrlw    $4, %xmm9, %xmm9     # Now 0x0F in every word lane

    # 3. Isolate Nibbles
    vpsrlw    $4, %xmm1, %xmm2     # High nibbles
    vpand     %xmm9, %xmm1, %xmm1  # Low nibbles
    vpunpcklbw %xmm1, %xmm2, %xmm0 # Interleave: [High][Low][High][Low]...

    # 4. Generate Arithmetic Constants from GPR (No .rodata)
    mov       $9, %ecx
    vpbroadcastb %ecx, %xmm8       # Threshold 9
    mov       $0x30, %ecx
    vpbroadcastb %ecx, %xmm7       # ASCII '0'
    mov       $7, %ecx
    vpbroadcastb %ecx, %xmm6       # Adjustment 'A'-'9'-1

    # 5. Branchless Math (Your Surprise Logic)
    vpcmpgtb  %xmm8, %xmm0, %xmm2  # Mask: 0xFF if nibble > 9
    vpaddb    %xmm7, %xmm0, %xmm0  # Add '0' to everything
    vpand     %xmm6, %xmm2, %xmm2  # Keep '7' only for A-F
    vpaddb    %xmm2, %xmm0, %xmm0  # Final result

    # 6. Store Result to RAX
    vmovq     %xmm0, %rax          # Move 8 bytes (64 bits) to RAX
    ret
