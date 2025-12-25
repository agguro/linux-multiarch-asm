; name        : dirinfo.asm
; description : displays directory entries information of the current working directory
; build       : release: nasm -f elf64  -I ../../../includes dirinfo.asm -o dirinfo.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o dirinfo dirinfo.o 
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o dirinfo.debug.o dirinfo.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o dirinfo.debug dirinfo.debug.o

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/dirent.inc"
    %include "sys/stat.inc"
[list +]

section .rodata    
    tableheader: db "  inode   |   next entry     | record length |       filetype          |  filename  ", 10, 0
    totallength: db "                Total length |", 0
    spacer:      db " ", 0
    col:         db "|", 0
    line:        db "---------------------------------------------------------------------------------------------------------"
    crlf:        db 10, 0
    dots:        db "...", 0
    
section .data
    path:        db ".", 0
    
    ; File Type Strings
    type_unk:    db "unknown           ", 0
    type_reg:    db "regular file      ", 0
    type_dir:    db "directory         ", 0
    type_soc:    db "unix domain socket", 0
    type_chr:    db "character device  ", 0
    type_lnk:    db "symbolic link     ", 0
    type_blk:    db "block device      ", 0
    type_non:    db "entry without type", 0
    type_pip:    db "named pipe        ", 0

    ; PIE-safe Lookup Table
    type_table:  dq type_unk, type_reg, type_dir, type_soc, type_chr, type_lnk, type_blk, type_non, type_pip

section .bss
    buffer:        resb 4096           ; getdents64 buffer
    .len:          equ  $ - buffer
    fd:            resq 1
    nread:         resq 1              
    dirent_buf:    resb 512            
    char_out:      resb 1              
    
    ; Specifieke buffers voor de conversie-routines om overlapping te voorkomen
    dec_conv_buf:     resb 64          
    dec_conv_buf_end: resb 1           
    
    hex_conv_buf:     resb 64          ; Iets ruimer voor veiligheid
    hex_conv_buf_end: resb 1
    
section .text
    global _start

_start:
    ; 1. Open Directory
    lea      rdi, [rel path]
    syscall  open, rdi, O_RDONLY | O_DIRECTORY
    test     rax, rax
    js       exit
    
    lea      rdi, [rel fd]
    mov      [rdi], rax             ; FD opslaan

    ; 2. Get Directory Entries
    mov      rdi, rax               
    lea      rsi, [rel buffer]
    syscall  getdents64, rdi, rsi, buffer.len
    test     rax, rax
    jle      close
    
    lea      rdi, [rel nread]
    mov      [rdi], rax             ; Aantal gelezen bytes opslaan
    
    ; 3. Print Headers
    lea      rdi, [rel line]
    call     string_tostdout
    lea      rdi, [rel tableheader]
    call     string_tostdout
    lea      rdi, [rel line]
    call     string_tostdout
    
    ; --- DE LUS ---
    xor      r12, r12               ; r12 = Huidige offset (MOET BOVEN REPEAT)
