;Name:        cgiroot.asm
;
;Build:       nasm -felf64 cgiroot.asm -o cgiroot.o
;             ld -melf_x86_64 -o cgiroot cgiroot.o
;
;Description: returns the cgi root directory in a webpage. The program is the same as cwd.asm
;             wich returns the current working directory.  Because this program runs in the cgi
;             directory it returns the cgiroot directory.
;             Apache webserver calls this the CONTEXT_DOCUMENT_ROOT

bits 64

[list -]
     %include "unistd.inc"
[list +]
      
section .bss

    heapstart:      resq 1
           
section .rodata

    httpheader:     db  "Content-type: text/html",10,10
    .len:           equ $-httpheader
    error500:       db  "Error 500: Internal Server Error",10        ; this message will be returned to the web client
    .len:           equ $-error500
    errorNoMemory:  db  "[cgiroot error] out of memory error",10     ; this message will be written to the Apache error log
    .len:           equ $-errorNoMemory
      
section .text

global _start    
_start:
    syscall write,stdout,httpheader,httpheader.len                
    syscall brk,0
    and     rax,rax                         ;if rax < 0 then no memory available
    js      error                           ;no more memory available
    mov     qword[heapstart],rax            ;save the current memory break   
    ; reserve memory with chunks of 16 bytes, until the current working directory fits in the
    ; created buffer or until there is no more memory available (should not may occur)
repeat: 
    add     rax,16                          ;add 16 bytes to the current memory break
    syscall brk,rax                         ;try to allocate 16 bytes
    cmp     rdi,rax                         ;rax == new memory break?
    jne     error                           ;no more memory available to allocate
    sub     rdi,qword[heapstart]            ;size = end in RDI - start in [heapstart]
    mov     rsi,rdi                         ;size of allocated memory
    syscall getcwd, qword[heapstart]
    and     rax,rax
    jns     printcwd                        ;if no sign then the cwd is succesfully read
    mov     rax,rdi                         ;buffer not large enough rax = [heapstart]
    add     rax,rsi                         ;heapstart + size of already allocated memory -> new memory break
    jmp     repeat                          ;retry allocating more memory
printcwd:
    syscall write,stdout,qword[heapstart],rax
    syscall brk,qword[heapstart]       
    jmp     exit                            ;and exit the program
error:
    syscall write,stderr,errorNoMemory,errorNoMemory.len
    syscall write,stdout,error500,error500.len
exit:
    syscall exit,0
