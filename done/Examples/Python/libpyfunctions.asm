;name: libpyfunctions.asm
;
;by: agguro
;
;description: example on how to create assemblerfunctions for use with python
;
;build: nasm -felf64 -o libpyfunctions.o libpyfunctions.asm
;       ld -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -shared -soname libpyfunctions.so -o libpyfunctions.so.1.0.0 libpyfunctions.o -R .

bits 64

; five macros to make life a bit easier
; each global function/method/routine (whatever you call it) must start with the PROLOGUE
%macro _prologue 0
    push    rbp
    mov     rbp,rsp
    push    rbx
    call    .get_GOT
.get_GOT:
    pop     rbx
    add     rbx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc
%endmacro

; each global function/method/routine (whatever you call it) must end with the EPILOGUE
%macro _epilogue 0
    mov     rbx,[rbp-8]
    mov     rsp,rbp
    pop     rbp
    ret
%endmacro

; macro to initiate and export the global procedure while defining it as a PROCEDURE
; doing so it's harder to forget to export it
%macro _proc 1
    global  %1:function
    %1:
    _prologue
%endmacro

; macro to end the procedure
%macro _endp 0
    _epilogue
%endmacro

extern  _GLOBAL_OFFSET_TABLE_

section .text
_start:

;calculate the square of rdi and put result in rax

_proc square
    mov     rax, rdi
    imul    rax, rdi
    ;don't end with ret, it's included in the _endp macro
_endp
