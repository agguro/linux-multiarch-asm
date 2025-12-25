;name: bytebin2hexascii.asm
;
;description: branch free conversion of a byte in rdi to ASCII in rax.
;
;build: nasm -felf64 bytebin2hexascii.asm -o bytebin2hexascii.o

bits 64

global bytebin2hexascii

bytebin2hexascii:
    push    rdx
    xor     rdx,rdx
    mov     rax,rdi
    and     rax,0xFF
    ;4 least significant bits in dl 
    rol     ax,4
    mov     dl,al
    shr     ax,4        ;shift back to least significant positions
    and     al,0xF0     ;keep 4 most significant bits in al
    add     ax,0x0060   ;add 0110
    add     dx,0x0060   ;
    shr     al,4        ;move back to least significant positions
    shr     dl,4        ;
    sub     al,6        ;subtract 6
    sub     dl,6        ;
    and     al,0x0F     ;mask bits 7 to 4
    and     dl,0x0F     ;
    sub     al,ah       ;subtract ah from al
    sub     dl,dh       ;and dh from dl
    shl     ah,3        ;multiplicate ah and dh by 8
    shl     dh,3        ;
    sub     al,ah       ;subtract ah from al
    sub     dl,dh       ;and dh from dl
    add     ah,0x18     ;add 3 to bits in ah
    add     dh,0x18     ;and dh
    shl     ah,1        ;multiply ah by two
    shl     dh,1        ;and dh
    or      ah,al       ;make al ASCII
    or      dh,dl       ;make dl ASCII
    mov     al,dh       ;least significant digit in al
    pop     rdx
    ret
