;name: helloworld.asm
;
;description:
;	A simple hello world example to demonstrate the use of Qt6 for
;	assembly language projects.  This will be assembled with nasm
;	and linked with g++

bits 64

%include "../hello/hello.inc"

global main

section .bss
;uninitialized read-write data 

section .data
;initialized read-write data

section .rodata
;read-only data
	message:	db	"Hello world with qmake",0x0a
	.len:		equ	$-message

section .text

main:
    push    rbp
    mov     rbp,rsp

    syscall	write,stdout,message,message.len

    xor     rax,rax             ;return error code
    mov     rsp,rbp
    pop     rbp
    ret                         ;exit is handled by compiler
