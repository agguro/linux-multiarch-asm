;Project:      helloworld
;Name:         print.asm
;Description:  external routine to print a string at rdi and length rsi to stdout
[list -]
     %include "unistd.inc"
[list +]

bits 64

global print

print:
    syscall write,stdout,rdi,rsi
    ret