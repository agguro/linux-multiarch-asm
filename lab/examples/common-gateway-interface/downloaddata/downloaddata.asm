;Name:        downloaddata.asm
;
;Build:       nasm -felf64 downloadfile.asm -l downloadfile.lst -o downloadfile.o
;             ld -s -melf_x86_64 -o downloadfile downloadfile.o
;
;Description: Demonstration of a simple downloadable file.

bits 64

[list -]
    %include 'unistd.inc'
[list +]

section .rodata

    httpheader: db  'Content-type: application/octet-stream',10
                db  'Content-Disposition: attachment; filename="data.bin"',10,10
    .len:       equ $-httpheader

section .text

global _start 
_start:

    syscall write,stdout,httpheader,httpheader.len
    syscall write,stdout,_start,_start.len
    syscall exit, 0
    
.len: equ $-_start
