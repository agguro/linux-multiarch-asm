;name: %{CN}.asm
;
;description:
;

bits 64

%include "../%{Filename}/inc/%{CN}.inc"

global %{CN}

section .rodata
    hello:  db  "hello world.",10
    .len:   equ $-hello
    
section .text

%{CN}:

	syscall write, stdout,hello,hello.len
    ret
