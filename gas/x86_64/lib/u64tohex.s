/* -------------------------------------------------
 * name        : u64tohex.s
 * input       : RDI = value, RSI = start of buffer, RDX = buffer len
 * output      : RAX = 0 (success) or 1 (overflow)
 * RDI = unchanged
 * RSI = pointer to start of hex digits
 * RDX = actual length
 * ------------------------------------------------- */
.section .text
.globl u64tohex
.type u64tohex, @function

u64tohex:
    leaq    (%rsi, %rdx), %rcx      # RCX = End of buffer
    movq    %rcx, %r9               # Save end for length math
    movq    %rdi, %rax              # Working copy of RDI
    
.hex_loop:
    decq    %rcx
    cmpq    %rsi, %rcx              # Overflow check
    jl      .hex_err
    
    # --- Get last 4 bits (one hex digit) ---
    movq    %rax, %r8
    andq    $0xF, %r8               # Mask out everything but the last nibble
    
    # --- Convert to ASCII ---
    cmpb    $10, %r8b
    jl      .is_digit
    addb    $('A' - 10), %r8b       # Convert 10-15 to 'A'-'F'
    jmp     .store
.is_digit:
    addb    $'0', %r8b              # Convert 0-9 to '0'-'9'

.store:
    movb    %r8b, (%rcx)
    
    # --- Shift right by 4 bits for next digit ---
    shrq    $4, %rax
    jnz     .hex_loop

    # --- Success Exit ---
    movq    %r9, %rdx
    subq    %rcx, %rdx              # RDX = actual length
    movq    %rcx, %rsi              # RSI = pointer to start
    xorq    %rax, %rax              # Success
    ret

.hex_err:
    movq    $1, %rax
    ret
    
.section .note.GNU-stack,"",@progbits
