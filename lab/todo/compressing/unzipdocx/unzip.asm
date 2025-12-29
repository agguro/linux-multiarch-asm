;name:        unzip.asm
;
;by:          agguro (2023)
;
;build:       nasm -felf64 unzip.asm -l unzip.lst -o unzip.o
;             ld -s -melf_x86_64 -o unzip unzip.o
;
;description: example how to use the unzip utility in nasm on Linux.
;
;todo:        check for errors.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data

    command1:       db  "/usr/bin/unzip",0      ;full path!
    argv10:         db  "testdoc.docx",0        ;no error if existing, make parent directories as needed         
    argv11:         db  "-d", 0
    argv12:         db  "testdoc.docx-unzip", 0
    argv1Ptr:       dq  command1                ;argument list
                    dq  argv10
                    dq  argv11
                    dq  argv12
                    dq  0                       ;end of argument list

    ;this list ends with dq 0. Since there are no environment parameters to set
    ;I use the NULL pointer of the environment parmeters.

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
    syscall execve,command1,argv1Ptr,envPtr
    jns     .exit
    syscall write,stderr,execveerror,execveerror.len
.exit:    
    syscall exit,0
