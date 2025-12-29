;name: cwd.asm
;
;build: nasm -felf64 cwd.asm -o cwd.o
;       ld -s -melf_x86_64 -o cwd cwd.o
;
;description: Linux alternative for pwd.
;             returns the current working directory.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data
    string:
    .noMemory:  db "Error: out of memory"
    .lf:        db 10
    .length:    equ $-.noMemory
      
section .text

global _start       
_start:

    syscall brk,0                           ;get start of heap
    and     rax, rax                        ;if result is negative then error
    js      error                           ;no more memory available
    mov     r8, rax                         ;save the current memory break
repeat:
    add     rax, 16                         ;add 16 bytes to the current memory break
    syscall brk, rax
    xor     rax, rdi                        ;rax = new memory pointer, test if different from start of heap
    jz      getcwd                          ;if zero then memory is allocated
    ; no memory could be allocated, free the memory already allocated
    syscall brk, r8
    jmp     error
getcwd:
    sub     rdi, r8
    syscall getcwd, r8, rdi
    and     rax, rax
    jns     printit                         ;if RAX < 0 then buffer not large enough
    mov     rax, rdi                        ;buffer not large enough rax = r8
    add     rax, rsi                        ;add size of already allocated memory -> new memory break
    jmp     repeat                          ;retry allocating more memory
printit:        
    syscall write,stdout,r8,rax             ;write directory to stdout
    syscall write,stdout,string.lf,1        ;write linefeed to stdout
    jmp     exit    
error:
    syscall write,stderr,string.noMemory,string.length      ;write error string
exit:
    syscall exit,0
