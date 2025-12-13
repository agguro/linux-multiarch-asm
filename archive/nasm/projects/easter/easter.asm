;name: easter.asm
;
;description: calculates the Easter day and month of a given yearwith the method of Gauss.
;source: https://nl.wikipedia.org/wiki/Paas-_en_pinksterdatum
;verified with: https://www.astro.oma.be/nl/informatie/wetenschappelijke-inlichtingen/wanneer-het-pasen/de-paasdata-van-1583-tot-3000/
;
;build: nasm -felf64 easter.asm -o easter.o
;   ld -melf_x86_64 easter.o -o easter  

bits 64

    %include "unistd.inc"

    %define STARTYEAR 1583
    %define NYEARS 3000-1583+1
    
global _start

section .bss
    buffer:    resb 20                  ;reserve 20 bytes as a buffer
        
section .rodata

section .data

    output:
    .dayt:      db  0x0
    .dayu:      db  0x0
                db  "/"
    .montht:    db  0x0
    .monthu:    db  0x0
                db  "/"
    .yearm:     db  0x0
    .yearh:     db  0x0
    .yeart:     db  0x0
    .yearu:     db  0x0
                db  0x0A
    .len:       equ $-output
            
section .text

_start:

    mov     rcx,NYEARS

    mov     rdi, STARTYEAR
.repeat:
    call    easter   
    call    show
    inc     rdi
    loopnz   .repeat
    syscall exit, 0

show:
    push    rcx
    push    rdi
    
    mov     rax,r14                     ;month
    mov     rdx,0
    mov     rbx,10
    div     rbx
    add     rax,0x30
    add     rdx,0x30
    mov     byte[output.montht],al
    mov     byte[output.monthu],dl
    mov     rax,r15                     ;day
    mov     rdx,0
    mov     rbx,10
    div     rbx
    add     rax,0x30
    add     rdx,0x30
    mov     byte[output.dayt],al
    mov     byte[output.dayu],dl
    mov     rax,rdi
    mov     rbx,10
    xor     rdx,rdx
    div     rbx
    add     dl,0x30
    mov     byte[output.yearu],dl
    xor     rdx,rdx
    div     rbx
    add     dl,0x30
    mov     byte[output.yeart],dl
    xor     rdx,rdx
    div     rbx
    add     dl,0x30
    add     al,0x30
    mov     byte[output.yearh],dl
    mov     byte[output.yearm],al
    
    syscall write,stdout,output,output.len
    pop     rdi
    pop     rcx
    ret    
    
easter:
    ;rdi is het jaar
    ;bereken het gulden getal
    ;G=(A mod 19)+1
    ;A = rdi
    ;G = r15
    mov     rax,rdi
    mov     rbx,19
    xor     rdx,rdx
    div     rbx
    inc     rdx
    mov     r15,rdx
    
    ;bereken het eeuwtal
    ;C=int(A/100)+1
    ;A = rdi
    ;C = r14
    mov     rax,rdi
    mov     rbx,100
    xor     rdx,rdx
    div     rbx
    add     rax,1
    mov     r14,rax
    
    ;bereken schrikkeljaar
    ;X=int(3*C/4)-12
    ;C = r14
    ;X = r13
    mov     rax,r14
    mov     rbx,3
    xor     rdx,rdx
    mul     rbx
    mov     rbx,4
    xor     rdx,rdx
    div     rbx
    sub     rax,12
    mov     r13,rax
    
    ;maancorrectie
    ;Y=int((8*C+5)/25)-5
    ;C = r14
    ;Y = r12
    mov     rax,r14
    mov     rbx,8
    xor     rdx,rdx
    mul     rbx
    add     rax,5
    mov     rbx,25
    xor     rdx,rdx
    div     rbx
    sub     rax,5
    mov     r12,rax
    
    ;zoek zondag
    ;Z=int(5*A/4)-10-X
    ;A = rdi
    ;X = r13
    ;Z = r11
    mov     rax,rdi
    mov     rbx,5
    xor     rdx,rdx
    mul     rbx
    mov     rbx,4
    xor     rdx,rdx
    div     rbx
    sub     rax,10
    sub     rax,r13
    mov     r11,rax
    
    ;epacta
    ;E=(11*G+20+Y+X)mod 30
    ;G = r15
    ;Y = r12
    ;X = r13
    ;E = r10
    mov     rax,r15
    mov     rbx,11
    xor     rdx,rdx
    mul     rbx
    add     rax,20
    add     rax,r12
    sub     rax,r13
    mov     rbx,30
    xor     rdx,rdx
    div     rbx
    ;IF E = 24 THEN E=E+1
    cmp     rdx,24
    je      .adjust_epacta
    ;IF E = 25 and G > 11 THEN E=E+1
    cmp     rdx,25
    jne     .done_epacta
    cmp     r15,11
    jle     .done_epacta
.adjust_epacta:    
    inc     rdx
.done_epacta:    
    mov     r10,rdx
    
    ;volle maan
    ;N=44-E
    ;E = r10
    ;N = r9
    mov     rax,44
    sub     rax,r10
    ;IF N<21 THEN N=N+30
    cmp     rax,21
    jge     .done_full_moon
    add     rax,30
.done_full_moon:    
    mov     r9,rax
    
    ;naar zondag
    ;P=N+7-(Z+N mod 7)
    ;N = r9
    ;Z = r11
    ;P = r8
    mov     rax,r11
    add     rax,r9
    mov     rbx,7
    xor     rdx,rdx
    div     rbx
    mov     rax,r9
    add     rax,7
    sub     rax,rdx
    mov     r8,rax
    
    ;Paadatum
    ;M=3
    ;IF P => 31 THEN P=P-31
    ;                M=M+1
    ;Paasdatum = P,M,A
    ;P = paasdag = rax
    ;M = maand = r14
    ;A = jaar = rdi
    mov     rax,r8              ;dag       
    mov     rdx,3               ;month
    cmp     rax,31
    jle     .done_easter
    sub     rax,31
    add     rdx,1
.done_easter:
    mov     r14,rdx
    mov     r15,rax
    ret
