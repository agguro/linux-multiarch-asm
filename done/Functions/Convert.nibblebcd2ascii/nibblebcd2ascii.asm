;name: nibblebcd2ascii.asm
;
;description: Convert a bcd nibble in lower 4 bits of rdi to ascii in rax.
;             This routine is very trivial and exists only to complete the set of
;             conversion routines. (byte, word, dword, qword, dqword.
;             When using this routine it's better to copy/paste the code if needed
;             for a single nibble.
;
;build: nasm -felf64 nibblebcd2ascii.asm -o nibblebcd2ascii.o

bits 64

global nibblebcd2ascii

section .text

nibblebcd2ascii:
    mov     rax,rdi
    and     rax,0x0F    ;keep lower 4 bits
    or      al,0x30     ;make ascii
    ret 
