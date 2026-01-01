/* -------------------------------------------------
 * name        : u64toa.s
 * input       : RDI = value, RSI = start of buffer, RDX = buffer len
 * output      : RAX = 0 (success) or 1 (overflow)
 * RDI = unchanged
 * RSI = pointer to start of digits
 * RDX = actual length
 * ------------------------------------------------- */
.section .text
.globl u64toa
.type u64toa, @function

u64toa:
    pushq   %rbp            # Save caller's frame pointer
    movq    %rsp, %rbp      # Now RSP is 16-byte aligned (8 for RIP + 8 for RBP)

    # 2. Preserve Callee-Saved Registers
    # Only push these if your function actually changes them

    leaq    (%rsi, %rdx), %rcx
    movq    %rcx, %r9               
    movq    %rdi, %rax              # Original RDI is now safe
    movabsq $0xCCCCCCCCCCCCCCCD, %r8 

.l2:
    decq    %rcx
    cmpq    %rsi, %rcx              # RSI is the start of buffer
    jl      .err
    
    movq    %rax, %r11              # Use R11 as temporary
    mulq    %r8
    shrq    $3, %rdx                # RDX = quotient
    
    leaq    (%rdx, %rdx, 4), %r10
    shlq    $1, %r10
    subq    %r10, %r11              # R11 = digit
    
    addb    $'0', %r11b
    movb    %r11b, (%rcx)
    
    movq    %rdx, %rax
    testq   %rax, %rax
    jnz     .l2

    movq    %r9, %rdx
    subq    %rcx, %rdx              # RDX = actual length
    movq    %rcx, %rsi              # RSI = start of digits
    xorq    %rax, %rax              # Success
    popq    %rbp
    ret

.err:
    movq    $1, %rax

    # 4. Epilogue
    popq    %rbp            # Restore caller's RBP
    ret
    
.section .note.GNU-stack,"",@progbits
