.nolist
    .include "unistd.inc"
.list

.section .bss
        .align 8
buffer: .skip 32

.section .rodata
msg_argc: .asciz  "argc        : "
.equ msg_argc_len, . - msg_argc - 1
msg_prog: .asciz  "Programname : "
.equ msg_prog_len, . - msg_prog - 1
msg_argv: .asciz  "argv[]      : "
.equ msg_argv_len, . - msg_argv - 1
char_nl:  .ascii  "\n"
char_sp:  .ascii  " "

.section .text
.globl  _start
.extern strlen
.extern u64toa

_start:
        popq    %r12            # %r12 = argc

        # --- 1. Print argc label ---
        leaq    msg_argc(%rip), %rsi
        movq    $msg_argc_len, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        # --- Print argc value using u64toa ---
        movq    %r12, %rdi      # Input value (argc)
        leaq    buffer(%rip), %rsi
        movq    $32, %rdx       # Buffer size
        call    u64toa          # Returns RSI=ptr, RDX=len

        # u64toa already set RSI and RDX for us!
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        # --- Newline ---
        leaq    char_nl(%rip), %rsi
        movq    $1, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        # --- 2. Print Program Name ---
        leaq    msg_prog(%rip), %rsi
        movq    $msg_prog_len, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        popq    %rdi            # argv[0] pointer
        pushq   %rdi            # save for write
        call    strlen
        movq    %rax, %rdx
        popq    %rsi            # restore pointer to RSI
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        leaq    char_nl(%rip), %rsi
        movq    $1, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        # --- 3. Print argv[] label ---
        leaq    msg_argv(%rip), %rsi
        movq    $msg_argv_len, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        # --- 4. Loop Arguments ---
1: 
        popq    %rdi            # get argv[i]
        testq   %rdi, %rdi
        jz      2f              # Jump FORWARD to local label 2:

        pushq   %rdi
        call    strlen
        movq    %rax, %rdx
        popq    %rsi

        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        leaq    char_sp(%rip), %rsi
        movq    $1, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        jmp     1b              # Jump BACKWARD to local label 1:

2: # EXIT
        leaq    char_nl(%rip), %rsi
        movq    $1, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        xorq    %rdi, %rdi
        movq    $exit, %rax     # Refers to constant 60 from unistd.inc
        syscall

.section .note.GNU-stack,"",@progbits
