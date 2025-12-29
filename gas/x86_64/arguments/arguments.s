/* name        : arguments.s
 * description : Direct syscalls + Bit-Magic strlen + Assembly-time lengths
  as --64 -g -I ../include arguments.s -o arguments.o
  as --64 -g -I ../include ../lib/strlen.s -o strlen.o
  ld -m elf_x86_64 -o arguments.debug arguments.o strlen.o
 */

.extern strlen

.include "unistd.inc"

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
_start:
        popq    %r12            # %r12 = argc
        
        # --- 1. Print argc label (Zero runtime scan) ---
        leaq    msg_argc(%rip), %rsi
        movq    $msg_argc_len, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        # --- Print argc value (Calculated) ---
        movq    %r12, %rax
        decq    %rax            
        call    convert         # returns ptr in %rax

        movq    %rax, %rsi       
        call    strlen          # Bit-magic scan
        movq    %rax, %rdx      # Length into RDX for write syscall
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall

        # --- Newline (Immediate) ---
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

        popq    %rsi            # argv[0]
        call    strlen
        movq    %rax, %rdx      # Length into RDX for write syscall        
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
        popq    %rsi            
.arg_loop:
        testq   %rsi, %rsi      
        jz      .exit
        
        call    strlen
        movq    %rax, %rdx      # Length into RDX for write syscall        
        movq    $stdout, %rdi
        movq    $write, %rax
        syscall
        
        popq    %rsi            
        testq   %rsi, %rsi
        jz      .exit
        
        pushq   %rsi            
        leaq    char_sp(%rip), %rsi
        movq    $1, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax        
        syscall
        popq    %rsi            
        jmp     .arg_loop

.exit:
        leaq    char_nl(%rip), %rsi
        movq    $1, %rdx
        movq    $stdout, %rdi
        movq    $write, %rax        
        syscall
        
        xorq    %rdi, %rdi      
        movq    $exit, %rax
        syscall


/* -------------------------------------------------
 * convert: Standard division loop
 * ------------------------------------------------- */
convert:
        leaq    buffer+30(%rip), %rsi
        movb    $0, (%rsi)
        movq    $10, %rcx
.c_loop:
        decq    %rsi
        xorq    %rdx, %rdx
        divq    %rcx
        addb    $'0', %dl
        movb    %dl, (%rsi)
        testq   %rax, %rax
        jnz     .c_loop
        movq    %rsi, %rax
        ret
        
.section .note.GNU-stack,"",@progbits