.repeat:
    lea      rbx, [rel buffer]
    add      rbx, r12               ; rbx = Adres van huidige entry in buffer
    
    ; Haal record lengte (d_reclen is een word op offset 16)
    movzx    rcx, word [rbx + 16]   
    
    ; Kopieer naar lokale dirent_buf (isolatie)
    mov      rsi, rbx
    lea      rdi, [rel dirent_buf]
    push     rcx                    ; Bewaar lengte
    cld
    rep      movsb
    pop      rcx                    ; Herstel lengte

    ; r13 wordt onze base pointer voor de data
    lea      r13, [rel dirent_buf]
    
    ; 1. Inode (offset 0)
    lea      rdi, [rel spacer]
    call     string_tostdout   
    mov      rdi, [r13]             ; d_ino
    mov		 rsi, 8
    call     Register.64bitsToDecimal
    mov      rdi, rax
    call     string_tostdout
    lea      rdi, [rel spacer]
    call     string_tostdout
    lea      rdi, [rel col]
    call     string_tostdout
    
    ; 2. Next Entry Offset (offset 8)
    
    lea      rdi, [rel spacer]
    call     string_tostdout
    mov      rdi, [r13 + 8]         ; d_off
    mov      rsi, 16
    call     Register.64bitsToHexAligned
    mov      rdi, rax
    call     string_tostdout
    lea      rdi, [rel spacer]
    call     string_tostdout
    lea      rdi, [rel col]
    call     string_tostdout
    
    ; 3. Record Length (offset 16)
    mov      rax, 6
    call     PrintSpacers
    movzx    rdi, word [r13 + 16]   ; d_reclen
    mov      rsi, 8
    call     Register.64bitsToDecimal
    mov      rdi, rax
    call     string_tostdout
    mov      rax, 1
    call     PrintSpacers
    lea      rdi, [rel col]
    call     string_tostdout

    ; 4. File Type (offset 18)
    lea      rdi, [rel spacer]
    call     string_tostdout
    movzx    rdi, byte [r13 + 18]   ; d_type
    mov      rsi, 2
    call     Register.64bitsToDecimal
    mov      rdi, rax
    call     string_tostdout
    
    mov      rax, 4
    call     PrintSpacers
    
    movzx    rax, byte [r13 + 18]
    call     Entry.GetType          
    mov      rdi, rax
    call     string_tostdout
    lea      rdi, [rel col]
    call     string_tostdout

    ; 5. Filename (offset 19)
    lea      rdi, [rel spacer]
    call     string_tostdout

    lea      rdi, [r13 + 19]        ; d_name
    call     string_tostdout
    
	lea		rdi, [rel crlf]
	call	string_tostdout
	
    ; Volgende record voorbereiden
    movzx    rax, word [r13 + 16]
    add      r12, rax               ; Update offset in buffer
    
    lea      r8, [rel nread]
    mov      rax, [r8]
    cmp      r12, rax               ; Alles verwerkt?
    jl       .repeat

    ; Footer
    lea      rdi, [rel line]
    call     string_tostdout
    lea      rdi, [rel totallength]
    call     string_tostdout
    lea      rax, [rel nread]
    mov      rdi, [rax]
    mov      rsi, 14
    call     Register.64bitsToDecimal
    mov      rdi, rax
    call     string_tostdout
    lea		rdi, [rel crlf]
    call     string_tostdout
      
close:
    lea      rax, [rel fd]
    mov      rdi, [rax]
    syscall  close, rdi
exit:      
    syscall  exit, 0

; --- Subroutines ---

PrintSpacers:
    mov      rcx, rax
.loop:
    push     rcx
    lea      rdi, [rel spacer]
    call     string_tostdout
    pop      rcx
    loop     .loop
    ret

Entry.GetType:
    ; Bit Mirroring logic
    and      rax, 0x0F
    mov      ah, al
    and      ah, 0x55
    shl      ah, 1
    and      al, 0xAA
    shr      al, 1
    or       al, ah
    mov      ah, al
    and      ah, 0x33
    shl      ah, 2
    and      al, 0xCC
    shr      al, 2
    or       al, ah
    and      rax, 0x0F
    
    ; Lookup via PIE-safe table
    lea      rbx, [rel type_table]
    shl      rax, 3                 
    add      rax, rbx
    mov      rax, [rax]             
    ret

char_tostdout:
	push	rcx
	push	r11
	push	rax
	push	rsi
	push	rdx
	syscall	write, stdout, rdi, 1
	pop		rdx
	pop		rsi
	pop		rax
	pop		r11
	pop		rcx
	ret

string_tostdout:
    ;rdi has pointer to string to display
    call	string_length
    push    rcx
    push    r11
    syscall	write,stdout,rdi,rax
    pop		r11
    pop		rcx
    ret
    
; -----------------------------------------------------------------------------
; string_length - returns the length of a null-terminated string
; -----------------------------------------------------------------------------
; in        : rdi = pointer to string
; out       : rax = length of string
; registers : except rax all unchanged.
; -----------------------------------------------------------------------------
string_length:
    push    rbx                 ; save registers to use
    push    rcx
    push    rdx
    push    rdi                 ; save original pointer

    ; 1. alignment check (look for first 8-byte boundary)
.align_loop:
    test    rdi, 7              ; is rdi aligned to 8 bytes?
    jz      .main_loop			; yes, start main_loop
    cmp     byte [rdi], 0       ; check each byte until alignment
    je      .done				; end of string already reached
    inc     rdi					; check next byte
    jmp     .align_loop

    ; 2. main loop, process 8 bytes at once
.main_loop:
    mov     rax, [rdi]          ; load 8 bytes
    mov     rbx, rax            ; safe a copy in rbx
    
    ; the Mycroft/Hacker's Delight bit-tric
    mov     rdx, 0x0101010101010101
    sub     rbx, rdx
    not     rax
    and     rbx, rax
    mov     rdx, 0x8080808080808080
    and     rbx, rdx
    jnz     .find_exact_byte    ; if result not zero then there is a zero in substring
    
    add     rdi, 8				; no zero in substring, calculate address of next 8 bytes
    jmp     .main_loop			; and keep looking for a zero

    ; 3. calculate position of zero byte in substring
