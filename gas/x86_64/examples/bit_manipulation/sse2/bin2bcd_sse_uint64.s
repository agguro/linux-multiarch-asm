# -----------------------------------------------------------------------------
# Name:        bin2bcd_sse_uint64
# Logic:       64-bit Binary -> BCD (Parallel GPR/SSE Hybrid)
# Description: No .rodata, no loops, branch-free logic.
# C calling:   extern "C" void bin2bcd_uint64(uint64_t bin, void* dest);
# -----------------------------------------------------------------------------

.section .text
.globl bin2bcd_sse_uint64
.align 16

bin2bcd_sse_uint64:
    # rdi = binary value, rsi = destination buffer
    
    # 1. Scalar split into 32-bit lanes (10^9)
    movq    %rdi, %rax
    movq    $1000000000, %rcx
    xorq    %rdx, %rdx
    divq    %rcx                    # rax = Quotient, rdx = Remainder
    
    # 2. Move to XMM (Lanes: [Rem | Quot])
    vmovd   %eax, %xmm0             
    vmovd   %edx, %xmm1             
    vpunpckldq %xmm1, %xmm0, %xmm0  

    # 3. Dynamically Generate Magic Reciprocal (0xCCCCCCCD)
    # 0xCCCCCCCD = -858993459. We can build it via immediate.
    movl    $0xCCCCCCCD, %eax
    vmovd   %eax, %xmm1
    vpbroadcastd %xmm1, %xmm1       # xmm1 = [1/10 | 1/10 | 1/10 | 1/10]

    # 4. Parallel Extraction of Digits
    # (High Multiplication for Division)
    # Logic: Digit = Value % 10
    vpmuludq %xmm0, %xmm1, %xmm2    # xmm2 = Value / 10 (Quotients)
    vpsrlq   $35, %xmm2             # Fixed-point shift for 0xCCCCCCCD
    
    # Get Remainder: Digit = Original - (Quotient * 10)
    vmovdqa  %xmm2, %xmm3
    vpslld   $2, %xmm3              # x * 4
    vpaddd   %xmm2, %xmm3           # x * 5
    vpslld   $1, %xmm3              # x * 10
    vpsubd   %xmm3, %xmm0, %xmm4    # xmm4 contains 2 parallel digits

    # 5. Parallel "Add 3" Logic (Vertical Lanes)
    # We build the "3" and "8" masks on the fly
    vpcmpeqd %xmm5, %xmm5, %xmm5    # All ones
    vpsrld   $30, %xmm5             # 0x3 (Binary 11)
    
    vmovdqa  %xmm4, %xmm6           # Save original digits
    vpaddd   %xmm5, %xmm4, %xmm4    # Lane + 3
    
    # Generate mask 8 (0x8) from the 3
    vpsrld   $1, %xmm5              # 3 >> 1 = 1
    vpslld   $3, %xmm5              # 1 << 3 = 8
    
    vpand    %xmm5, %xmm4, %xmm4    # Check bit 3
    vpsrld   $3, %xmm4              # Normalize to 0 or 1
    
    # Adjust original digits: Digits + (Mask * 3)
    vmovdqa  %xmm4, %xmm5
    vpslld   $1, %xmm4              # x * 2
    vpaddd   %xmm5, %xmm4, %xmm4    # x * 3
    vpaddd   %xmm6, %xmm4, %xmm0    # Resulting BCD in xmm0

    # 6. Store
    vmovdqu %xmm0, (%rsi)
    ret

.section .note.GNU-stack,"",@progbits
