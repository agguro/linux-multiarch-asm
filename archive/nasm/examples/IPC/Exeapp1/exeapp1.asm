;name:         exeapp1.asm
;
;build:        nasm "-felf64" exeapp4.asm -l exeapp4.lst -o exeapp4.o
;              ld -s -melf_x86_64 -o exeapp4 exeapp4.o
;
;description:  First demonstration of four examples on how to execute a program or shell script from within an
;              assembler program. Assumed is that the 'hello' program is present, that you
;              know the path to it and the hello program must be executable. (chmod +x hello).
;              If everything behaves, the child exits after the execution of the child process (the hello application)
;              make sure that hello is executable or no messages will be displayed at all.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data

    filename:       db  "hello",0 
    .len:           equ $-filename
    ; argument pointer list to pass to the application to be executed, terminated by 0
    argvPtr:        dq  0                    ;no arguments to pass   
    envPtr:         dq  0                    ;no environment parameters to pass
    forkerror:      db  "fork error",10
    .len:           equ $-forkerror
    execveerror:    db  "execve error(not expected)",10
    .len:           equ $-execveerror
    wait4error:     db  "wait4 error",10
    .len:           equ $-wait4error

section .text

global _start
_start:

    syscall fork
    and     rax, rax
    jns     .continue
    syscall write,stderr,forkerror,forkerror.len
    jmp     .exit
.continue:
    jz     .runchild
    ; wait for child to terminate
    syscall wait4, 0, 0, 0, 0
    jns     .exit
    syscall write,stderr,wait4error,wait4error.len
    jmp     .exit

.runchild:
    syscall execve, filename, argvPtr, envPtr
    jns     .exit
    syscall write,stderr,execveerror,execveerror.len
.exit:
    syscall exit,0
