;name: libexample.asm
;
;description: test file for shared (libshared.so) and static (libstatic.a) library
;
;build:
;   release:
;       nasm -felf64 libexample.asm  -o libexample.o
;       ld ./shared/libshared.so --dynamic-linker /lib64/ld-linux-x86-64.so.2 -melf_x86_64 -o libexample libexample.o static/libstatic.a -R .
;   debug:
;       nasm -felf64 -Fdwarf libexample.asm -l libexample.lst -o libexample.o
;       ld ./shared/libshared.so --dynamic-linker /lib64/ld-linux-x86-64.so.2 -g -melf_x86_64 -o libexample libexample.o static/libstatic.a -R .

bits 64

%include "unistd.inc"

extern getversion
extern getversionstring1
extern getversionstring2
extern printversionstring1
extern printversionstring2
extern versionstring1
extern writestring

global _start

section .bss

section .data

    version:  dq     versionstring1  
     
section .text

_start:

    call    writestring
    call    getversion
    call    getversionstring1
    call    getversionstring2
    call    printversionstring1
    call    printversionstring2
    syscall exit,0