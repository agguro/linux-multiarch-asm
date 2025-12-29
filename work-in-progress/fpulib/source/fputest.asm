; name: fpuAbs
;
;
; -----------------------------------------------------------------------
; This procedure was written by Raymond Filiatreault, December 2002
; Modified March 2004 to avoid any potential data loss from the FPU
; Revised January 2005 to free the FPU st7 register if necessary.
; Revised January 2010 to allow additional data types from memory to be
;    used as source parameter and allow additional data types for storage. 
;
;                           |Src| -> Dest
;
; Rewritten for nasm December 2019 by Roberto Aguas Guerreiro.
;
; This FpuAbs function changes the sign of a REAL number (Src) to
; positive with the FPU and returns the result at the specified
; destination (the FPU itself or a memory location), unless an invalid
; operation is reported by the FPU or the definition of the parameters
; (with uID) is invalid.
;
; The source can only be a REAL number from the FPU itself or either a
; REAL4, REAL8 or REAL10 from memory. (The absolute value of integers can
; be easily obtained with CPU instructions.)
;
; The source is not checked for validity. This is the programmer's
; responsibility.
;
; Only EAX is used to return error or success. All other CPU registers
; are preserved.
;
; IF the source is specified to be the FPU top data register, it would be
; removed. It would then be replaced by the result only if the FPU is
; specified as the destination.
;
; IF the source is from memory
; AND the FPU is specified as the destination for the result,
;       the st7 data register will become the st0 data register where the
;       result will be returned (any valid data in that register would
;       have been trashed).
;
; -----------------------------------------------------------------------

bits 64

%include "fpu.inc"

global _start

section .data
fpuexception:
	.invalidoperation:	db	"Invalid operation"
	.denormalized:		db	"Denormalized exception"
	.zerodivide:		db	"Zero divide exception"
	.overflow:			db	"Overflow exception"
	.underflow:			db	"Underflow exception"
	.precision:			db	"Precision exception"
	.stackfault:		db	"stackfault"
	.exceptionflag:		db	"Exception occured",10
	.exceptionflag.len:	equ	$-fpuexception.exceptionflag
	
fpuconditions:
	.punnormalized: 	db "+Unnormalized"
	.nunnormalized: 	db "-Unnormalized"
	.pnormalized:   	db "+Normalized"
	.nnormalized:   	db "-Normalized"
	.poszero:       	db "+0"
	.negzero:       	db "-0"
	.pdenormalized: 	db "+Denormalized"
	.ndenormalized: 	db "-Denormalized"
	.pnan:          	db "+NaN"
	.nnan:          	db "-NaN"
	.pinfinity:     	db "+Infinity"
	.ninfinity:     	db "-Infinity"
	.empty:         	db "Empty"
topofstack:
	.st:				db	"ST0",10
	.st.len:			equ	$-topofstack.st

fpuerror:

	extDividend:		dt 		-8568.25360000
	extDivisor:			dt 		0.0

%include "fpu.inc"
%include "unistd.inc"

section .text

_start:
	mov		rdi,extDivisor
	mov		rsi,extDividend
	call	fpuDiv
	mov		rdi,rax
	call	fpuCheck
	syscall	exit,0
	
fpuDiv:
	xor		rax,rax							;zero out rax for status word
	push	rbp
	mov     rbp,rsp
	sub     rsp,100
	fsave 	[rsp]						;save the FPU state
	fld		tword[rsi]
	fld		tword[rdi]
	fdiv
	fstsw 	ax							;store results in AX
    fwait								;for precaution
	frstor	[rsp]
	mov		rsp,rbp
	pop		rbp
	ret
    
fpuCheck:
	push	rbp
	mov		rbp,rsp
	mov		rax,rdi
	;get FPU register
	and		rax,0011100000000000b
	rol     rax,5
	add		byte[topofstack+3],al
	syscall write,stdout,topofstack.st,topofstack.st.len
	;check if there was an exception.st
	and 	rax,0000000000000000b
	mov		rsp,rbp
	pop		rbp
	ret
