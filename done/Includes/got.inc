%ifndef _ASM_GOT_INC_
%define _ASM_GOT_INC_

;this include file is build up from the documentation of the nasm manual and several
;lookups on the internet.  Until now I didn't have got (no joke, plain English :-))
;any problems at all using it.  The disadvantage is that programming in assembly language
;becomes more high level with the use of macros and that's what I don't like too much.

extern  _GLOBAL_OFFSET_TABLE_

%macro prologue 0
	push    rbp
	mov     rbp,rsp
	push    rbx
	call    .get_GOT
.get_GOT:
	pop     rbx
	add     rbx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc
%endmacro

%macro epilogue 0
	mov		rbx,[rbp-8]
	mov		rsp,rbp
	pop		rbp
	ret
%endmacro

%macro proc 1
	global	%1:function
%1:
	prologue
%endmacro

; macro to end the procedure
%macro endp 1
	epilogue
%endmacro

;macro global data
;use: globaldata name,type,content
;to access the global variable
;mov		rax,qword [rbx + global_var wrt ..got]		;memory address to global_var
;mov		rax,[rax]									                ;value of global_var

%macro globaldata 3
	global    %1:data (%1.end - %1)
	section   .data
		%1:	%2	%3
		%1.end:
%endmacro

%endif  ; _ASM_GOT_INC_  