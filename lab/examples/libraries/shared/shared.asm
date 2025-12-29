;name: sharedlib.asm
;
;build: release version:
;           nasm -felf64 -o sharedlib.o sharedlib.asm
;           ld -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -shared -soname sharedlib.so -o sharedlib.so.1.0 sharedlib.o -R .
;           ln -sf sharedlib.so.1.0 sharedlib.so
;       debug/development version
;           nasm -felf64 -Fdwarf -g -o sharedlib-dev.o sharedlib.asm
;           ld -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -shared -soname sharedlib-dev.so -o sharedlib-dev.so.1.0 sharedlib-dev.o -R .
;           ln -sf sharedlib-dev.so.1.0 sharedlib-dev.so
;
;description: A "simple" shared library to use with hello.asm

bits 64

[list -]
    %include "unistd.inc"
[list +]
  
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

; self defined macro to declare global data and export it the same time
%macro _globaldata 3
    global  %1:data (%1.end - %1)
    section .data
        %1:    %2    %3
        %1.end:
%endmacro

extern  _GLOBAL_OFFSET_TABLE_
extern  printf                   ;function from libc
extern  glib_major_version       ;variable from libg

;global functions
global  getversion:function
global  getversionstring1:function
global  getversionstring2:function
global  printversionstring1:function
global  printversionstring2:function

;data accessable from the mainprogram
global  versionstring1:data (versionstring1.len)

section .data
       
    ;global data residing in the mainprograms data section
    ;don't forget the eol (ascii 10) at the end to flush to stdout or you see nothing on screen.
    versionstring1: db  "sharedlib version 1.0.0.0 by agguro residing in .data section of program",10,0
    .len:           equ $-versionstring1
    major_version:  dq  glib_major_version wrt ..sym
 
section .rodata

    ;local data
    versionnr:      dw  1,0,0,0
    .len:           equ $-versionnr    

    ;global data residing in the data section of the library 
    versionstring2: db  "sharedlib version 1.0.0.0 by agguro residing in .rodata section of library",10,0
    .len:           equ $-versionstring2
    shortversion:   dq  1

section .text
_start:
    
;a local function, not accessable from the main (unless declared global)
.localproc:
    mov     rax,major_version wrt ..gotoff
    add     rax,rbx
    mov     rax,[rax]
    ret                             ;we need to add ret ourselves

;a global function to get the version number returned in rax
_proc getversion
    ;two ways to get the external variable
    ;first if it's stored in the datasegment
    mov     rax,major_version wrt ..gotoff                  ;get offset to GOT
    add     rax,rbx                                         ;add GOT to get the address to the addres of the variable
    mov     rax,[rax]                                       ;get the address of the variable
    mov     rax,[rax]                                       ;get the value
    ;second, the short approach, is directly from the external libary
    mov     rax,qword[rbx + glib_major_version wrt ..got]   ;read address
    mov     rax,[rax]                                       ;read value at address
_endp
    
;Because versionstring1 is declared global supplied with a size, it will reside in the data
;section of the main program instead of the data section of the library.
;We have to access it as a global variable instead of local one, therefor we use wrt ..got
;https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/doc/nasmdoc.pdf page 120
_proc getversionstring1                                     ;residing in datasegment of the mainprogram
    mov     rax,[rbx + versionstring1 wrt ..got]            ;the adress to the version string
_endp

_proc printversionstring1
    mov     rdi,[rbx + versionstring1 wrt ..got]            ;the adress to the version string
    xor     rax,rax                                         ;in .data section of using program
    push    rbp
    mov     rbp, rsp
    call    printf wrt ..plt
    mov     rsp, rbp
    pop     rbp
_endp

;versionstring2 isn't declared global, it will reside in the data section of the library rather
;than in the mainprograms data section.  Hence we need to use wrt ..gotoff to address it.
;https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/doc/nasmdoc.pdf page 120
_proc getversionstring2                                     ;residing in datasegment of the mainprogram
    mov     rax,versionstring2 wrt ..gotoff                 ;the adress to the version string2
    add 	rax,rbx
_endp

_proc printversionstring2
    mov     rdi,versionstring2 wrt ..gotoff                 ;the adress to the version string
    add     rdi,rbx                                         ;in .data section of library
    xor     rax,rax
    push    rbp
    mov     rbp, rsp
    call    printf wrt ..plt
    mov     rsp, rbp
    pop     rbp
_endp
