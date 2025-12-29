;name          : pipedemo4.asm
;
;build         : nasm -felf64 pipedemo4.asm z -o pipedemo4.o
;                ld -s -melf_x86_64 -o pipedemo4 pipedemo4.o
;
;description   : A demonstration on pipes based on an example from Beej's Guide to IPC
;                Here the program opens the write end of the pipe, writes data in it
;                and retrieve it through the read end of the pipe.  The buffer must be large
;                enough, a to small buffer leads to loss of data because not all data will be
;                read from the pipe.
;
;source        : Beejs guide to IPC - http://beej.us/guide/bgipc/output/html/multipage/pipes.html
 
bits 64
 
[list -]
    %include "unistd.inc"
[list +]

    %define DATA            "this is the test sentence"
    %define DOUBLE_QUOTE    0x22
    
section .bss

    ; pfds
    pfds:
    .read:      resd    1           ;read end
    .write:     resd    1           ;write end
    buffer:     resb    1022        ;space for the data read
    
section .rodata

    msg1:       db  "writing to file descriptor #"
    .len:       equ $-msg1
    msg2:       db  "reading from file descriptor #"
    .len:       equ $-msg2
    data:       db  DATA
    .len:       equ $-data
    msg3:       db  "read ",DOUBLE_QUOTE
    .len:       equ $-msg3
    msg4:       db  DOUBLE_QUOTE,10
    .len:       equ $-msg4
    pipeerror:  db  "pipe call error"
    .len:       equ $-pipeerror
    
section .data

    ;this program doesn't use a lot of pipes so I assume one byte for showing
    ;the filedescriptors will sufice.  On the other hand a conversion to decimal
    ;ascii is necessary. (should be done in real programs)
    pfdread:    db  0x30,10
    pfdwrite:   db  0x30,10
    output:     dq  msg1,msg1.len
                dq  pfdwrite,2
                dq  msg2,msg2.len
                dq  pfdread,2
                dq  msg3,msg3.len
                dq  buffer
    nread:      dq  0
                dq  msg4,msg4.len
section .text

global _start
_start:
    
    ; create pipe, pdfs is an array to the READ and WRITE ends of the pipe
    syscall pipe, pfds
    jns     .startpipe                                       ;rax < 0 is error
    syscall write,stderr,pipeerror,pipeerror.len
    syscall exit,1
      
.startpipe:
    ; prepare messages to be displayed with one syscall
    mov     eax,[pfds.read]
    add     byte[pfdread],al
    mov     eax,[pfds.write]
    add     byte[pfdwrite],al
    ; write data to the pipe
    mov     edi, dword[pfds.write]
    syscall write,rdi,data,data.len
    ; read data from the pipe in the buffer
    mov     edi, dword[pfds.read]
    syscall read,rdi,buffer,1022
    ;store nbytesread
    mov     [nread],rax
    ; write output 7 lines to stdout
    syscall writev,stdout,output,7
    syscall exit, 0
