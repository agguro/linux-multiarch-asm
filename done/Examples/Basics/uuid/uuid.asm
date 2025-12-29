;name: uuid.asm
;
;description: Generates a UUID
;
;build: nasm -felf64 uuid.asm -o uuid.o
;       ld -melf_x86_64 uuid.o -o uuid
;
;remark: Because UUID need to be unique (that's why U stands for) the user need to
;        check each generated UUID against a table which contains already generated
;        UUID's. This algorithm applied 10000 gives 51 same UUIDs, 100000 times
;        gives 135 same UUIDs, 1000000 gives us 18884 same UUIDs. So check the presence
;        of an already generated uuid. Another possibility is the use of mysql uuid
;        but requires the installation of mysql server.

bits 64

%include "unistd.inc"

;IOV structure definition
struc IOV_STRUC
    .iov_base:  resq    1
    .iov_len:   resq    1
endstruc

;macro to use IOV in a less complex manner
%macro IOV 3
    %define %1.base     %1+IOV_STRUC.base
    %define %1.len      %1+IOV_STRUC.len

    %1: istruc IOV_STRUC
    at IOV_STRUC.iov_base, dq   %2
    at IOV_STRUC.iov_len, dq    %3
    iend
%endmacro

section .bss
    ;keep all groups together to create 32 values at once
    uuid:           
    .group1:        resb      8
    .group2:        resb      4
    .group3:        resb      4
    .group4:        resb      4
    .group5:        resb      12

section .data

iov:
    IOV s1,uuid.group1,8
    IOV s2,hyphen,1
    IOV s3,uuid.group2,4
    IOV s4,hyphen,1
    IOV s5,uuid.group3,4
    IOV s6,hyphen,1
    IOV s7,uuid.group4,4
    IOV s8,hyphen,1
    IOV s9,uuid.group5,12
    IOV s10,crlf,1

    crlf:           db      10
    hyphen:         db      "-"
    
section .text

global _start
_start:
    mov     rdi, uuid 
    call    generate
    ; convert to ascii
    mov     rsi, uuid
    mov     rdi, uuid
    mov     rcx, 32
nextDigit:      
    cld
    lodsb
    call    nibbletoasciihex
    stosb
    loop    nextDigit
    syscall writev,stdout,iov,10
    syscall exit, 0
    
generate:
;in  : rdi = pointer to buffer to store 32 bytes
;out : rdi = pointer to buffer with GUID
    mov	    rcx,32                  ;32 characters to generate
.repeat:      
    xor	    rax,rax                 ;lower boundary of interval
    mov     rdx,0xF                 ;higher boundary of interval
    call    GenerateRandom
    cld
    stosb
    loop    .repeat
    ret

nibbletoasciihex:
; in  :: AL = NIBBLE or 4 bits (least significant)
; out :: AL = Hexadecimal ASCII of NIBBLE   
    and     al,0x0F
    or      al,"0"
    cmp     al,"9"
    jbe     .done
    add     al,39
.done:
    ret

GenerateRandom:
;in rdi : lower boundary of interval
;   rsi : higher boundary of interval
;interval length is 0xF
    mov	    rbx,0xF
    rdtsc                               ;read cpu time stamp counter
    push    rax
    rdtsc                               ;read cpu time stamp counter
    mov     rax,rdx
    pop     rax     
    rol     rdx,32                      ;mov EDX in high 32 bits of RAX
    or      rax,rdx                     ;RAX = seed
    call    XorShift                    ;get a pseudo random number
    and     rax,0xF
    ret
    
XorShift:
    mov     rdx,rax                     ;XORSHIFT algorithm
    shl     rax,13
    xor     rax,rdx
    mov     rdx,rax
    shr     rax,17
    xor     rax,rdx
    mov     rdx,rax
    shl     rax,5
    xor     rax,rdx                     ;rax random 64 bit value
    ret
