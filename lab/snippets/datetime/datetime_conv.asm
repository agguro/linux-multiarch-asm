; ==============================================================================
; File: date_gadgets.asm
; Description: Consolidated Branch-Free Date and Calendar Logic
; Author: agguro
; ==============================================================================

bits 64
section .text

global semester, quadrimester, trimester, weekend, leapyear, daysinmonth, shiftedmonth

; --- Semester (1-2) ---
semester:
    mov     rax, rdi
    inc     al              ; s = month + 1
    shr     al, 3           ; s = s div 8
    inc     al              ; s = s + 1
    ret                     ;

; --- Quadrimester (1-3) ---
quadrimester:
    mov     rax, rdi
    dec     al              ; q = month - 1
    shr     al, 2           ; q = q idiv 4
    inc     al              ; q = q + 1
    ret                     ;

; --- Trimester (1-4) ---
trimester:
    mov     rax, rdi
    mov     ah, al          ;
    inc     ah              ; q = month + 1
    shr     ah, 3           ; s = left bit of q
    shl     ah, 1           ; s = s * 2
    add     al, ah          ; q = q + s
    shr     al, 2           ; q = q div 4
    inc     al              ; q = q + 1
    xor     ah, ah          ;
    ret                     ;

; --- Weekend Detection ---
weekend:
    mov     rax, rdi
    inc     al              ; day = day + 1
    inc     al              ;
    shr     al, 3           ; isolate bit 3
    ret                     ;

; --- Days in Month (Feb=28) ---
daysinmonth:
    mov     rax, rdi
    mov     ah, al          ;
    shr     ah, 3           ;
    xor     ah, al          ;
    and     ah, 1           ;
    or      ah, 28          ; adjust days
    dec     al              ;
    dec     al              ;
    or      al, 0xF0        ;
    dec     al              ;
    shr     al, 3           ;
    and     al, 2           ;
    or      ah, al          ;
    shr     ax, 8           ; return in AL
    ret                     ;

; --- Leap Year Detection ---
leapyear:
    push    rbx             ;
    push    rcx             ;
    push    rdx             ;
    mov     rax, rdi        ;
    xor     rcx, rcx        ;
    test    rax, 3          ;
    jnz     .done           ;
    inc     rcx             ;
    xor     rdx, rdx        ;
    mov     rbx, 100        ;
    div     rbx             ;
    and     rdx, rdx        ;
    jnz     .done           ;
    test    rax, 3          ;
    jz      .done           ;
    dec     rcx             ;
.done:
    mov     rax, rcx        ;
    pop     rdx             ;
    pop     rcx             ;
    pop     rbx             ;
    ret                     ;

; --- Shifted Month (Easter calculation) ---
shiftedmonth:
    mov     rax, rdi        ;
    and     rax, 1111b      ;
    dec     ax              ;
    dec     ax              ;
    dec     ax              ;
    and     ax, 1111010000001111b ;
    not     ah              ;
    and     al, ah          ;
    inc     al              ;
    and     rax, 1111b      ;
    ret                     ;
    
section .note.GNU-stack noalloc noexec nowrite progbits
