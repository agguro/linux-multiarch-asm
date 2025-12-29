;name: winsize.asm
;
;description: Shows the screen dimensions of a terminal in rows/columns.
;
;build: nasm -felf64 winsize.asm -o winsize.o
;       ld -melf_x86_64 winsize.o -o winsize

bits 64

%include "unistd.inc"
%include "sys/termios.inc"

global _start

section .bss
    buffer:    resb 5
    .end:
    .length:   equ  $-buffer
    lf:        resb 1
    
section .data
    WINSIZE winsize

    ;keep the lengths the same or the 'array' construction will fail!
    array:      db  "rows    : "
                db  "columns : "
                db  "xpixels : "
                db  "ypixels : "
    .length:    equ $-array
    .items:     equ 4
    .itemsize:	equ array.length / array.items
    
section .text
_start:
    mov     byte[lf], 10                ;end of line in byte after buffer
    ;fetch the winsize structure data
    syscall ioctl,stdout,TIOCGWINSZ,winsize
    ;initialize pointers and used variables
    mov     rsi,array			;pointer to array of strings
    mov     rcx,array.items             ;items in array
.nextVariable:    
    ;print the text associated with the winsize variable
    push    rcx                         ;save remaining strings to process
    push    rdx                         ;save winsize pointer
    mov     rdx,array.itemsize
    syscall write,stdout
    pop     rax                         ;restore winsize pointer
    push    rax                         ;save winsize pointer
    ;convert variable to decimal
    mov     ax,word[rax]                ;get value form winsize structure
    mov     rdi,buffer.end-1
.repeat:    
    xor     rbx,rbx                     ;convert value in decimal
    mov     bx,10
    xor     rdx,rdx
    div     bx
    xchg    rax,rdx
    or      al,"0"
    std
    stosb
    xchg    rax,rdx
    cmp     al,0
    jnz     .repeat
    push    rsi                         ;save pointer to text
    ;print the variable value    
    mov     rsi,rdi
    mov     rdx,buffer.end              ;length of variable
    sub     rdx,rsi
    inc     rsi
    syscall write,stdout
    pop     rsi
    pop     rdx
    ;calculate pointer to next variable value in winsize
    add     rdx,2
    ;calculate pointer to next string in strings
    add     rsi,array.itemsize
    ;if all strings processed
    pop     rcx                         ;remaining arrayitems
    loop     .nextVariable
    ;exit the program
    syscall exit,0
