;name: dwordbin2bcd.asm
;
;description:  dwordbin2bcd.packed:   Branch free dword to packed bcd conversion.
;              dwordbin2bcd.unpacked: Dword to unpacked bcd conversion.
;
;use:
;packed bcd:   mov      rdi,hexadecimal
;              call     dwordbin2bcd.packed
;
;unpacked bcd: mov      rdi,hexadecimal
;              call     dwordbin2bcd.unpacked
;
;build: nasm -felf64 dwordbin2bcd.asm -o dwordbin2bcd.o

bits 64

global dwordbin2bcd.packed
global dwordbin2bcd.unpacked

section .text
    
dwordbin2bcd.unpacked:
    ;convert rdi to bcd, the result is returned in rax (11 digits max)
    call    dwordbin2bcd.packed
    push    rbx                             ;save used registers
    push    rcx
    mov     rdx,rax
    shr     rdx,32                          ;get 3 most significant digits
    shl     rdx,4                           ;unpack digits
    ror     dl,4
    rcl     eax,1                           ;eliminate upper 32 bits
    rcr     eax,1                           ;rax has 8 least significant digits
    mov     rbx,rax                         ;start unpacking
    shl     rbx,16
    or      rax,rbx
    mov     rcx,0x0000FFFF0000FFFF
    and     rax,rcx
    mov     rbx,rax
    shl     rbx,8
    or      rax,rbx
    mov     rcx,0x00FF00FF00FF00FF
    and     rax,rcx
    mov     rbx,rax
    shl     rbx,4
    or      rax,rbx
    mov     rcx,0x0F0F0F0F0F0F0F0F
    and     rax,rcx
    pop     rcx                             ;restore used registers
    pop     rbx
    ret
    
dwordbin2bcd.packed:
    push    rcx                             ;save used registers
    push    rdx
    mov     rax,rdi
    mov     ecx,-1
    and     rax,rcx
    mov     rcx,29                          ;number of bits to shift = 32 - 3
    ror     rax,cl                          ;put 3 most significant bits in al
.repeat:
    push    rcx                             ;save bit counter
    ;because rax has 29 bits in the most significant bit places we need to save them first
    ;before converting.  An alternative was to use rdx to store the rax bits to shift in.
    ;I didn't check if the latter method is shorter.
    mov     rdx,rax                         
    mov     rcx,0xFFFFFFF800000000          ;save only bits to shift in
    and     rdx,rcx
    push    rdx
    mov     rdx,rax                         ;value in rdx
    mov     rcx,0x00000007FFFFFFFF          ;keep only bits of already calculated conversion
    and     rdx,rcx                         
    and     rax,rcx
    mov     rcx,0x0000000333333333          ;add 3 to each digit
    add     rdx,rcx
    mov     rcx,0x0000000888888888          ;keep only most significant bit of each digit
    and     rdx,rcx
    shr     rdx,3                           ;eliminate bits 2,1 and 0
    add     rax,rdx                         ;rdx is either 0 or 1, add to calculated digits
    shl     rdx,1                           ;now add 2 to each digit
    add     rax,rdx
    pop     rdx                             ;restore bits to shift
    or      rax,rdx                         ;put them back in rax
    pop     rcx                             ;restore bit counter
    rol     rax,1                           ;shift next bit left to rax
    loop    .repeat                         ;decrement bits to shift in and repeat if still not zero
    pop     rdx                             ;save used registers
    pop     rcx
    ret
