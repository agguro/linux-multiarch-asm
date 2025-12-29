%ifndef _ASM_SYS_DIRENT_INC_
%define _ASM_SYS_DIRENT_INC_
    
    ; directory and file structures

    STRUC DIRENT64_STRUC
        .d_ino:          resq 1    ; inode
        .d_off:          resq 1    ; offset to next linux dirent
        .d_reclen:       resw 1    ; length of this linux dirent
        .d_type:         resb 1    ; file type (since linux 2.6.42
        .d_name:         resb 256  ; filename
    ENDSTRUC

    %macro DIRENT64 1
        %1: ISTRUC DIRENT64_STRUC
            at DIRENT64_STRUC.d_ino,          dq 0              ; inode
            at DIRENT64_STRUC.d_off,          dq 0              ; offset to next linux dirent
            at DIRENT64_STRUC.d_reclen,       dw 0              ; length of this linux dirent
            at DIRENT64_STRUC.d_type,         db 0              ; file type (since linux 2.6.42)
            at DIRENT64_STRUC.d_name,         times 256 db 0    ; filename
        IEND
        %define %1.d_ino       %1+DIRENT64_STRUC.d_ino
        %define %1.d_off       %1+DIRENT64_STRUC.d_off
        %define %1.d_reclen    %1+DIRENT64_STRUC.d_reclen
        %define %1.d_type      %1+DIRENT64_STRUC.d_type
        %define %1.d_name      %1+DIRENT64_STRUC.d_name
    %endmacro

    %define DT_UNKNOWN     0      ; file type unknown
    %define DT_FIFO        1      ; named pipe
    %define DT_CHR         2      ; character device
    %define DT_DIR         4      ; directory
    %define DT_BLK         6      ; block device
    %define DT_REG         8      ; regular file
    %define DT_LNK         10     ; symbolic link
    %define DT_SOCK        12     ; UNIX domain socket
    %define DT_WHT         14     ; entry without file type ; undocumented

%endif  ; _ASM_SYS_DIRENT_INC_