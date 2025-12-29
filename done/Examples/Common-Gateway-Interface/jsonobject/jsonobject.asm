;Name:        jsonobject.asm
;
;Build:       nasm -felf64 downloadfile.asm -l downloadfile.lst -o downloadfile.o
;             ld -s -melf_x86_64 -o downloadfile downloadfile.o
;
;Description: reply data in the form of a JSON object.

bits 64
 
[list -]
     %include "unistd.inc"
[list +]
 
section .rodata
 
    ; this works fine enough although other sources mention
    ; 'Content-type: text/json' and
    ; 'Content-Type: application/javascript' and
    ; 'Content-type: application/json'
obj:
          db   'Content-type: text/html',0x0A,0x0A
          db   '{ "name": "agguro", "website": "http://www.linuxnasm.be", "email": "admin@linuxnasm.be", "value": 7 }'
.len:     equ  $-obj
 
section .text

global _start
_start:
 
    ; send the JSON object to the client
    syscall   write,stdout,obj,obj.len
    syscall   exit,0
