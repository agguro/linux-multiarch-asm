%ifndef _ASM_SYS_STAT_INC_
%define _ASM_SYS_STAT_INC_
     
     ; THIS FILE COULD CONTAIN ERRORS IN THE STRUCTURES USE AT YOUR OWN RISK
     ; stat structure is already tested and should work fine
     ; source: C header files
     ; converted for nasm by Roberto Aguas Guerreiro <aggurobe@gmail.com>

     ; permission and type flags

     %define   O_RDONLY                0
     %define   O_WRONLY                1
     %define   O_RDWR                  2
     %define   O_ACCMODE               3
     %define   O_CREAT                64
     %define   O_EXCL                128
     %define   O_NOCTTY              256
     %define   O_TRUNC               512
     %define   O_APPEND             1024
     %define   O_TMPFILE         4259840        ; 020000000 | O_DIRECTORY
     %define   O_DIRECTORY         65536 
     %define   O_NONBLOCK           2048
     %define   O_NDELAY       O_NONBLOCK

     ; File types.

     %define   S_IFMT         61440     ; bit mask for the file type bit fields
     %define   S_IFSOCK       49152     ; socket
     %define   S_IFLNK        40960     ; symbolic link
     %define   S_IFREG        32768     ; regular file
     %define   S_IFBLK        24576     ; block device
     %define   S_IFDIR        16384     ; directory
     %define   S_IFCHR         8192     ; character device
     %define   S_IFIFO         4096     ; FIFO
     %define   S_ISUID         2048     ; set UID bit
     %define   S_ISGID         1024     ; set-group-ID bit (see below)
     %define   S_ISVTX          512     ; sticky bit (see below)

     ; Protection bits.

     %define   S_ISUID        04000o                         ; Set user ID on execution.
     %define   S_ISGID        02000o                         ; Set group ID on execution.
     %define   S_ISVTX        01000o                         ; Save swapped text after use (sticky).
     %define   S_IREAD         0400o                         ; Read by owner.
     %define   S_IWRITE        0200o                         ; Write by owner.
     %define   S_IEXEC         0100o                         ; Execute by owner.

     %define   S_IRUSR        S_IREAD                       ; Read by owner.
     %define   S_IWUSR        S_IWRITE                      ; Write by owner.
     %define   S_IXUSR        S_IEXEC                       ; Execute by owner.
     %define   S_IRWXU        (S_IREAD|S_IWRITE|S_IEXEC)    ; Read, write, and execute by owner.

     %define   S_IRGRP        (S_IRUSR >> 3)                ; Read by group.
     %define   S_IWGRP        (S_IWUSR >> 3)                ; Write by group.
     %define   S_IXGRP        (S_IXUSR >> 3)                ; Execute by group.
     %define   S_IRWXG        (S_IRWXU >> 3)                ; Read, write, and execute by group.

     %define   S_IROTH        (S_IRGRP >> 3)                ; Read by others.
     %define   S_IWOTH        (S_IWGRP >> 3)                ; Write by others.
     %define   S_IXOTH        (S_IXGRP >> 3)                ; Execute by others.
     %define   S_IRWXO        (S_IRWXG >> 3)                ; Read, write, and execute by others.

     ; STAT structure definition
     STRUC STAT_STRUC
          .st_dev:          resq 1    ; device
          .st_ino:          resq 1    ; file serial number
          .st_nlink:        resq 1    ; link count 
          .st_mod:          resd 1    ; file mode
          .st_uid:          resd 1    ; user id of owner
          .st_gid:          resd 1    ; group id of owner
          .st_rdev:         resq 1    ; device number if device
          ._pad1:           resd 1
          .st_size:         resq 1    ; filesize in bytes
          .st_blksize:      resd 1    ; optimal block size for I/O
          ._pad2:           resd 1
          .st_blocks:       resq 1    ; number of 512-byte blocks allocated
          .st_atime:        resq 1    ; last access time secs
          .st_atime_nsec:   resq 1    ; last access time nsecs
          .st_mtime:        resq 1    ; last modification time secs
          .st_mtime_nsec:   resq 1    ; last modification time nsecs
          .st_ctime:        resq 1    ; last status changed time secs
          .st_ctime_nsec:   resq 1    ; last status changed time nsecs
          ._unused1:        resq 1
          ._unused2:        resq 1
          ._unused3:        resq 1
     ENDSTRUC

     %macro STAT 1
          %1: 
          ISTRUC STAT_STRUC
               at STAT_STRUC.st_dev,        dq 0 ; device
               at STAT_STRUC.st_ino,        dq 0 ; file serial number
               at STAT_STRUC.st_nlink,      dq 0 ; link count 
               at STAT_STRUC.st_mod,        dd 0 ; file mode
               at STAT_STRUC.st_uid,        dd 0 ; user id of owner
               at STAT_STRUC.st_gid,        dd 0 ; group id of owner
               at STAT_STRUC.st_rdev,       dq 0 ; device number if device
               at STAT_STRUC._pad1,         dd 0
               at STAT_STRUC.st_size,       dq 0 ; filesize in bytes
               at STAT_STRUC.st_blksize,    dd 0 ; optimal block size for I/O
               at STAT_STRUC._pad2,         dd 0
               at STAT_STRUC.st_blocks,     dq 0 ; number of 512-byte blocks allocated
               at STAT_STRUC.st_atime,      dq 0 ; last access time secs
               at STAT_STRUC.st_atime_nsec, dq 0 ; last access time nsecs
               at STAT_STRUC.st_mtime,      dq 0 ; last modification time secs
               at STAT_STRUC.st_mtime_nsec, dq 0 ; last modification time nsecs
               at STAT_STRUC.st_ctime,      dq 0 ; last status changed time secs
               at STAT_STRUC.st_ctime_nsec, dq 0 ; last status changed time nsecs
               at STAT_STRUC._unused1,      dq 0
               at STAT_STRUC._unused2,      dq 0
               at STAT_STRUC._unused3,      dq 0
          IEND  

          ; definition macro's for STAT structure

          %define %1.st_dev        %1+STAT_STRUC.st_dev
          %define %1.st_ino        %1+STAT_STRUC.st_ino
          %define %1.st_nlink      %1+STAT_STRUC.st_nlink
          %define %1.st_mod        %1+STAT_STRUC.st_mod
          %define %1.st_uid        %1+STAT_STRUC.st_uid
          %define %1.st_gid        %1+STAT_STRUC.st_gid
          %define %1.st_rdev       %1+STAT_STRUC.st_rdev
          ; %define %1._pad1         %1+STAT_STRUC._pad1
          %define %1.st_size       %1+STAT_STRUC.st_size
          %define %1.st_blksize    %1+STAT_STRUC.st_blksize
          ; %define %1._pad2         %1+STAT_STRUC._pad2
          %define %1.st_blocks     %1+STAT_STRUC.st_blocks
          %define %1.st_atime      %1+STAT_STRUC.st_atime
          %define %1.st_atime_nsec %1+STAT_STRUC.st_atime_nsec
          %define %1.st_mtime      %1+STAT_STRUC.st_mtime
          %define %1.st_mtime_nsec %1+STAT_STRUC.st_mtime_nsec
          %define %1.st_ctime      %1+STAT_STRUC.st_ctime
          %define %1.st_ctime_nsec %1+STAT_STRUC.st_ctime_nsec
          ; %define %1._unused1      %1+STAT_STRUC._unused1
          ; %define %1._unused2      %1+STAT_STRUC._unused2
          ; %define %1._unused3      %1+STAT_STRUC._unused3
     %endmacro

     ; stat64 structure definition
     ; the only structure I'm aware of today that is used in a low level programming language is the
     ; STAT structure. To be complete I added stat64 structure definitions too.
     ; feel free to correct it (and let me know please)
     %macro STAT64 1
          %1: 
          ; definition macro's for STAT64 structure
          %define %1.st_mode       %1+STAT_STRUC.st_mod
          %define %1.st_ino        %1+STAT_STRUC.st_ino
          %define %1.st_dev        %1+STAT_STRUC.st_dev
          %define %1.st_nlink      %1+STAT_STRUC.st_nlink
          %define %1.st_uid        %1+STAT_STRUC.st_uid
          %define %1.st_gid        %1+STAT_STRUC.st_gid
          %define %1.st_size       %1+STAT_STRUC.st_size
          %define %1.st_atime      %1+STAT_STRUC.st_atime
          %define %1.st_mtime      %1+STAT_STRUC.st_mtime
          %define %1.st_ctime      %1+STAT_STRUC.st_ctime
     %endmacro

%endif    ; _ASM_SYS_STAT_INC_
