; name        : readfile.asm
; description : shows the contents of a file in plain text
; build       : release: nasm -f elf64 -I ../../../includes -o readfile.o readfile.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o readfile readfile.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o readfile.debug.o readfile.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o readfile.debug readfile.debug.o

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/stat.inc"
[list +]

section .bss
    data_flag:      resb    1
    charBuffer:     resb    1
    stat_buf:       resb    STAT_STRUC_size

section .rodata
    usageMessage:   db  "usage: readfile filename", 10
    .length:        equ $ - usageMessage
    errorMessage:   db  "The program terminated with error: 0x"
    .length:        equ $ - errorMessage
    crlf:           db  10

section .text
    global _start
_start:
    pop     rax                             ; argc
    pop     rax                             ; pointer to program name (argv[0])
    pop     rcx                             ; pointer to filename (argv[1])
    test    rcx, rcx                        ; check if filename pointer exists
    jz      showUsage
    
    ; Note: we don't pop another arg here; we just check if argc was > 2
    ; pop rax | test rax, rax | jnz showUsage would check for a 3rd arg

OpenFile:
    syscall open, rcx, O_RDONLY             ; rcx is already an absolute pointer from stack
    test    rax, rax
    js      Error                           ; js triggers on negative (error)
    push    rax                             ; save fd

ReadTheFileSpec:
    mov     rdi, rax                        ; fd in RDI
    lea     rsi, [rel stat_buf]             ; PIC: RIP-relative address of buffer
    syscall fstat
    
    ; Accessing structure member via OFFSET ONLY to avoid relocation error
    lea     rax, [rel stat_buf]
    mov     rcx, qword [rax + STAT_STRUC.st_size] ; get the file size

ReadFileContents:
    test    rcx, rcx                        ; check if file is empty
    jz      CloseFile
    
.readLoop:
    push    rcx
    lea     rsi, [rel charBuffer]           ; PIC: RIP-relative
    mov     rdx, 1                          ; read one char
    ; fd is on top of stack from earlier 'push rax' (or preserved in register)
    mov     rdi, [rsp + 8]                  ; get saved fd from stack (above pushed rcx)
    syscall read
    
    lea     rsi, [rel charBuffer]
    mov     rdx, 1
    call    Print
    
    pop     rcx
    loop    .readLoop                       ; loop uses rcx

    call    PrintCRLF
      
CloseFile:
    pop     rdi                             ; restore fd
    syscall close
    jmp     Exit

showUsage:
    lea     rsi, [rel usageMessage]
    mov     rdx, usageMessage.length
    call    Print
    jmp     Exit      
      
Error:
    push    rax                             ; save error code
    lea     rsi, [rel errorMessage]
    mov     rdx, errorMessage.length
    call    Print
    
    pop     rax                             ; restore error code
    neg     rax                             ; get positive error value
    
    lea     r9, [rel data_flag]
    mov     byte [r9], 0                    ; reset flag
    
    mov     rcx, 16                         ; 16 nibbles for 64-bit hex
.getNextBits:
    push    rcx
    rol     rax, 4                          ; rotate left to get MSB first
    mov     rdx, rax
    and     rdx, 0x0F                       ; mask last 4 bits
    
    lea     r9, [rel data_flag]
    cmp     byte [r9], 1                    ; leading zeros check
    je      .printDigit
    test    dl, dl
    jz      .skip                           ; skip leading zero
    mov     byte [r9], 1
    
.printDigit:
    cmp     dl, 9
    jbe     .toASCII
    add     dl, 7
.toASCII:
    add     dl, "0"
    lea     r8, [rel charBuffer]
    mov     [r8], dl
    mov     rsi, r8
    mov     rdx, 1
    call    Print
.skip:
    pop     rcx
    loop    .getNextBits

    call    PrintCRLF
    jmp     Exit

Print:
    push    rax
    push    rdi
    push    rcx
    push    r11                             ; Preserve r11 for syscalls
    syscall write, stdout, rsi, rdx
    pop     r11
    pop     rcx
    pop     rdi
    pop     rax
    ret

PrintCRLF:
    lea     rsi, [rel crlf]
    mov     rdx, 1
    call    Print
    ret

Exit:      
    syscall exit, 0
