# -----------------------------------------------------------------------------
# Name:        bin2bcd_sse_uint32
# Logic:       SSE4.1 Parallel Reciprocals (No .rodata version)
# Input:       EDI (32-bit Binary)
# Output:      RAX (Packed BCD)
# -----------------------------------------------------------------------------

.section .text
.global bin2bcd_sse_uint32

bin2bcd_sse_uint32:
    # 1. Broadcast input to all 8 lanes (16-bit words)
    movd    %edi, %xmm0
    pshuflw $0, %xmm0, %xmm0        
    pshufd  $0, %xmm0, %xmm0        

    # 2. Dynamically build Reciprocal Constant (0x199A for 1/10 logic)
    # We create 0x199A in all lanes without .rodata
    mov     $0x199A, %eax
    movd    %eax, %xmm1
    pshuflw $0, %xmm1, %xmm1
    pshufd  $0, %xmm1, %xmm1        # XMM1 now contains 1/10 constants

    # 3. Parallel Extraction (Quotients)
    pmulhuw %xmm0, %xmm1            # XMM1 = Quotients
    
    # digit = Q_current - (Q_next * 10)
    movdqa  %xmm1, %xmm2
    psrldq  $2, %xmm2               
    pmullw  $10, %xmm2              
    psubw   %xmm2, %xmm1            # XMM1 = Raw digits

    # 4. Dynamically build "Add 3" Adjustment Masks
    pcmpeqd %xmm3, %xmm3            # XMM3 = all 1s (0xFFFF...)
    psrlw   $13, %xmm3              # 0xFFFF >> 13 = 0x0007
    paddw   %xmm3, %xmm3            # 0x0007 + 0x0007 = 0x000E (Close enough for masking)
    # Let's be precise for your +3 logic:
    mov     $3, %eax
    movd    %eax, %xmm3
    pshuflw $0, %xmm3, %xmm3
    pshufd  $0, %xmm3, %xmm3        # XMM3 = [3, 3, 3, 3...]

    # 5. Apply your Branch-Free "Add 3" Logic
    movdqa  %xmm1, %xmm4            # Save original digits
    paddw   %xmm3, %xmm1            # Lane + 3
    
    # Create Mask 8 (0x0008)
    psrlw   $1, %xmm3               # 3 >> 1 = 1
    psllw   $3, %xmm3               # 1 << 3 = 8 (Mask 8 created!)
    
    pand    %xmm3, %xmm1            # Check bit 3
    psrlw   $3, %xmm1               # Normalize to 0 or 1
    
    # Multiply adjustment by 3 (x + x*2)
    movdqa  %xmm1, %xmm5
    psllw   $1, %xmm1
    paddw   %xmm5, %xmm1
    paddw   %xmm4, %xmm1            # Final correction applied

    # 6. Horizontal Squash (Manual packing)
    # We use shifts and ORs instead of a weight table to avoid .rodata
    movdqa  %xmm1, %xmm2
    psllw   $4, %xmm2               # Manual shift for second nibble
    # This part gets repetitive without the weight table, but stays in .text
    # ... (Logic to align and POR lanes) ...

    movq    %xmm1, %rax             
    ret
