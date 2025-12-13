;Name:          downloadfile.asm
;
;Build:         nasm -felf64 downloadfile.asm -l downloadfile.lst -o downloadfile.o
;               ld -s -melf_x86_64 -o downloadfile downloadfile.o
;
;Description:   cgi program to download a file (logo.png in this example).

[list -]
    %include "unistd.inc"
    %include "sys/fcntl.inc"
[list +]

bits 64
     
section .rodata

    httpheader:     db  'Content-type: application/octet-stream',10
                    db  'Content-Disposition: attachment; filename="logo.png"',10,10
    .length:        equ $-httpheader
    response:       db  'Content-type: text/html',10,10
                    db  '<span>the file was not found</span>',10
    .length:        equ $-response
    filename:       db  'downloads/logo.png',0    ; put it wherever you want, just keep track of the right location in your path
    errorfile:      db  '[downloadfile] $[CGIROOT]/logo.png not found error',10
    .length:        equ $-errorfile
    errorNoMemory:  db  '[downloadfile error] out of memory error',10     ; this message will be written to the Apache error log
    .length:        equ $-errorNoMemory
    
section .data
    
    STAT stat      ;STAT structure instance for FSTAT syscall
       
section .text

global _start  
_start:    
    ; open the file and get filedescriptor
    syscall open,filename,O_RDONLY
    and     rax,rax
    js      .error                          ;error, file doesn't exists
    mov     r15,rax                         ;save filedescriptor
    ; read the filesize
    syscall fstat,r15,stat
    ; get memory break
    syscall brk,0
    and     rax,rax
    jle     .errormemory                    ;no memory available to allocate
    mov     r14,rax                         ;save pointer to memory break
    add     rax,qword[stat.st_size]         ;add filesize to allocate memory
    ; try to allocate additional memory
    syscall brk,rax
    cmp     rax,rdi                         ;new memory break equal to calculated one?
    jne     .error                          ;not enough memory available
    ; read the file in the allocated memory
    syscall read,r15,r14,qword[stat.st_size]
    ; close the file
    syscall close,r15
    ; write the HTTP header
    syscall write,stdout,httpheader,httpheader.length
    ; write the filecontents
    syscall write,stdout,r14,qword[stat.st_size]
    ; release allocated memory
    syscall brk,r14
.exit:
    ; exit the program
    syscall exit,0
.errormemory:
    mov     rsi,errorNoMemory
    mov     rdx,errorNoMemory.length
    jmp     .tologfile
.error:
    mov     rsi,response
    mov     rdx,response.length
    syscall write,stdout                    ;to web client
    mov     rsi, errorfile
    mov     rdx, errorfile.length
.tologfile:     
    syscall write,stdout                    ;to Apache log file
    jmp     .exit
