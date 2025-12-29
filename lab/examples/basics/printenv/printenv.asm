; name        : printenv.asm
; description : Another Linux printenv program.
; build       : release: nasm -f elf64 -I ../../../includes -o printenv.o printenv.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o printenv *.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o printenv.debug.o printenv.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o printenv.debug *.o

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .bss
    buffer:         resb    1
    buffer.length:  equ $ - buffer

section .data
    ; Moved to .data because it can be modified by -0 or --null
    endofline:      db 10

section .rodata
    usage:
    db "Usage: ./printenv [OPTION]... [VARIABLE]...",10
    db "Print the values of the specified environment VARIABLE(s).",10
    db "If no VARIABLE is specified, print name and value pairs for them all.",10
    db 10
    db "-0, --null      end each output line with 0 byte rather than newline",10
    db "    --help      display this help and exit",10
    db "    --version   output version information and exit",10
    usage.length:    equ $ - usage
    
    version:
    db "printenv (NASM http://www.nasm.us) 0.01",10
    db "Copyright (C) 2011 Free Software Foundation, Inc.",10
    db "License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.",10
    db "This is free software: you are free to change and redistribute it.",10
    db "There is NO WARRANTY, to the extent permitted by law.",10
    db 10
    db "Written by David MacKenzie and Richard Mlynarik.", 10
    db "NASM version written by agguro (https://gitgub.com/agguro).",10
    version.length: equ $ - version
    
    invalid:        db "printenv: invalid option '"
    invalid.length: equ $ - invalid 

    option_msg:     db "'",10
                    db "Try `printenv --help` for more information.",10
    option.length:  equ $ - option_msg
    
section .text
    global _start
_start:
    pop     rbx                         ; argc
    pop     rsi                         ; the command name (argv[0])
    cmp     rbx, 1                      ; No arguments provided
    je      .GetAllVariables            

    ; Get first argument
    pop     rsi                         ; argv[1]
    mov     r15, rsi                    ; Save pointer for potential error msg
    
    cld
    lodsb                               
    cmp     al, '-'                     ; Check if it's an option
    je      .HandleOptions
    
    ; If not an option, treat it as a specific variable request
    dec     rsi                         
    push    rsi                         ; Variable to look for
    jmp     .GetVariable

.HandleOptions:
    lodsb
    cmp     al, '0'
    je      .IsNull
    cmp     al, '-'
    jne     .InvalidOption              
    
    ; Parsing long options (--help, --version, --null)
    lodsq
    rol     rax, 32
    cmp     al, 0
    je      .IsHelpOrNull               
    
    ror     rax, 24
    cmp     al, 0
    jne     .InvalidOption
    
    ror     rax, 8
    mov     rbx, "version"
    cmp     rax, rbx
    je      .IsVersion
    jmp     .Exit

.IsHelpOrNull:
    rol     rax, 32
    cmp     eax, "help"
    je      .IsHelp
    cmp     eax, "null"
    je      .IsNull
    jmp     .Exit                       

.IsNull:
    lea     rax, [rel endofline]
    mov     byte [rax], 0
    cmp     rbx, 2                      ; If only 'printenv -0', get all
    jne     .GetVariable
    jmp     .GetAllVariables

.IsHelp:
    lea     rsi, [rel usage]
    mov     rdx, usage.length
    call    Write
    jmp     .Exit

.IsVersion:
    lea     rsi, [rel version]
    mov     rdx, version.length
    call    Write
    jmp     .Exit

.InvalidOption:
    lea     rsi, [rel invalid]
    mov     rdx, invalid.length
    call    Write
    mov     rsi, r15
    call    PrintVariable
    lea     rsi, [rel option_msg]
    mov     rdx, option.length
    call    Write
    jmp     .Exit

.GetAllVariables:
    ; At this point on the stack, after popping argv, comes the envp list
    ; The stack looks like: [envp0][envp1]...[NULL]
    ; Note: The original code skips over the NULL at the end of argv
    pop     rsi                         ; Skip the NULL terminating argv
.NextVariable:    
    pop     rsi                         ; Read environment string pointer
    test    rsi, rsi                    ; NULL pointer marks end of envp
    jz      .Exit
    call    PrintVariable
    call    PrintVariable.eol
    jmp     .NextVariable

.GetVariable:
    pop     rdi                         ; Target variable name
    push    rdi
    xor     rcx, rcx
    not     rcx                         ; RCX = -1
    xor     rax, rax
    repne   scasb                       ; Find null terminator
    not     rcx                         ; RCX = length + 1
    dec     rcx                         ; RCX = length of search string
    
    pop     rdi                         ; Restore target name
    pop     rsi                         ; Move past end of argv to envp
.getNV:
    pop     rsi                         ; Get next env string
    test    rsi, rsi
    jz      .Exit                       ; Not found
    
    push    rdi                         ; Save target name
    push    rcx                         ; Save length
    push    rsi                         ; Save env string start
    
    repe    cmpsb                       ; Compare name
    jne     .noMatch
    
    ; Check if match is exact (next char in envp must be '=')
    cmp     byte [rsi], '='
    je      .FoundMatch

.noMatch:
    pop     rsi
    pop     rcx
    pop     rdi
    jmp     .getNV

.FoundMatch:
    inc     rsi                         ; Skip the '='
    call    PrintVariable
    call    PrintVariable.eol
.Exit:
    syscall exit, 0

; --- Utility Functions ---

PrintVariable:
    cld
.nextByte:
    lodsb
    test    al, al
    jz      .done
    lea     r8, [rel buffer]
    mov     [r8], al
    push    rsi
    mov     rsi, r8
    mov     rdx, 1
    call    Write
    pop     rsi
    jmp     .nextByte
.done:    
    ret

.eol:
    lea     rax, [rel endofline]
    mov     al, [rax]
    lea     r8, [rel buffer]
    mov     [r8], al        
    mov     rsi, r8
    mov     rdx, 1
    call    Write
    ret

Write:
    push    rcx
    push    r11
    syscall write, stdout, rsi, rdx
    pop     r11
    pop     rcx
    ret
