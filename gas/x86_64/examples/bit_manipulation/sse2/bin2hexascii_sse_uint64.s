# name: bin2hex_sse_uint64.s
# Input:  RDI (64-bit binary)
# Output: RDX:RAX (16 ASCII characters / 128-bit)

.section .text
.globl qword2hex_pure_sse
.align 16

qword2hex_pure_sse:
    # 1. Load and Unpack 64 bits to 128 bits
    movq      %rdi, %xmm0          # Load 64 bits into XMM0
    vpmovzxbw %xmm0, %xmm0         # Expand 8 bytes to 16 bytes (low nibbles)
    
    # 2. Generate 0x0F mask in-register (No .rodata)
    vpcmpeqd  %xmm9, %xmm9, %xmm9  # All 1s
    vpsrlw    $4, %xmm9, %xmm9     # Now 0x0F in every word lane

    # 3. Isolate Nibbles
    vpsrlw    $4, %xmm0, %xmm1     # XMM1 = High nibbles
    vpand     %xmm9, %xmm0, %xmm0  # XMM0 = Low nibbles
    
    # Interleave: [High0][Low0][High1][Low1]... 
    # This creates the correct 16-byte ASCII string
    vpunpcklbw %xmm0, %xmm1, %xmm0 

    # 4. Generate Arithmetic Constants from GPR (No .rodata)
    mov       $9, %ecx
    vpbroadcastb %ecx, %xmm8       # Threshold 9
    mov       $0x30, %ecx
    vpbroadcastb %ecx, %xmm7       # ASCII '0'
    mov       $7, %ecx
    vpbroadcastb %ecx, %xmm6       # Adjustment 7

    # 5. Branchless Math (Surprise Logic)
    vpcmpgtb  %xmm8, %xmm0, %xmm2  # Mask: 0xFF if nibble > 9
    vpaddb    %xmm7, %xmm0, %xmm0  # Add '0' to all
    vpand     %xmm6, %xmm2, %xmm2  # Keep '7' only for A-F
    vpaddb    %xmm2, %xmm0, %xmm0  # Final result (16 ASCII bytes)

    # 6. Return Result in RDX:RAX
    vmovq     %xmm0, %rax          # Low 8 characters into RAX
    vpextrq   $1, %xmm0, %rdx      # High 8 characters into RDX
    ret
