;name: mysqlversion.asm
;
;description:
;	example to show the use of external libraries.
;	This example gets the mysql client version and make full
;	use of libc functions.
;	to succesfully build and run you need to install libmysqlclient-dev
;	with: sudo apt install libmysqlclient-dev

bits 64

%include "../mysqlversion/mysqlversion.inc"

global main

section .bss
;uninitialized read-write data 

section .data
;initialized read-write data

section .rodata
;read-only data
	text:   db "MySQL client Version: %s", 10, 0

section .text

main:
    push	rbp
    mov		rbp,rsp
    call	mysql_get_client_info
    mov		rsi, rax	; pointer to version info in rsi
    mov		rdi, text	; pointer to text in rdi
    xor		rax, rax	; no integers to print
    call	printf
    xor		rax,rax		;return error code 0
    mov		rsp,rbp
    pop		rbp
    ret				;exit is handled by compiler
