# -----------------------------------------------------------------------------
# Name:        bin2bcd_gpr_uint8
# ABI:         void bin2bcd_gpr_uint8(char *buf, uint8_t val)
# Input:       RDI = Pointer to destination buffer (3 bytes)
#              RSI = 8-bit value (0-255)
# -----------------------------------------------------------------------------

.section .text
.global bin2bcd_gpr_uint8

bin2bcd_gpr_uint8:
    movzbq  %sil, %rax          # Load input value
    
    # 1. Extraction Phase
    # Get Hundreds, Tens, and Units into separate registers
    mov     $100, %rcx
    xor     %rdx, %rdx
    div     %cl                 # AL = Hundreds, AH = Remainder (0-99)
    
    movzbq  %ah, %r8            # R8 = Remainder (0-99)
    mov     $0xCCCD, %rcx       # Reciprocal for /10
    mov     %r8, %rax
    mul     %rcx
    shr     $3, %edx            # EDX = Tens digit
    
    # Units = Total - (Tens * 10)
    lea     (%rdx, %rdx, 4), %rcx
    add     %rcx, %rcx
    sub     %ecx, %r8d          # R8 = Units digit
    
    # 2. Parallel Correction Phase (The "Lanes")
    # We apply your branch-free "Add 3" logic to Tens and Units.

    # --- LANE 1: TENS (RDX) ---
    mov     %rdx, %r9           # Save original
    add     $3, %rdx            # Add 3
    and     $8, %rdx            # Check bit 3
    shr     $3, %rdx            # Normalize to 0 or 1
    leaq    (%rdx, %rdx, 2), %rdx # Multiply by 3
    add     %r9, %rdx           # Final adjusted Tens

    # --- LANE 2: UNITS (R8) ---
    mov     %r8, %r10           # Save original
    add     $3, %r8             # Add 3
    and     $8, %r8             # Check bit 3
    shr     $3, %r8             # Normalize to 0 or 1
    leaq    (%r8, %r8, 2), %r8   # Multiply by 3
    add     %r10, %r8           # Final adjusted Units

    # 3. Store results to buffer
    movb    %al, 0(%rdi)        # Store Hundreds
    movb    %dl, 1(%rdi)        # Store Tens
    movb    %r8b, 2(%rdi)       # Store Units

    ret
