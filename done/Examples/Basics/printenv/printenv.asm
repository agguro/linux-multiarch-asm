;name: printenv.asm
;
;description: Another Linux printenv program.
;             Shows the environment params on stdout.
;
;build: nasm -felf64 printenv.asm -o printenv.o
;       ld -melf_x86_64 printenv.o -o printenv

bits 64

%include "unistd.inc"

global _start

section .bss

    buffer:         resb    1
    buffer.length:  equ $-buffer

section .rodata

    ;printenv --help
    usage:
    db "Usage: ./printenv [OPTION]... [VARIABLE]...",10
    db "Print the values of the specified environment VARIABLE(s).",10
    db "If no VARIABLE is specified, print name and value pairs for them all.",10
    db 10
    db "-0, --null     end each output line with 0 byte rather than newline",10
    db "    --help     display this help and exit",10
    db "    --version  output version information and exit",10
    usage.length:   equ $-usage
    
    ;printenv --version
    version:
    db "printenv (NASM http://www.nasm.us) 0.01",10
    db "Copyright (C) 2011 Free Software Foundation, Inc.",10
    db "License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.",10
    db "This is free software: you are free to change and redistribute it.",10
    db "There is NO WARRANTY, to the extent permitted by law.",10
    db 10
    db "Written by David MacKenzie and Richard Mlynarik.", 10
    db "NASM version written by Agguro (http://www.linuxnasm.be).",10
    version.length: equ $-version
    
    invalid:
        db "printenv: invalid option '"
    invalid.length: equ $-invalid 

    option:
        db "'",10
        db "Try `printenv --help` for more information.",10
    option.length:  equ $-option
    
    ;printenv -0  or printenv --null sets this to 0
    endofline:
        db 10
    
section .text

_start:
    pop	    rbx                         ;argc
    pop     rsi                         ;the command
    cmp     rbx,1                       ;no options nor variablename
    je      .GetAllVariables            ;get all variables
    ;there are options or a variablename
    pop     rsi                         ;get pointer to string
    mov	    r15,rsi                     ;save pointer to option
    ;we got the pointer to the command string
    cld
    lodsb                               ;read byte
    cmp     al,'-'                      ;if = '-' then we have an option
    je      .NoVariable
    dec     rsi                         ;adjust pointer
    push    rsi                         ;put required variable on stack
    jmp     .GetVariable
.NoVariable:
    lodsb
    cmp     al,'0'
    je      .IsNull
    cmp     al,'-'
    jne     .InvalidOption              ;not an option -> exit
    lodsq
    rol     rax,32
    cmp     al,0
    je      .IsHelpOrNull               ;check if help or null
    ror     rax,24
    cmp     al,0
    jne     .InvalidOption
    ror     rax,8
    mov     rbx,"version"
    cmp     rax,rbx
    je      .IsVersion
    jmp     .Exit
.IsHelpOrNull:
    rol     rax,32
    cmp     eax,"help"
    je      .IsHelp
    cmp     eax,"null"
    je      .IsNull
    jmp     .Exit                       ;not 'h' nor 'v' -> just exit
.IsNull:
    mov     byte[endofline],0
    cmp     rbx,2
    jne     .GetVariable
    jmp     .GetAllVariables
.IsHelp:
    mov     rsi,usage
    mov     rdx,usage.length
    call    Write
    jmp     .Exit
.IsVersion:
    mov     rsi,version
    mov     rdx,version.length
    call    Write
    jmp     .Exit
.InvalidOption:
    mov     rsi,invalid
    mov     rdx,invalid.length
    call    Write
    mov	    rsi,r15
    call    PrintVariable
    mov     rsi,option
    mov     rdx,option.length
    call    Write
    jmp     .Exit
.GetAllVariables:
    pop     rsi
    ;no additional options,print them all
    ;rsp points to the first item in the parameterstringlist on stack  
.NextVariable:    
    pop     rsi                         ;read stringpointer
    cmp     rsi,0                       ;if zero then end of list
    je      .Exit
    call    PrintVariable
    call    PrintVariable.eol
    jmp     .NextVariable
.GetVariable:
    ;first calculate the length of the variable including trailing zero
    pop     rdi                         ;required variable
    push    rdi
    sub     rcx,rcx
    not     rcx                         ;RCX = FFFFFFFFFFFFFFFF
    sub     rax,rax
    repne   scasb
    not     rcx                         ;RCX = string length + 1
    dec     rcx
    pop     rdi                         ;start of variablename in RDI
    pop     rsi                         ;end of arguments
    ;RDI : RCX contains the variablename and length 
    push    rdi                         ;save required variable pointer
    push    rcx                         ;save length
.getNV:
    pop     rcx                         ;restore length
    pop     rdi                         ;restore required variable pointer
    pop     rsi                         ;first variable in the list
    cmp     rsi,0                       ;if zero then end of list
    je      .Exit
    push    rdi                         ;restore required variable pointer
    push    rcx                         ;restore length
    rep     cmpsb                       ;compare two strings against each other for RCX bytes
    jne     .getNV                      ;no match,next variable
    ;we have a match,print the variable
    inc     rsi                         ;remove '="
    call    PrintVariable
    call    PrintVariable.eol
.Exit:
    syscall exit,0

PrintVariable:
    ;now read the bytes from the string pointed by RSI and display them
    cld
.nextByte:
    lodsb
    cmp     al,0                        ;if zero then last byte in string 
    je      .done
    mov     byte[buffer],al
    push    rsi
    push    rdi
    mov     rsi,buffer
    mov     rdx,buffer.length
    call    Write
    pop     rdi
    pop     rsi
    jmp     .nextByte
.done:    
    ret
.eol:
    mov     al,byte[endofline]
    mov     byte[buffer],al        
    mov     rsi,buffer
    mov     rdx,buffer.length
    call    Write
    ret
Write:
    push    rsi
    push    rdi
    push    rcx
    push    rax
    ;rsi and rdx are already initialized to the string and the length
    syscall write,stdout
    pop     rax
    pop     rcx
    pop     rdi
    pop     rsi
    ret
