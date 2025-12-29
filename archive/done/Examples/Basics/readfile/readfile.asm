;name: readfile.asm
;
;build: nasm -felf64 readfile.asm -o readfile.o
;       ld -melf_x86_64 readfile.o -o readfile
;
;description: shows the contents of a file in plain text

bits 64

%include "unistd.inc"
%include "sys/stat.inc"

section .bss

    data:           resb    1
    charBuffer:     resb    0
    
section .data

    usageMessage:   db  "usage: readfile filename",10
    .length:        equ $-usageMessage
    errorMessage:   db  "The program terminated with error: 0x"
    .length:        equ $-errorMessage
    crlf:           db  10

section .data
    
    ;file status structure
    STAT stat                               ;in sys/stat.inc

section .text

global _start
_start:
    
    pop	    rax                             ;argc
    pop     rax                             ;pointer to name
    pop     rcx                             ;pointer to file
    jz      showUsage
    pop     rax                             ;more arguments?
    or      rax,rax
    jnz     showUsage                       ;yes, show the usage message
OpenFile:
    syscall open,rcx,O_RDONLY
    cmp     rax,0
    jl      Error
    push    rax                             ;save fd
ReadTheFileSpec:
    pop     rdi                             ;get fd
    push    rdi                             ;save fd
    mov     rsi,stat                        ;stat structure pointer
    syscall fstat
        
    mov     rcx,qword[stat.st_size]         ;get the file size
     
ReadFileContents:
    push    rcx
    mov     rsi,charBuffer                  ;place for one byte
    mov     rdx,1                           ;read one char at the time
    syscall read
    
    call    Print
    pop     rcx
    dec     rcx
    cmp     rcx,0
    jne     ReadFileContents

    call    PrintCRLF
      
CloseFile:
    pop     rdi                             ;fd in RDI
    syscall close                           ;close file
    jmp     Exit

showUsage:
    mov     rsi,usageMessage
    mov     rdx,usageMessage.length
    call    Print
    jmp     Exit      
      
Error:
    mov     rsi,errorMessage
    mov     rdx,errorMessage.length
    call    Print
    neg     rax                             ;get the error
    xor     rcx,rcx
getNextBits:
    inc     rcx 
    cmp     rcx,17                          ;16 bytes processed?
    je      ErrorEnd                        ;Exit program
    xor     rdx,rdx
    rcl     rax,1                           ;get 4 bits starting at MSBit
    rcl     rdx,1                           ;store in rdx
    rcl     rax,1                           ;get next bit starting at MSBit
    rcl     rdx,1                           ;store in rdx
    rcl     rax,1                           ;get next bit starting at MSBit
    rcl     rdx,1                           ;store in rdx
    rcl     rax,1                           ;get next bit starting at MSBit
    rcl     rdx,1                           ;store in rdx
    cmp     byte[data],1                    ;are there already databytes printed?
    je      skipZeroCheck
    cmp     dl,0                            ;data in it?
    jz      getNextBits
    mov     byte[data],1                    ;when data is True then print al following zeros
skipZeroCheck:      
    cmp     dl,9
    jle     toASCII
    add     dl,7
toASCII:
    add     dl,"0"
    mov     byte[charBuffer],dl
    mov     rsi,charBuffer
    mov     rdx,1
    call    Print                           ;print the byte
    jmp     getNextBits
ErrorEnd:
    call    PrintCRLF
    jmp     Exit
Print:
    push    rax
    push    rdi
    push    rcx
    syscall write,stdout
    pop     rcx
    pop     rdi
    pop     rax
    ret
PrintCRLF:
    mov     rsi,crlf
    mov     rdx,1
    call    Print
    ret
Exit:      
    syscall exit,0
