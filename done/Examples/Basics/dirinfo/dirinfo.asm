;name: dirinfo.asm
;
;description: displays directory entries information of the current working directory
;
;build: nasm -felf64 -Fdwarf -g dirinfo.asm -o dirinfo.o
;       ld -g -melf_x86_64 dirinfo.o -o dirinfo  

bits 64

    %include "unistd.inc"
    %include "sys/dirent.inc"
    %include "sys/stat.inc"

section .bss

    buffer:	resb    1024
    .len:	equ     $-buffer
    
section .data
    
    DIRENT64 dirent

    path:           db "."
    fd:             dq 0
    nread:          dq 0
    spacer:
    .7:             db " "	    ;each number indicates how many spaces
    .6:             db " "	    ;will be used
    .5:             db " "
    .4:             db " "
    .3:             db " "
    .2:             db " "
    .1:             db " " 
                    db 0
    col:            db "|",0
    line:           times 105 db "-"
                    db 10,0
    tableheader:    times 5 db " "
                    db "inode"
                    times 8 db " "
                    db "|"
                    times 3 db " "
                    db "next entry"
                    times 5 db " "
                    db "|"
                    times 2 db " "
                    db "record length"
                    times 2 db " "
                    db "|"
                    times 7 db " "
                    db "filetype"
                    times 13 db " "
                    db "|"
                    times 2 db " "
                    db "filename"
                    times 2 db " "
                    db 10,0
    totallength:    times 24 db " "
                    db "Total length |"
                    times 2 db " ",0
                    
section .text

global _start
_start:

    syscall open,path,O_RDONLY | O_DIRECTORY	;open path in readonly and as directory otherwise fail
    and     rax,rax
    js      Exit                                ;there was an error, just exit
    mov     qword[fd],rax                       ;save filedescriptor
    syscall getdents64,qword[fd],buffer,buffer.len
    and     rax,rax
    jle     Close                   ;if RAX = 0 : no entries, if RAX < 0 : error
    mov     qword[nread],rax
    mov     rsi,line
    call    String.ToSTDOUT
    mov     rsi,tableheader
    call    String.ToSTDOUT
    mov     rsi,line
    call    String.ToSTDOUT
    xor     rdx,rdx                 ;position in buffer
.repeat:     
    mov     rbx,buffer              ;buffer start
    add     rbx,rdx                 ;buffer + position = entry
    ; next entry
    xor     rcx,rcx                 ;length of entry
    mov     rsi,rbx                 ;this entry
    add     rbx,16                  ;address of length of entry
    mov     cx,word[rbx]            ;put in rcx
    mov     rdi,dirent              ;dirent structure pointer in RDI
    cld
    rep     movsb                   ;copy RCX bytes from RSI to RDI (into structure)
    ; read the entry record
    push    rdx
    mov     rsi,spacer.1
    call    String.ToSTDOUT
    mov     rax,qword[dirent.d_ino]
    call    Register.64bitsToHex
    mov     rsi,rax                 ;pointer to buffer in RSI
    call    String.ToSTDOUT
    mov     rsi,spacer.1
    call    String.ToSTDOUT
    mov     rsi,col
    call    String.ToSTDOUT
    mov     rsi,spacer.1
    call    String.ToSTDOUT
    mov     rax,qword[dirent.d_off]
    call    Register.64bitsToHex
    mov     rsi,rax
    call    String.ToSTDOUT    
    mov     rsi,spacer.1
    call    String.ToSTDOUT
    mov     rsi,col
    call    String.ToSTDOUT
    mov     rsi,spacer.6
    call    String.ToSTDOUT
    mov     ax,word[dirent.d_reclen]
    call    Register.16bitsToHex
    mov     rsi,rax
    call    String.ToSTDOUT
    mov     rsi,spacer.7
    call    String.ToSTDOUT
    mov     rsi,col
    call    String.ToSTDOUT    
    mov     rsi,spacer.2
    call    String.ToSTDOUT
    mov     al,byte[dirent.d_type]
    call    Register.8bitsToHex
    mov     rsi,rax
    call    String.ToSTDOUT
    mov     rsi,spacer.4
    call    String.ToSTDOUT
    mov     al,byte[dirent.d_type]
    call    Entry.GetType
    mov     rsi,qword[rax]
    call    String.ToSTDOUT
    mov     rsi,spacer.2
    call    String.ToSTDOUT    
    mov     rsi,col
    call    String.ToSTDOUT    
    mov     rsi,spacer.2
    call    String.ToSTDOUT 
    mov     rsi,dirent.d_name           ;name of entry
    call    String.ToSTDOUT   
    mov     al,0x0A
    call    Character.ToSTDOUT
    pop     rdx
    ; prepare to read next entry
    add     dx,word[dirent.d_reclen]
    mov     rax,qword[nread]
    cmp     rdx,rax
    jl      .repeat
    mov     rsi,line
    call    String.ToSTDOUT
    mov     rsi,totallength
    call    String.ToSTDOUT
    mov     rax,qword[nread]
    call    Register.64bitsToHex
    mov     rsi, rax
    call    String.ToSTDOUT
    mov     al,10                   ;end of line
    call    Character.ToSTDOUT
     
