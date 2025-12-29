%ifndef _ASM_SYS_SEM_INC_
%define _ASM_SYS_SEM_INC_

     ; Get system dependent definition of `struct semid_ds' and more.
     %define SEM_UNDO    0x1000    ; undo the operation on exit

     ; Commands for `semctl'.
     %define GETPID      11        ; get sempid
     %define GETVAL      12        ; get semval
     %define GETALL      13        ; get all semval's
     %define GETNCNT     14        ; get semncnt
     %define GETZCNT     15        ; get semzcnt
     %define SETVAL      16        ; set semval
     %define SETALL      17        ; set all semval's


     ;Data structure describing a set of semaphores.

     STRUC SEMID_DS_STRUC
          .sem_perm.__key:              resq    1
          .sem_perm.uid:                resd    1
          .sem_perm.gid:                resd    1
          .sem_perm.cuid:               resd    1
          .sem_perm.cgid:               resd    1
          .sem_perm.mode:               resw    1
          .sem_perm.__pad1:             resw    1
          .sem_perm.__seq:              resw    1
          .sem_perm.__pad2:             resw    1
          .sem_perm.__glibc_reserved1:  resq    1
          .sem_perm.__glibc_reserved2:  resq    1
          ; end of sem_perm IPC_PERM structure
          .sem_otime:                   resq    1 ; last semop() time
          .__glibc_reserved1:           resq    1
          .sem_ctime:                   resq    1 ; last time changed by semctl()
          .__glibc_reserved2:           resq    1 ;
          .sem_nsems:                   resq    1 ; number of semaphores in set
          .__glibc_reserved3:           resq    1
          .__glibc_reserved4:           resq    1
     ENDSTRUC

     %macro SEMID_DS 1
     %1: 
     ISTRUC SEMID_DS_STRUC
          at SEMID_DS_STRUC.sem_perm.__key,                 dq 0     
          at SEMID_DS_STRUC.sem_perm.uid,                   dd 0
          at SEMID_DS_STRUC.sem_perm.gid,                   dd 0
          at SEMID_DS_STRUC.sem_perm.cuid,                  dd 0
          at SEMID_DS_STRUC.sem_perm.cgid,                  dd 0
          at SEMID_DS_STRUC.sem_perm.mode,                  dw 0
          at SEMID_DS_STRUC.sem_perm.__pad1,                dw 0
          at SEMID_DS_STRUC.sem_perm.__seq,                 dw 0
          at SEMID_DS_STRUC.sem_perm.__pad2,                dw 0
          at SEMID_DS_STRUC.sem_perm.__glibc_reserved1,     dq 0
          at SEMID_DS_STRUC.sem_perm.__glibc_reserved2,     dq 0
          at SEMID_DS_STRUC.sem_otime,                      dq 0
          at SEMID_DS_STRUC.__glibc_reserved1,              dq 0
          at SEMID_DS_STRUC.sem_ctime,                      dq 0
          at SEMID_DS_STRUC.__glibc_reserved2,              dq 0
          at SEMID_DS_STRUC.sem_nsems,                      dd 0
          at SEMID_DS_STRUC.__glibc_reserved3,              dq 0
          at SEMID_DS_STRUC.__glibc_reserved4,              dq 0
     IEND  

          ; definition macro's for SEMID_DS structure
          
     %define %1.sem_perm.__key               %1+SEMID_DS_STRUC.sem_perm.__key
     %define %1.sem_perm.uid                 %1+SEMID_DS_STRUC.sem_perm.uid
     %define %1.sem_perm.gid                 %1+SEMID_DS_STRUC.sem_perm.gid
     %define %1.sem_perm.cuid                %1+SEMID_DS_STRUC.sem_perm.cuid
     %define %1.sem_perm.cgid                %1+SEMID_DS_STRUC.sem_perm.cgid
     %define %1.sem_perm.mode                %1+SEMID_DS_STRUC.sem_perm.mode
     %define %1.sem_perm.__pad1              %1+SEMID_DS_STRUC.sem_perm.__pad1
     %define %1.sem_perm.__seq               %1+SEMID_DS_STRUC.sem_perm.__seq
     %define %1.sem_perm.__pad2              %1+SEMID_DS_STRUC.sem_perm.__pad2
     %define %1.sem_perm.__glibc_reserved1   %1+SEMID_DS_STRUC.sem_perm.__glibc_reserved1
     %define %1.sem_perm.__glibc_reserved2   %1+SEMID_DS_STRUC.sem_perm.__glibc_reserved2
     %define %1.sem_otime                    %1+SEMID_DS_STRUC.sem_otime
     %define %1.__glibc_reserved1            %1+SEMID_DS_STRUC.__glibc_reserved1
     %define %1.sem_ctime                    %1+SEMID_DS_STRUC.sem_ctime
     %define %1.__glibc_reserved2            %1+SEMID_DS_STRUC.__glibc_reserved2
     %define %1.sem_nsems                    %1+SEMID_DS_STRUC.sem_nsems
     %define %1.__glibc_reserved3            %1+SEMID_DS_STRUC.__glibc_reserved3
     %define %1.__glibc_reserved4            %1+SEMID_DS_STRUC.__glibc_reserved4
          
     %endmacro

     ; ipcs ctl cmds
     %define SEM_STAT                       18
     %define SEM_INFO                       19

     STRUC SEMINFO_STRUC
          .semmap:        resd      1
          .semmni:        resd      1
          .semmns:        resd      1
          .semmnu:        resd      1
          .semmsl:        resd      1
          .semopm:        resd      1
          .semume:        resd      1
          .semusz:        resd      1
          .semvmx:        resd      1
          .semaem:        resd      1
     ENDSTRUC

     %macro SEM_INFO 1
          %1: 
          ISTRUC SEMINFO_STRUC
               at   SEMINFO_STRUC.semmap,         dd   0
               at   SEMINFO_STRUC.semmni,         dd   0
               at   SEMINFO_STRUC.semmns,         dd   0
               at   SEMINFO_STRUC.semmnu,         dd   0
               at   SEMINFO_STRUC.semmls,         dd   0
               at   SEMINFO_STRUC.semopm,         dd   0
               at   SEMINFO_STRUC.semume,         dd   0
               at   SEMINFO_STRUC.semusz,         dd   0
               at   SEMINFO_STRUC.semvmx,         dd   0
               at   SEMINFO_STRUC.semaem,         dd   0
          IEND

          %define %1.semmap      %1+SEMINFO_STRUC.semmap
          %define %1.semmni      %1+SEMINFO_STRUC.semmni
          %define %1.semmns      %1+SEMINFO_STRUC.semmns
          %define %1.semmnu      %1+SEMINFO_STRUC.semmnu
          %define %1.semmls      %1+SEMINFO_STRUC.semmls
          %define %1.semopm      %1+SEMINFO_STRUC.semopm
          %define %1.semume      %1+SEMINFO_STRUC.semume
          %define %1.semusz      %1+SEMINFO_STRUC.semusz
          %define %1.semvmx      %1+SEMINFO_STRUC.semvmx
          %define %1.semaem      %1+SEMINFO_STRUC.semaem

     %endmacro

     ; Structure used for argument to `semop' to describe operations.

     STRUC SEMBUF_STRUC
          .sem_num:      resw      1
          .sem_op:       resw      1
          .sem_flg:      resw      1
     ENDSTRUC

     %macro SEM_BUF 1
          %1:
          ISTRUC SEMBUF_STRUC
               at   SEMBUF_STRUC.sem_num,         dw   0
               at   SEMBUF_STRUC.sem_op,          dw   0
               at   SEMBUF_STRUC.sem_flg,         dw   0
          IEND

          %define %1.sem_num       %1+SEMBUF_STRUC.sem_num
          %define %1.sem_op        %1+SEMBUF_STRUC.sem_op
          %define %1.sem_flg       %1+SEMBUF_STRUC.sem_flg
     %endmacro
     
     STRUC SEM_UNION_STRUC
          .val:       resd    1        ;value for SETVAL
          .buf:       resb    140      ;buffer for IPC_STAT & IPC_SET (sizeof SEMID_DS_STRUC)
          .array:     resd    1        ;array for GETALL & SETALL
          .__buf:     resb    40       ;buffer for IPC_INFO (sizeof SEMINFO_STRUC)
     ENDSTRUC

     %macro SEM_UNION 1
          %1: 
          ISTRUC SEM_UNION_STRUC
               at SEM_UNION_STRUC.val,       dd  0
               at SEM_UNION_STRUC.buf,       times 140 db 0
               at SEM_UNION_STRUC.array,     dd  0
               at SEM_UNION_STRUC.__buf,     times 40 db 0     
          IEND
    
          %define %1.val    %1+SEM_UNION_STRUC.val
          %define %1.buf    %1+SEM_UNION_STRUC.buf
          %define %1.array  %1+SEM_UNION_STRUC.array
          %define %1.__buf  %1+SEM_UNION_STRUC.__buf
     %endmacro

%endif    ; _ASM_SYS_SEM_INC_
