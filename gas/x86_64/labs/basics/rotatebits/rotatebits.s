/* **************************************************************************
 * Name        : rotatebits.s
 * Description : Main entry point testing the library functions.
 * ************************************************************************** */

.nolist
    .include "unistd.inc"
.list

.section .rodata
    msg_orig:   .asciz "Original: "
    msg_rot_l:  .asciz "\nRotate 3 Left:  "
    msg_rot_r:  .asciz "\nRotate 2 Right: "
    msg_nl:     .asciz "\n"

.section .bss
    .align 16
    reg64: .skip 65

.section .text
.globl _start

# External Library Functions
.extern print_stringz
.extern u64tobin
.extern rotate_sig

_start:
# --- 1. ORIGINAL ---
    movq    $0b1011001, %r12
    movq    $stdout, %rdi
    leaq    msg_orig(%rip), %rsi
    call    print_stringz

    movq    %r12, %rdi
    leaq    reg64(%rip), %rsi
    movq    $-1, %rdx           # Set mode to Auto-Detect
    call    u64tobin            # Now rax = pointer, rdx = detected width
    movq    %rdx, %r13          # Save that width (7) for later

    movq    $stdout, %rdi
    movq    %rax, %rsi
    call    print_stringz

    # --- 2. ROTATE 3 LEFT ---
    movq    $stdout, %rdi
    leaq    msg_rot_l(%rip), %rsi
    call    print_stringz

    movq    %r12, %rdi
    movq    $3, %rsi
    call    rotate_sig          # Result in rax

    movq    %rax, %rdi          # Prep for u64tobin
    leaq    reg64(%rip), %rsi
    movq    %r13, %rdx          # <--- FIXED: Set width BEFORE the call
    call    u64tobin            
    
    movq    $stdout, %rdi
    movq    %rax, %rsi
    call    print_stringz

    # --- 3. ROTATE 2 RIGHT ---
    movq    $stdout, %rdi
    leaq    msg_rot_r(%rip), %rsi
    call    print_stringz

    movq    %r12, %rdi
    movq    $-2, %rsi
    call    rotate_sig          # Result in rax

    movq    %rax, %rdi          # Prep for u64tobin
    leaq    reg64(%rip), %rsi
    movq    %r13, %rdx          # Set width
    call    u64tobin

    movq    $stdout, %rdi
    movq    %rax, %rsi
    call    print_stringz

    # Final Newline
    movq    $stdout, %rdi
    leaq    msg_nl(%rip), %rsi
    call    print_stringz

    # Exit
    movq    $exit, %rax
    xorq    %rdi, %rdi
    syscall

.section .note.GNU-stack,"",@progbits
