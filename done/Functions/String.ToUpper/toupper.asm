;name: toupper.asm
;
;description: convert a zero-terminated alphanumeric string to uppercase.
;             Bit 5 in a alphanumeric character indicates if a
;             character is upper or lower case.  Set or reset this bit gives the required
;             case of that character.
;
;build: nasm -felf64 toupper.asm -o toupper.o

bits 64

global toupper

section .text

toupper:
;replace all characters in a stringz at rdi to uppercase
    push    rdi                 ;save original memory address
    push    rsi                 ;save rsi
    push    rax
    mov     rsi,rdi             ;address of string in rsi
    cld
.repeat:   
    lodsb                       ;read byte
    and     al, al
    jz      .done
    cmp     al, "a"
    jb      .skip
    cmp     al, "z"
    ja      .skip
.change:
    and     al,0xDF
.skip:
    stosb
    jmp     .repeat
.done:
    pop     rax                 ;restore used registers
    pop     rsi
    pop     rdi
    ret
