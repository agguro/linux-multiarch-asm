;name:         libmodulo97.asm
;
;build:        nasm "-felf64" libmodulo97.asm -l libmodulo97.lst -o libmodulo97.o
;              ar rcs libmodulo97.a libmodulo97.o
;
;description:  Modulo 97 routines archive file
;
;functions:
;
;modulo97.check       : Checks the validity of a modulo97 number in RDI
;                        IN  : number in RDI
;                        OUT : CF = 0 if match else CF = 1
;modulo97.checkLength : Check the length of a ASCIIZ string against a given length in RDI.
;                        If the lengths aren't equal then the real length is returned in RAX. 
;                        IN  : RDI has the required length of the number to parse
;                              RSI points to the ASCIIZ string of the number
;                        OUT : CF = 0 if the length of the ASCIIZ string matches witch the length in RDI
;                              CF = 1 if the length of the ASCIIZ string doesn't match with the length in RDI
;                              RDI AND RSI are returned unchanged
;                              RAX is the real length of the string
;modulo97.calculate   : Calculates the modulo97 of a given number
;                        IN  : number we which to calculate the modulo 97 for in RDI
;                        OUT : modulo 97 in RAX
;modulo97.parseNumber : Try to parse a ASCIIZ string number into its hexadecimal equivalent
;                        IN  : RDI has the length of digits to parse
;                              RSI points to the ASCIIZ string
;                        OUT : if CF = 0 then RAX has the parsed number
;                              if CF = 1 then there was a non-digit in the number and RAX contains the position where the error occured
;                              RDI AND RSI are returned unchanged

bits 64

    global modulo97.calculate
    global modulo97.check
    global modulo97.checkLength
    global modulo97.parseNumber

section .text

modulo97.checkLength:
; Check the length of a ASCIIZ string against a given length in RDI.
; If the lengths aren't equal then the real length is returned in RAX
; IN  : RDI has the required length of the number to parse
;       RSI points to the ASCIIZ string of the number
; OUT : CF = 0 if the length of the ASCIIZ string matches witch the length in RDI
;       CF = 1 if the length of the ASCIIZ string doesn't match with the length in RDI
;       RDI AND RSI are returned unchanged
;       RAX is the real length of the string

    push      rdi                                ; save values
    push      rsi
    xchg      rdi, rsi                           ; switch length and stringpointer
    xor       rcx, rcx
    not       rcx                                ; put largest length in RCX
    xor       rax, rax                           ; prepare RAX
    cld                                          ; from begin of string till the end
    repne     scasb                              ; scan string at RDI for 0 (in AL)
    neg       rcx                                ; calculate length
    dec       rcx
    dec       rcx                                ; adjust length
    clc
    xor       rsi, rcx                           ; if calculated length is required length then the result will be zero
    jz        .done
    stc
.done:
    mov       rax, rcx                           ; real length in RAX                           
    pop       rsi                                ; restore values
    pop       rdi
    ret

modulo97.parseNumber:
; IN  : RDI has the length of digits to parse
;       RSI points to the ASCIIZ string
; OUT : if CF = 0 then RAX has the parsed number
;       if CF = 1 then there was a non-digit in the number and RAX contains the position where the error occured
;       RDI AND RSI are returned unchanged

    push      rsi
    cmp       rdi, 20                 ; maximum length of 64 bit signed decimal number
    je        .error
    mov       rcx, rdi
    xor       rdx, rdx                ; result
.repeat:        
    xor       rax, rax                ; RAX zero
    lodsb                             ; character in AL
    cmp       al, "0"
    jb        .error
    cmp       al, "9"
    ja        .error
    and       al, 0x0F                ; make decimal
    add       rdx, rax
    mov       rax, rdx
    cmp       rcx, 1                  ; last digit of number?
    je        .noerror                ; yes
    shl       rax, 1                  ; MUL 10
    shl       rdx, 3  
    add       rdx, rax
    loop      .repeat
.noerror:
    clc
    jmp       .done
.error:    
    mov       rax, rdi                 ; length of number in RAX
    sub       rax, rcx                 ; minus last digit where no error occured
    inc       rax                      ; plus one gives the error position in string
    stc
.done:
    pop       rsi
    ret

modulo97.check:
; IN  : number in RDI
; OUT : CF = 0 if match else CF = 1
    mov       rax, rdi
    mov       rbx, 100
    xor       rdx, rdx
    div       rbx                 ; RDX = quotient, RAX = remainder
    mov       rcx, rdx            ; store checkdigits
    mov       rdi, rax
    call      modulo97.calculate     
    clc
    xor       rcx, rax            ; if RCX = RAX then we will get 0 in RCX as result
    je        .done               ; match -> carryflag = 0
    stc                           ; no match carryflag = 1
.done:     
    ret
    
modulo97.calculate:
; IN  : number we which to calculate the modulo 97 for in RDI
; OUT : modulo 97 in RAX
    mov       rax, rdi
    mov       rbx, 97
    xor       rdx, rdx
    div       rbx
    mov       rax, rdx
    ret
