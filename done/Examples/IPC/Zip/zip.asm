;name:        zip.asm
;
;by:          agguro (2023)
;
;build:       nasm -felf64 zip.asm -l zip.lst -o zip.o
;             ld -s -melf_x86_64 -o zip zip.o
;
;description: example how to use the zip utility in nasm on Linux.
;
;todo:        check for errors.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data
        
    command:        db  "/usr/bin/zip",0        ;full path!
    argv0:          db  "-r", 0                 ;recursively
    argv1:          db  "example.zip", 0
    argv2:          db  "example/", 0           ;argument to pass

    argvPtr:        dq  command                 ;argument list
                    dq  argv0
                    dq  argv1
                    dq  argv2
                    dq  0
    envPtr:         dq  0                       ;environment parameter list

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
    and     rax,rax
    jns     .continue
    syscall write,stderr,forkerror,forkerror.len
    jmp     .exit
.continue:
    jz      .runchild
    ; wait for child to terminate
    syscall wait4,0,0,0,0
    jns     .exit
    syscall write,stderr,wait4error,wait4error.len
    jmp     .exit

.runchild:
    syscall execve,command,argvPtr,envPtr
    jns     .exit
    syscall write,stderr,execveerror,execveerror.len
.exit:    
    syscall exit,0
