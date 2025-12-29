;;;;;;; webvars.asm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Copyright (c) 2000 G. Adam Stanislav
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions
; are met:
; 1. Redistributions of source code must retain the above copyright
;    notice, this list of conditions and the following disclaimer.
; 2. Redistributions in binary form must reproduce the above copyright
;    notice, this list of conditions and the following disclaimer in the
;    documentation and/or other materials provided with the distribution.
;
; THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS “AS IS” AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
; SUCH DAMAGE.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Version 1.0
;
; Started:   8-Dec-2000
; Updated:   8-Dec-2000
; Updated:  22-March-2013 to 64 bits by Agguro
; reviewed:  1-April-2020
;
; Build:  nasm -felf64 -o webvars.o webvars.asm
;         ld -melf_x86_64 webvars.o -o webvars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .rodata

    http:   db "Content-type: text/html",0x0A,0x0A
            db "<html><head><title>Webvars</title></head><body><span>"
    .len:   equ $-http

    span:   db  "</span><br /><span>"
    .len:   equ $-span

    wrap:   db  "</span></body></html>"
    .len:   equ $-wrap

section .data
    envp:   dq  0
    
section .text

global _start
_start:
    ;the stack:
    ;rsp        argc
    ;rsp+8      programname
    ;rsp+16     argv (zero terminated list)
    ;rsp+24     envp (zero terminated list)
    ;
    ;get pointer to envp list
    mov     rax,[rsp]                   ;get argc
    inc     rax                         ;plus one for programname
    inc     rax                         ;plus one for end of argv list
    shl     rax,3                       ;muliply by 8 (number of bytes) for envp entry
    add     rax,rsp
    mov     [envp],rax                  ;save envp, r15 isn't changed by syscalls
    cld                                 ;should be ok but just in case
    ; send out all the http and xhtml stuff that is
    ; needed before we start showing the environment
    syscall write,stdout,http,http.len
    ; loop through the environment, printing it out
    mov     r15,[envp]
.next:
    mov     r14,[r15]                   ;get entry in envp list
    test    r14,r14
    jz      .wrap
    ;process environment string
    ; It may be tempting to search for the '=' in the env string next.
    ; But it is possible there is no '=', so we search for the terminating
    ; NUL first.
    mov     rdi,r14
    ; get length of environment string
    xor     rcx,rcx
    not     rcx
    xor     rax,rax
    repne   scasb
    not     rcx                         ;rcx = length string + 1
    dec     rcx                         ;rcx is string length
    ;write to stdout
    syscall write,stdout,r14,rcx
    ;write end of line
    syscall write,stdout,span,span.len
    add     r15,8                       ;next entry in env list
    jmp     .next
.wrap:
    ; print the rest of HTML
    syscall write,stdout,wrap,wrap.len
    ; return success
    syscall exit,0
