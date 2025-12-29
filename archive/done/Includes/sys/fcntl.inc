%ifndef _ASM_SYS_FCNTL_INC_
%define _ASM_SYS_FCNTL_INC_

     %include "sys/stat.inc"

     ;Values for the second argument to access. These may be OR'd together.

     %define R_OK 4           ; Test for read permission.
     %define W_OK 2           ; Test for write permission.
     %define X_OK 1           ; Test for execute permission.
     %define F_OK 0           ; Test for existence.

     %define SEEK_SET 0       ; Seek from beginning of file.
     %define SEEK_CUR 1       ; Seek from current position.
     %define SEEK_END 2       ; Seek from end of file.

     %define F_ULOCK 0        ; Unlock a previously locked region.  */
     %define F_LOCK  1        ; Lock a region for exclusive use.  */
     %define F_TLOCK 2        ; Test and lock a region for exclusive use.  */
     %define F_TEST  3        ; Test a region for other processes locks.  */

     %define F_DUPFD 0        ; dup */
     %define F_GETFD 1        ; get close_on_exec */
     %define F_SETFD 2        ; set/clear close_on_exec */
     %define F_GETFL 3        ; get file->f_flags */
     %define F_SETFL 4        ; set file->f_flags */
     %define F_GETLK 5
     %define F_SETLK 6
     %define F_SETLKW 7
     %define F_SETOWN 8       ; for sockets. */
     %define F_GETOWN 9       ; for sockets. */
     %define F_SETSIG 10      ; for sockets. */
     %define F_GETSIG 11      ; for sockets. */

     %define F_GETLK64 12     ; using 'struct flock64' */
     %define F_SETLK64 13
     %define F_SETLKW64 14
     %define F_SETOWN_EX 15
     %define F_GETOWN_EX 16
     %define F_GETOWNER_UIDS 17
     %define F_OWNER_TID 0
     %define F_OWNER_PID 1
     %define F_OWNER_PGRP 2


     ; for F_[GET|SET]FL
     %define FD_CLOEXEC 1     ; actually anything with low bit set goes */

     ; for posix fcntl() and lockf()
     %define F_RDLCK 0
     %define F_WRLCK 1
     %define F_UNLCK 2

     ; for old implementation of bsd flock ()
     %define F_EXLCK 4        ; or 3
     %define F_SHLCK 8        ; or 4

     ; operations for bsd flock(), also used by the kernel implementation */
     %define LOCK_SH 1        ; shared lock
     %define LOCK_EX 2        ; exclusive lock
     %define LOCK_NB 4        ; or'd with one of the above to prevent blocking
     %define LOCK_UN 8        ; remove lock 

     %define LOCK_MAND 32	; This is a mandatory flock ... 
     %define LOCK_READ 64	; which allows concurrent read operations 
     %define LOCK_WRITE 128   ; which allows concurrent write operations
     %define LOCK_RW 192      ; which allows concurrent read & write ops

     ; allow sealing
     %define MFD_ALLOW_SEALING 2
     ;/*
     ; * Types of seals
     ; */
     %define F_SEAL_SEAL	1		     ; prevent further seals from being set
     %define F_SEAL_SHRINK 2		     ; prevent file from shrinking
     %define F_SEAL_GROW	4		     ; prevent file from growing
     %define F_SEAL_WRITE 8		     ; prevent writes
     %define F_SEAL_FUTURE_WRITE 16	; prevent future writes

     ;/* (1U << 31) is reserved for signed error codes */

     ;/*
     ; * Types of directory notifications that may be requested.
     ; */
     %define DN_ACCESS 0x00000001		; File accessed
     %define DN_MODIFY 0x00000002		; File modified
     %define DN_CREATE 0x00000004		; File created 
     %define DN_DELETE 0x00000008		; File removed 
     %define DN_RENAME 0x00000010		; File renamed 
     %define DN_ATTRIB 0x00000020		; File changed attibutes 
     %define DN_MULTISHOT 0x80000000	; Don't remove notifier 

     %define AT_FDCWD -100              ; Special value used to indicate openat should use the current working directory.
     %define AT_SYMLINK_NOFOLLOW 0x100  ; Do not follow symbolic links.
     %define AT_REMOVEDIR 0x200         ; Remove directory instead ofunlinking file.
     %define AT_SYMLINK_FOLLOW 0x400    ; Follow symbolic links.
     %define AT_NO_AUTOMOUNT 0x800	     ; Suppress terminal automount traversal
     %define AT_EMPTY_PATH 0x1000	     ; Allow empty relative pathname

;structures

     STRUC FLOCK_STRUC
          .l_type:          resw 1
          .l_whence:        resw 1
          .l_start:         resq 1
          .l_len:           resq 1
          .l_pid:           resd 1
     ENDSTRUC

     %macro FLOCK 1
          %1: 
          ISTRUC FLOCK_STRUC
               at FLOCK_STRUC.l_type,        dw 0
               at FLOCK_STRUC.l_whence,      dw 0
               at FLOCK_STRUC.l_start,       dq 0
               at FLOCK_STRUC.l_len,         dq 0
               at FLOCK_STRUC.l_pid,         dd 0
          IEND  

          ; definition macro's for FLOCK structure

          %define %1.l_type        %1+FLOCK_STRUC.l_type
          %define %1.l_whence      %1+FLOCK_STRUC.l_whence
          %define %1.l_start       %1+FLOCK_STRUC.l_start
          %define %1.l_len         %1+FLOCK_STRUC.l_len
          %define %1.l_pid         %1+FLOCK_STRUC.l_pid
     %endmacro
          

     STRUC F_OWNER_EX_STRUC
          .type:          resq 1
          .pid:           resq 1
     ENDSTRUC

     %macro F_OWNER_EX 1
          %1: 
          ISTRUC F_OWNER_EX_STRUC
               at F_OWNER_EX_STRUC.type,        dq 0
               at F_OWNER_EX_STRUC.pid,         dq 0
          IEND  

          ; definition macro's for F_OWNER_EX structure

          %define %1.type        %1+F_OWNER_EX.l_type
          %define %1.pid         %1+F_OWNER_EX.l_pid
     %endmacro
     
%endif    ;_ASM_SYS_FCNTL_INC_