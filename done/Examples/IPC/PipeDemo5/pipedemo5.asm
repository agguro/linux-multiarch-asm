;name:        pipedemo5.asm
;
;build:       nasm -felf64 pipedemo5.asm -l pipedemo5.lst -o pipedemo5.o
;             ld -s -melf_x86_64 -o pipedemo5 pipedemo5.o
;
;description: A demonstration on pipes and fork based on an example from Beej's Guide to IPC
;             This is the same example as pipedemo4.asm but with that difference that the
;             programs forks, the child process writes into the pipe and the parent process reads
;             from the pipe.
;
;source:      Beejs guide to IPC - http://beej.us/guide/bgipc/output/html/multipage/pipes.html
 
bits 64
 
[list -]
    %include "unistd.inc"
[list +]
       
section .bss

    ; pdfs
    pdfs:
    .read:          resd    1
    .write:         resd    1
    buffer:         resb    1022

section .rodata

    childwrite:     db  "Child - writing to pipe",10
    .len:           equ $-childwrite
    childexit:      db  "Child - exiting",10
    .len:           equ $-childexit
    
    parentreading:  db  "Parent - reading from pipe...",10
    .len:           equ $-parentreading
    parentreads:    db  "Parent - reads: "
    .len:           equ $-parentreads
    parentwaiting:  db  10,"waiting for child",10
    .len:           equ $-parentwaiting
    exit:           db  "done.",10
    .len:           equ $-exit
    pipeerror:      db  "pipe error"
    .len:           equ $-pipeerror
    forkerror:      db  "fork error"
    .len:           equ $-forkerror
    waiterror:      db  "wait error"
    .len:           equ $-waiterror
    
section .data

    data:           db  "this is the test sentence"
    .len:           equ $-data
    
section .text

global _start
_start:
    
    ; create pipe, pdfs is an array to the READ and WRITE ends of the pipe
    syscall pipe, pdfs
    and     rax, rax
    jns     .fork
    syscall write,stderr,pipeerror,pipeerror.len
    syscall exit,1
.fork:    
    ; fork the process
    syscall fork
    and     rax, rax
    jns     .continue
    syscall write,stderr,forkerror,forkerror.len
    syscall exit,1
.continue:    
    jz      .child

    ;write to stdout
    syscall write,stdout,parentreading,parentreading.len
    mov     edi,dword[pdfs.read]
    syscall read,rdi,buffer,1024
    mov     r15,rax                 ;save nbytesread
    syscall write,stdout,parentreads,parentreads.len
    ; write buffer with data to stdout
    syscall write,stdout,buffer,r15
    ;syscall write,stdout,buffer,rax
    syscall write,stdout,parentwaiting,parentwaiting.len
    ; wait for child to terminate
    syscall wait4,0,0,0,0
    jns     .exit
    syscall write,stderr,waiterror,waiterror.len
.exit:

    syscall write,stdout,exit,exit.len
    syscall exit

.child:
    ;write to stdout
    syscall write,stdout,childwrite,childwrite.len
    ; write to the pipe
    mov     edi,dword[pdfs.write]
    syscall write,rdi,data,data.len
    ; write message msg2
    syscall write,stdout,childexit,childexit.len
    syscall exit,0
