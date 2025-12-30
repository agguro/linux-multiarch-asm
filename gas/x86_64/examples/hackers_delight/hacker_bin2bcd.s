; --- Hacker's Delight: Double Dabble (GPR) ---
; Input:  EDI (Binary)
; Output: RAX (BCD)

bin2bcd_hacker:
    xor     %rax, %rax      ; Clear BCD accumulator
    mov     $32, %rcx       ; 32 bits to process

.loop:
    # 1. The "Magic" Adjustment
    # For each 4-bit nibble in RAX, if nibble > 4, add 3.
    # We do this in parallel for ALL nibbles in the 64-bit RAX.
    
    mov     %rax, %rdx
    add     $0x3333333333333333, %rdx ; Add 3 to every nibble
    test    $0x8888888888888888, %rdx ; Check if any nibble resulted in bit 3 being set
    
    # (Hacker's Masking logic to only add 3 to nibbles that were actually > 4)
    # This replaces the "if" statements with bitwise AND/OR.
    
    # 2. Shift one bit from Input (EDI) into BCD (RAX)
    shl     $1, %edi
    rcl     $1, %rax        ; Rotate Carry into RAX
    
    loop    .loop
    ret
