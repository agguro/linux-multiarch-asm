/* **************************************************************************
 * Name        : print_stringz
 * Description : Prints NULL-terminated string to a specified FD.
 * Restores all registers (ABI Transparent).
 * Input       : %rdi = File Descriptor (1 for stdout, 2 for stderr, etc.)
 * %rsi = Pointer to NULL-terminated string
 * ************************************************************************** */
.globl print_stringz
.type print_stringz, @function
.extern strlen

.section .text
print_stringz:
    pushq   %rbp
    movq    %rsp, %rbp
    
    # Save all registers clobbered by strlen or syscall
    # Push order: rax, rcx, rdx, rsi, rdi, r11
    pushq   %rax
    pushq   %rcx
    pushq   %rdx
    pushq   %rsi
    pushq   %rdi
    pushq   %r11

    # 1. Prepare for strlen
    movq    %rsi, %rdi      
    call    strlen          # Result in %rax
    
    # 2. Syscall Setup (sys_write)
    movq    %rax, %rdx      # Arg 3: Length
    # Arg 2: Buffer pointer is already in %rsi (saved on stack)
    # Arg 1: Get the original FD we pushed (it's at 8(%rsp) because of r11 push)
    movq    8(%rsp), %rdi   
    movq    $1, %rax        # sys_write
    syscall

    # 3. Restore Everything
    # Pop in EXACT reverse order of pushes: r11, rdi, rsi, rdx, rcx, rax
    popq    %r11
    popq    %rdi
    popq    %rsi
    popq    %rdx
    popq    %rcx
    popq    %rax
    
    popq    %rbp
    ret

.section .note.GNU-stack,"",@progbits
