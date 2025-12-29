;name: dealcards.asm
;
;build: nasm -felf64 dealcards.asm -o dealcards.o
;       ld -s -melf_x86_64 -o dealcards dealcards.o 
;
;description: Create a set of shuffled cards.
;             This demo creates 20 sets of dealed cards


[list -]
    %include "unistd.inc"
[list +]

;numbers are displayed wrong above 99
%define TOTAL_CARDS 52

bits 64
    
section .data
     
    shuffledcards:  times TOTAL_CARDS db 0
    buffer:         times 2 db 0
    spacer:         db " "
    eol:            db 0x0A

section .text

global _start
_start:

    mov     rdi,shuffledcards              ; pointer to buffer for the shuffled cards
    mov     rsi,TOTAL_CARDS                ; total cards to shuffle
    call    shuffle                         ; shuffle the cards
    mov     rdi,shuffledcards              ; pointer to the cards
    mov     rsi,TOTAL_CARDS                ; number of cards to show
    call    showCards                       ; show the cards
    mov     rsi,eol
    mov     rdx,1
    call    writeString                     ; print end of line
    syscall exit,0
    
showCards:
;RDI : pointer to buffer with cards to show
;RSI : number of cards to show
    mov     rcx,rsi                        ; number of cards to show in rcx
    mov     rsi,rdi                        ; pointer to card buffer in rdi
    xor     rax,rax
.next:     
    lodsb
    mov     rbx,10
    xor     rdx,rdx
    idiv    rbx
    or      dl,"0"
    mov     byte[buffer+1],dl
    mov     rdx,2                          ; length of output
    or      al,"0"
    mov     byte[buffer],al
    push    rcx
    push    rsi
    mov     rsi,buffer
    mov     rdx,3
    call    writeString
    pop     rsi
    pop     rcx
    loopnz  .next
    ret

writeString:
;RSI : pointer to the string
;RDX : length of the string
    syscall write,stdout
    ret


shuffle:
;RDI : pointer to buffer where the cards must be stored
;RSI : total cards in a deck
    mov     rbx,rsi                        ; TOTAL_CARDS in bl
    xor     r8,r8
.newcard:
    inc     r8                              ; increment counter
    cmp     r8,rbx                         ; TOTAL_CARDS reached?
    jg      .endshuffling
.tryagain:
    rdtsc                                      ; read the time stamp counter
    shr     rax,3                          ; divide by 8, this an empirical value, without, the algorithm takes a long time for cards = 52, 20
                                          ; still don't know why
    xor     ah,ah
    idiv    bl                              ; tsc divided by TOTAL_OF_CARDS, modulo in RDX
    and     ah,ah
    jne     .check
    mov     ah,bl                          ; if remainder is zero, then remainder is the highest card
     ; loop through shuffledcards to check if card is already choosen
.check:     
    mov     rsi,rdi
    mov     rcx,r8
.checknext:     
    lodsb                                      ; AL has the card
    and     al,al
    je      .storecard
    cmp     al,ah
    je      .tryagain
    loop    .checknext
.storecard:    
    dec     rsi
    mov     byte[rsi],ah
    jmp     .newcard
.endshuffling:
    ret