Close:
    syscall close,fd                ;close file descriptor
     
Exit:     
    syscall exit,0
    
Entry:
.GetType:
    section     .data
    ;keep all strings the same size to display them neatly in the table.
    FileType:
    .Unknown:      db "unknown           ",0
    .Fifo:         db "named pipe        ",0
    .Character:    db "character device  ",0
    .Directory:    db "directory         ",0
    .Block:        db "block device      ",0
    .Regular:      db "regular file      ",0
    .Link:         db "symbolic link     ",0
    .Socket:       db "unix domain socket",0
    .Without:      db "entry without type",0
    
    ;the values are:
    ;decimal  binary
    ;0         0000 ; file type unknown
    ;1         0001 ; named pipe (fifo)
    ;2         0010 ; character device
    ;4         0100 ; directory
    ;6         0110 ; block device
    ;8         1000 ; regular file
    ;10        1010 ; symbolic link
    ;12        1100 ; UNIX domain socket
    ;14        1110 ; entry without file type ; undocumented
    ;To lookup in the table for the appropriate string for each value, we can make use of a table with 15 entries and most of them will be zero (null pointer)
    ;To shorten the table we can however play with the bit positions. If we change the bits from position in the following manner:
    ;b3 b2 b1 b0 to b0 b1 b2 b3 then the values for each filetype are as showed:
    ;
    ;initial decimal after change decimal
    ;------- ------- ------------ -------
    ;0000       0         0000      0     ; file type unknown
    ;0001       1         1000      8     ; named pipe (fifo)
    ;0010       2         0100      4     ; character device
    ;0100       4         0010      2     ; directory
    ;0110       6         0110      6     ; block device
    ;1000       8         0001      1     ; regular file
    ;1010      10         0101      5     ; symbolic link
    ;1100      12         0011      3     ; UNIX domain socket
    ;1110      14         0111      7     ; entry without file type ; undocumented
    ;
    ;the new values, sorted ascending will give the next table
    ;
    ;0000       0         0000      0     ; file type unknown
    ;1000       8         0001      1     ; regular file
    ;0100       4         0010      2     ; directory
    ;1100      12         0011      3     ; UNIX domain socket
    ;0010       2         0100      4     ; character device
    ;1010      10         0101      5     ; symbolic link
    ;0110       6         0110      6     ; block device
    ;1110      14         0111      7     ; entry without file type ; undocumented
    ;0001       1         1000      8     ; named pipe (fifo)
    ;
    ;now we know how to place the pointers to the strings in our lookup table

    .Table: dq   .Unknown, .Regular, .Directory, .Socket, .Character, .Link, .Block, .Without, .Fifo
        
section	.text

    ;The algorithm to change bits to make a mirror of the bits can be found in Hacker's Delight.
    ;Since we deal with 4 bits in 8 bits registers we only need to process the 4 least significant bits.
    
    and	    rax,0Fh             ;delete unnecessary bits
    mov     ah,al               ;copy value in AH
    ; algorithm to mirror 4 bits
    and     ah,0x55
    shl     ah,1
    and     al,0xAA
    shr     al,1
    or      al,ah
    mov     ah,al
    and     ah,0x33
    shl     ah,2
    and     al,0xCC
    shr     al,2
    or      al,ah               ;delete AH
    xor     ah,ah
    ;multiply by 8 to calculate 64 bits offset of the string to display.
    shl     rax,3               ;8 bytes for 64 bit pointer
    ;added to our base address of the table 
    add     rax,FileType.Table
    ret

; routines to display and process register values    
Register:
section     .bss
    .hexbuffer:	resb    16
    .dummy:     resb    1       ;end of string
    
section     .text
    
.64bitsToHex:    
    mov     rcx,16              ;16 nibbles x 4 bits/nibble = 64 bits
    mov     rdi,.hexbuffer
    jmp     .convert
.16bitsToHex:
    mov     rcx,4
    mov     rdi,.hexbuffer+24
    and     rax,0FFFFh
    ror     rax,16              ;move word bits to upper registry bits
    jmp     .convert
.8bitsToHex:
    mov     rcx,2
    mov     rdi,.hexbuffer+30
    and     rax,0FFh
    ror     rax,8               ;move byte bits to upper registry bits
    jmp     .convert    
.convert:
    push    rdi                 ;save buffer
    ;convert RAX to ASCII hexadecimal
    mov     rdx, rax
    xor     rax, rax
    cld
.repeat:    
    rol     rdx,4               ;start with most significant nibble first
    mov     al,dl
    and     al,0Fh
    cmp     al,9
    jbe     .toascii
    add     al,7
.toascii:
    add     al,"0"
    stosb                       ;store AL in hexbuffer
    loop    .repeat
    pop     rax                 ;start of buffer in RAX
    ret
    
String:
.ToSTDOUT:
    cld
.repeat:     
    lodsb
    and     al,al
    jz      .done
    push    rsi
    call    Character.ToSTDOUT
    pop     rsi
    jmp     .repeat
.done:
    ret

Character:
section .bss   
    .charbuffer:    resb    1
    
section .text
      
.ToSTDOUT:
    mov     byte[.charbuffer],al
    syscall write,stdout,.charbuffer,1
    ret