.find_exact_byte:
    cmp     byte [rdi], 0		; starting at rdi
    je      .done				; is the byte zero?
    inc     rdi					; no, go to position of next byte
    jmp     .find_exact_byte	; and test this byte
    ; we've found the end of the string
.done:
    mov     rax, rdi            ; move pointer of end of string in rax
    pop     rdi                 ; restore pointer to start of string
    sub     rax, rdi            ; length = end - start
    
    pop     rdx					; restore used registers
    pop     rcx
    pop     rbx
    ret

; -----------------------------------------------------------------------------
; Register.64bitsToDecimal
; Invoer: RDI = getal, RSI = kolombreedte. Uitvoer: RAX = pointer naar string
; -----------------------------------------------------------------------------
Register.64bitsToDecimal:
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    push    r11

    lea     r8, [rel dec_conv_buf_end] 
    mov     byte [r8], 0        ; Null-terminator aan het einde
    
    mov     rax, rdi            ; Getal voor DIV
    mov     rbx, 10             ; Deler
    xor     rcx, rcx            ; Cijfer-teller

.convert_loop:
    dec     r8
    xor     rdx, rdx
    div     rbx                 ; RAX / 10 -> rest in RDX
    add     dl, '0'
    mov     [r8], dl
    inc     rcx
    test    rax, rax
    jnz     .convert_loop

.padding_loop:
    cmp     rcx, rsi
    jge     .done
    dec     r8
    mov     byte [r8], ' '
    inc     rcx
    jmp     .padding_loop

.done:
    mov     rax, r8             ; Retourneer start van de string
    pop     r11
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    ret

; -----------------------------------------------------------------------------
; Register.64bitsToHexAligned
; Invoer: RDI = getal, RSI = kolombreedte. Uitvoer: RAX = pointer naar string
; -----------------------------------------------------------------------------
Register.64bitsToHexAligned:
    push    rbx
    push    rcx
    push    rdx
    push    rdi
    push    rsi
    push    r11

    lea     r8, [rel hex_conv_buf_end]
    mov     byte [r8], 0        
    
    mov     rdx, rdi            ; Getal naar RDX voor rotatie
    mov     rcx, 16             ; Verwerk alle 16 nibbles
    xor     rbx, rbx            ; Flag voor eerste cijfer gevonden

.loop:
    rol     rdx, 4              ; Haal hoogste nibble naar voren
    mov     al, dl
    and     al, 0x0F
    
    test    al, al
    jnz     .is_digit
    test    rbx, rbx
    jnz     .is_digit
    
    cmp     rcx, rsi            ; Padding check
    jg      .skip_padding
    mov     al, ' '
    jmp     .store

.is_digit:
    mov     rbx, 1
    add     al, '0'
    cmp     al, '9'
    jbe     .store
    add     al, 7               ; A-F

.store:
    dec     r8
    mov     [r8], al

.skip_padding:
    loop    .loop
    
    test    rbx, rbx            ; Was het getal 0?
    jnz     .finish
    mov     byte [r8], '0'      ; Print tenminste één nul

.finish:
    mov     rax, r8
    pop     r11
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    ret

; -----------------------------------------------------------------------------
; Print.TruncatedName
; Invoer: RDI = pointer naar stringz, RSI = kolombreedte
; -----------------------------------------------------------------------------
Print.TruncatedName:
    push    rbx
    push    rcx
    push    rdx
    push    rdi
    push    rsi

    mov     rbx, rdi                ; RBX = de naam
    mov     r12, rsi                ; R12 = max breedte
    
    call    string_length           ; RAX = lengte van de naam
    
    cmp     rax, r12
    jbe     .print_normal           ; Als naam <= breedte, gewoon printen

    ; Naam is te lang: print (breedte - 3) tekens en dan "..."
    mov     rdx, r12
    sub     rdx, 3                  ; RDX = aantal tekens voor de puntjes
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, rbx                ; de naam
    syscall
    
    lea     rdi, [rel dots]
    call    string_tostdout
    jmp     .done

.print_normal:
    mov     rdx, rax                ; RDX = lengte
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, rbx                ; de naam
    syscall
    
    ; Optioneel: vul aan met spaties tot de kolombreedte
    ; Dit is handig als er nog een kolom RECHTS van de naam zou staan
    mov     rcx, r12
    sub     rcx, rdx                ; RCX = resterende spaties
    jz      .done
.space_loop:
    push    rcx
    lea     rdi, [rel spacer]
    call    char_tostdout           ; Gebruik je eerdere char routine
    pop     rcx
    loop    .space_loop

.done:
    pop     rsi
    pop     rdi
    pop     rdx
    pop     rcx
    pop     rbx
    ret
