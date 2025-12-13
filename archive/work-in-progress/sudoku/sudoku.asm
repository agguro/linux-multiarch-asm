;name: sudoku.asm
;
;build: nasm -felf64 -Fdwarf -o sudoku.o sudoku.asm
;       ld -melf_x86_64 -g -o sudoku sudoku.o
;
;description: sudoku solver

bits 64

[list -]
%include "unistd.inc"
[list +]

%define ROW "-"
%define NROWS 13
%define NCOLS 25

%define COLUMN "|"
%define SPACE " "
%define EOL 10

section .data

row:	db	ROW
eol:	db	EOL
col:	db	COLUMN

new_line:
	db "-------------------------",10
.len: equ $-new_line



grid:
	db "-------------------------",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "-------------------------",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "-------------------------",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "| 0 0 0 | 0 0 0 | 0 0 0 |",10
	db "-------------------------",10

.len:	equ $-grid

section .text
global _start

_start:

	call	draw_grid
	syscall	exit,0




draw_grid:
	push	rcx
	mov		rcx, NROWS				;rows to display
.loop:
	dec		rcx						;minus 1
	cmp		rcx,0
	je		.draw
	cmp		rcx,3
	je		.draw
	cmp		rcx,7
	je		.draw
	cmp		rcx,11
	je		.draw
	jmp		.skip
.draw:
	push	rcx						;rcx is changed after syscall
	call	draw_newline
	pop		rcx
.skip:
	push	rcx
	syscall	write,stdout,col,1
	syscall	write,stdout,eol,1
	pop		rcx
	and		rcx,rcx
	jnz		.loop
	syscall	write,stdout,eol,1		;print end of line
	pop		rcx
	ret


draw_newline:
	push	rcx
	mov		rcx, NCOLS				;columns to display
.loop:
	dec		rcx						;minus 1
	push	rcx						;rcx is changed after syscall
	syscall	write,stdout,row,1		;print row symbol
	pop		rcx
	and		rcx,rcx
	jnz		.loop
	syscall	write,stdout,eol,1		;print end of line
	pop		rcx
	ret

