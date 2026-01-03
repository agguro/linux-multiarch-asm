/* **************************************************************************
 * Name        : u64tobin
 * Input       : %rdi = value, %rsi = buffer, %rdx = mode (0=trim, -1=auto, >0=fixed)
 * Output      : %rax = pointer to start, %rdx = width used
 * ************************************************************************** */
.globl u64tobin
.type u64tobin, @function

u64tobin:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx
    pushq   %rcx
    pushq   %rsi            # [rbp-24] Original Buffer Start

    # 1. Handle Auto-Detect Mode
    cmpq    $-1, %rdx
    jne     .Lcheck_trim
    lzcntq  %rdi, %rcx
    movq    $64, %rdx
    subq    %rcx, %rdx      # Detected width
    jnz     .Lconvert
    movq    $1, %rdx        # If 0, width is 1
    jmp     .Lconvert

.Lcheck_trim:
    testq   %rdx, %rdx
    jnz     .Lconvert
    # If mode is 0 (trim), we'll calculate width later based on first '1'

.Lconvert:
    pushq   %rdx            # [rbp-32] Target Width
    movq    %rdi, %rax      # Value
    movq    %rsi, %rdi      # Write pointer
    movq    $64, %rcx
    xorq    %rbx, %rbx      # First '1' pointer

.Lloop:
    xorl    %r8d, %r8d
    shlq    $1, %rax
    adcb    $'0', %r8b
    movb    %r8b, (%rdi)
    
    cmpb    $'1', %r8b
    jne     .Lnext
    testq   %rbx, %rbx
    jnz     .Lnext
    movq    %rdi, %rbx      # Mark first '1'

.Lnext:
    incq    %rdi
    loop    .Lloop
    movb    $0, (%rdi)      # Null terminator

    # --- Result Calculation ---
    popq    %rdx            # Restore Target Width
    movq    -24(%rbp), %rsi # Original Buffer Start

    testq   %rdx, %rdx
    jz      .Ltrim_logic    # If 0, find first '1'

    # Fixed Width: Start = BufferStart + (64 - Width)
    movq    $64, %rax
    subq    %rdx, %rax
    addq    %rsi, %rax      # RAX is now the correct start pointer
    jmp     .Lexit

.Ltrim_logic:
    testq   %rbx, %rbx
    jnz     .Lfound_one
    leaq    63(%rsi), %rax  # Return pointer to last '0'
    movq    $1, %rdx
    jmp     .Lexit

.Lfound_one:
    movq    %rbx, %rax
    # Width = (BufferStart + 64) - FirstOne
    leaq    64(%rsi), %rdx
    subq    %rbx, %rdx      # Correct width returned in rdx

.Lexit:
    popq    %rsi            # Cleanup original rsi from stack
    popq    %rcx
    popq    %rbx
    popq    %rbp
    ret

.section .note.GNU-stack,"",@progbits

