;name:        exeapp3.asm
;
;build:       nasm -felf64 exeapp3.asm -o exeapp3.o
;             ld -s -melf_x86_64 -o exeapp3 exeapp3.o
;
;description: Demonstration on how to execute a bash script from a program and the environment parameters.
;             be sure that the script is set executable with chmod +x
;             We set an environment parameter TESTVAR to a value and read it out with the script test.sh.
;             Running the script directly doesn't display the TESTVAR value. (unless someone has defined it already)
;             It's pretty much the same as running an executable. The script must be marked as executable.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data
    filename:       db  "test.sh",0
    .len:           equ $-filename
    ;... put more arguments here
    envp1:          db  "TESTVAR=123456",0
    ;... put more environment paraters here
    argvPtr:        dq  filename
    ; more pointers to arguments here
                    dq  0                               ; terminate the list of pointers with 0
    envPtr:         dq  envp1
                    dq  0
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
    syscall wait4, 0, 0, 0, 0
    jns     .exit
    syscall write,stderr,wait4error,wait4error.len
    jmp     .exit

.runchild:
    syscall execve,filename,argvPtr,envPtr
    jns     .exit
    syscall write,stderr,execveerror,execveerror.len
.exit:    
    syscall exit,0
