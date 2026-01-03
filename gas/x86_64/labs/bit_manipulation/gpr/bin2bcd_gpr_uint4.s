# -----------------------------------------------------------------------------
# Name:        bin2bcd_gpr_uint4
# Description: Branch-free nibble adjustment (The "Dabble" step).
# Logic:       If (nibble >= 5) return (nibble + 3); else return nibble;
# ABI:         uint8_t bin2bcd_gpr_uint4(uint8_t nibble)
# Input:       RDI = 4-bit nibble (0-15)
# Output:      RAX = Adjusted nibble
# -----------------------------------------------------------------------------

.section .text
.global bin2bcd_gpr_uint4

bin2bcd_gpr_uint4:
    movq    %rdi, %rax          # Value in RAX
    rorb    $1, %al             # Rotate to isolate bits 3,2,1
    
    # --- Branch-free "Magic 3" Logic ---
    movb    %al, %cl            # Copy digit to CL
    addb    $3, %cl             # Add 3
    andb    $8, %cl             # Keep 4th bit (indicates original was >= 5)
    shrb    $3, %cl             # CL is now 0 or 1
    
    # Apply the +3 adjustment (1 + 2 = 3)
    addb    %cl, %al            # Add 1 if bit was set
    shlb    $1, %cl             # Shift to make it 2
    addb    %cl, %al            # Add 2 if bit was set
    
    # --- Restore and Return ---
    rolb    $1, %al             # Restore original bit order
    movzbq  %al, %rax           # Zero-extend for ABI compliance
    ret
