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
    # --- Prologue ---
    pushq   %rbp            # Save caller's RBP
    movq    %rsp, %rbp      # Establish new frame (RSP is now 16-byte aligned)

    # Note: We use RDI, RSI, RDX, RAX, RCX, R8, R9.
    # All these are caller-saved (scratch) registers in System V ABI.
    # No need to push RBX or R12-R15 unless we use them.

    leaq    (%rsi, %rdx), %rcx      # RCX = End of buffer
    movq    %rcx, %r9               # Save end for length math
    movq    %rdi, %rax              # Working copy of RDI

.hex_loop:
    decq    %rcx
    cmpq    %rsi, %rcx              # Overflow check
    jl      .hex_err

    # --- Get last 4 bits (one hex digit) ---
    movq    %rax, %r8
    andq    $0xF, %r8               # Mask nibble

    # --- Convert to ASCII ---
    cmpb    $10, %r8b
    jl      .is_digit
    addb    $('A' - 10), %r8b       # Convert 10-15 to 'A'-'F'
    jmp     .store
.is_digit:
    addb    $'0', %r8b              # Convert 0-9 to '0'-'9'

.store:
    movb    %r8b, (%rcx)

    # --- Shift right by 4 bits ---
    shrq    $4, %rax
    jnz     .hex_loop

    # --- Success Exit ---
    movq    %r9, %rdx
    subq    %rcx, %rdx              # RDX = actual length
    movq    %rcx, %rsi              # RSI = pointer to start
    xorq    %rax, %rax              # Status = 0

    popq    %rbp                    # Restore RBP before ret
    ret

.hex_err:
    movq    $1, %rax                # Status = 1

    # --- Epilogue for Error path ---
    popq    %rbp                    # Restore RBP before ret
    ret

.section .note.GNU-stack,"",@progbits
