;name: switchcase.asm
;
;description: switch the case of a zero-terminated alphanumeric string.
;             Bit 5 in a alphanumeric character indicates if a
;             character is upper or lower case.  Toggling this bit gives the required
;             case of that character.
;
;build: nasm -felf64 switchcase.asm -o switchcase.o

bits 64
   
section .text

global switchcase
    
switchcase:
;toggle case of characters in a stringz at rdi
    push    rdi                 ;save original memory address
    push    rsi                 ;save rsi
    push    rax
    mov     rsi,rdi             ;address of string in rsi
    cld
.repeat:   
    lodsb
    and     al, al
    jz      .done
    ; only alphanumerical characters can be switched
    cmp     al, "A"
    jb      .skip               ; we have to jump to stosb to adjust rdi too
    cmp     al, "Z"
    jbe     .change
    cmp     al, "a"
    jb      .skip
    cmp     al, "z"
    ja      .skip
.change:
    xor     al, 00100000b
.skip:
    stosb
    jmp     .repeat
.done:
    pop     rax                 ;restore used registers
    pop     rsi
    pop     rdi
    ret
