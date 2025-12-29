;name:        pipedemo1.asm
;
;build:       nasm -felf64 -o pipedemo1.o pipedemo1.asm
;             ld -melf_x86_64 -o pipedemo1 pipedemo1.o
;
;description: The program creates a pipe, writes three message in it,
;             read on the other end of the pipe and displayed on stdout.


bits 64
 
[list -]
    %include "unistd.inc"
    %define  MSGSIZE  9
    %define  EOL 10
[list +]

section .bss

    ;pipe structure
    p:
        .read:      resd    1            ;read end of the pipe
        .write:     resd    1            ;write end of the pipe
    inbuf:      resb    MSGSIZE

section .data

    msg1:       db      "hello #1" ,0x0A
    msg2:       db      "hello #2" ,0x0A
    msg3:       db      "hello #3" ,0x0A
    eol:        db      0x0A
    pipeerror:  db      "pipe error"
    .length:    equ     $-pipeerror

section .text
    global _start

_start:
    syscall pipe, p
    and     rax, rax
    jns     startpipe                        ;if RAX < 0 then error
    syscall write, stdout, pipeerror, pipeerror.length
    jmp     exit
    
startpipe:      
    ; write msg1 to the pipe
    mov     edi, dword[p.write]
    syscall write, rdi, msg1, MSGSIZE
    ; write msg2 to the pipe
    mov     edi, dword[p.write]
    syscall write, rdi, msg2, MSGSIZE
    ; write msg3 to the pipe
    mov     edi, dword[p.write]
    syscall write, rdi, msg3, MSGSIZE
    xor     r8, r8                           ;init loopcounter
.repeat:      
    ; read MSGSIZE bytes from the pipe into the buffer
    mov     edi, dword[p.read]
    syscall read, rdi, inbuf, MSGSIZE
    syscall write, stdout, inbuf, MSGSIZE
    syscall write, stdout, EOL, 1
    inc     r8
    cmp     r8, 3
    jl      .repeat                          ;repeat 2 more times
exit:      
    syscall exit, 0
