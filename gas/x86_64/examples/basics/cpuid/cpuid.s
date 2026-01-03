# name        : cpuid.s
# description : Checks for CPUID support and shows Vendor ID
# build       : as --64 cpuid.s -o cpuid.o
#               ld -o cpuid cpuid.o

.nolist
    .include "unistd.inc"
.list

.section .rodata
    msg_prefix: 
        .ascii "The processor Vendor ID is '"
    msg_prefix_len = . - msg_prefix

    msg_suffix: 
        .ascii "'\n"
    msg_suffix_len = . - msg_suffix

    msg_error:  
        .ascii "CPUID is not supported\n"
    msg_error_len = . - msg_error

.section .bss
    .lcomm vendor_id, 12    # Reserve 12 bytes for Vendor ID

.section .text
    .globl _start

_start:
    # --- Step 1: Check for CPUID Support ---
    # The ID bit (bit 21) in the FLAGS register indicates support for CPUID.
    pushfq
    popq    %rax
    movq    %rax, %rcx      # Save original EFLAGS
    xorq    $0x200000, %rax # Flip bit 21
    pushq   %rax
    popfq                   # Set new EFLAGS
    pushfq
    popq    %rax            # Get EFLAGS back
    xorq    %rcx, %rax      # Compare with original
    testq   $0x200000, %rax 
    jz      .no_support     # If bit didn't stay flipped, no CPUID

    # --- Step 2: Get CPUID Data ---
    movl    $0, %eax
    cpuid                   # Returns Vendor ID in EBX, EDX, ECX

    # Get address of BSS buffer (Position Independent via RIP-relative)
    leaq    vendor_id(%rip), %rdi
    
    # Store the 12-byte Vendor ID
    movl    %ebx, (%rdi)     # Bytes 0-3
    movl    %edx, 4(%rdi)    # Bytes 4-7
    movl    %ecx, 8(%rdi)    # Bytes 8-11

    # --- Step 3: Print in Sequence ---
    
    # 1. Prefix
    leaq    msg_prefix(%rip), %rsi
    movq    $msg_prefix_len, %rdx
    movq    $stdout, %rdi
    movq    $write, %rax
    syscall

    # 2. The Vendor ID
    leaq    vendor_id(%rip), %rsi
    movq    $12, %rdx
    movq    $stdout, %rdi
    movq    $write, %rax
    syscall

    # 3. Suffix
    leaq    msg_suffix(%rip), %rsi
    movq    $msg_suffix_len, %rdx
    movq    $stdout, %rdi
    movq    $write, %rax
    syscall

    # Exit success
    xorq    %rdi, %rdi              # status 0
    movq    $exit, %rax               # sys_exit
    syscall

.no_support:
    leaq    msg_error(%rip), %rsi
    movq    $msg_error_len, %rdx
    movq    $stdout, %rdi
    movq    $write, %rax
    syscall
    
    movq    $1, %rdi                # status 1
    movq    $exit, %rax
    syscall

.section .note.GNU-stack,"",@progbits
