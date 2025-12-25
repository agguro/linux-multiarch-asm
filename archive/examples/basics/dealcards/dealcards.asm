; name        : dealcards.asm
; description : Create a set of shuffled cards.
; build       : release: nasm -f elf64  -I ../../../includes dealcards.asm -o dealcards.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o dealcards dealcards.o 
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o dealcards.debug.o dealcards.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o dealcards.debug *.o

bits 64

[list -]
    %include "unistd.inc"
[list +]

%define TOTAL_CARDS 52
   
section .data
    shuffledcards: times TOTAL_CARDS db 0
    buffer:        times 2 db 0
    spacer:        db " "
    eol:           db 0x0A

section .text
    global _start
_start:
    ; PIC: Get address of shuffledcards buffer
    lea     rdi, [rel shuffledcards]
    mov     rsi, TOTAL_CARDS
    call    shuffle

    lea     rdi, [rel shuffledcards]
    mov     rsi, TOTAL_CARDS
    call    showCards

    lea     rsi, [rel eol]
    mov     rdx, 1
    call    writeString

    syscall exit, 0
    
showCards:
    mov     rcx, rsi              
    mov     rsi, rdi              
.next:     
    push    rcx
    push    rsi
    
    xor     rax, rax
    lodsb                         ; Get card value
    mov     rbx, 10
    xor     rdx, rdx
    div     rbx                   ; Using div (unsigned) is safer here
    
    ; PIC: Get address of buffer
    lea     rdi, [rel buffer]
    add     al, "0"
    add     dl, "0"
    mov     [rdi], al             ; Tens
    mov     [rdi + 1], dl         ; Units
    
    mov     rsi, rdi              ; RSI = pointer to buffer
    mov     rdx, 2                ; Length 2
    call    writeString
    
    ; Print spacer
    lea     rsi, [rel spacer]
    mov     rdx, 1
    call    writeString
    
    pop     rsi
    pop     rcx
    loop    .next
    ret

writeString:
    syscall write, stdout, rsi, rdx
    ret

shuffle:
    ; RDI : pointer to buffer
    ; RSI : total cards
    mov     rbx, rsi              ; rbx = limit
    xor     r8, r8                ; r8 = current card count
.newcard:
    inc     r8
    cmp     r8, rbx
    jg      .endshuffling
.tryagain:
    rdtsc                         ; EDX:EAX = timestamp
    shr     rax, 3                ; Your empirical shift
    xor     rdx, rdx              ; Clear rdx for div
    div     rbx                   ; rax / total_cards, rem in rdx
    
    mov     rax, rdx              ; rax = remainder (0 to 51)
    inc     rax                   ; rax = 1 to 52
    mov     r10b, al              ; r10b = candidate card

    ; Check if card is already chosen
    mov     rsi, rdi              ; Start of buffer
    mov     rcx, r8               ; Check up to current count
.checknext:     
    lodsb
    test    al, al                ; Reached uninitialized part?
    jz      .storecard
    cmp     al, r10b              ; Already exists?
    je      .tryagain
    loop    .checknext
.storecard:    
    mov     [rsi - 1], r10b
    jmp     .newcard
.endshuffling:
    ret
