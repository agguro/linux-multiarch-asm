%ifndef _ASM_SYS_IPC_INC_
%define _ASM_SYS_IPC_INC_

; Mode bits for `msgget', `semget', and `shmget'.
%define IPC_CREAT   0x200    ; Create key if key does not exist.
%define IPC_EXCL    0x400    ; Fail if key exists.
%define IPC_NOWAIT  0x1000   ; Return error on wait.

; Control commands for `msgctl', `semctl', and `shmctl'.
%define IPC_RMID    0        ; Remove identifier.
%define IPC_SET     1        ; Set `ipc_perm' options.
%define IPC_STAT    2        ; Get `ipc_perm' options.
%define IPC_INFO    3        ; See ipcs.
; Special key values.
%define IPC_PRIVATE 0        ; Private key.

; Data structure used to pass permission information to IPC operations.

STRUC IPC_PERM_STRUC
    .__key:             resq     1    ; Key.
    .uid:               resd     1    ; Owner's user ID.
    .gid:               resd     1    ; Owner's group ID.
    .cuid:              resd     1    ; Creator's user ID.
    .cgid:              resd     1    ; Creator's group ID.
    .mode:              resw     1    ; Read/write permission.
    .__pad1:            resw     1
    .__seq:             resw     1    ; Sequence number.
    .__pad2:            resw     1
    .__glibc_reserved1: resq     1
    .__glibc_reserved2: resq     1
ENDSTRUC

%macro IPC_PERM 1
    %1: 
    ISTRUC IPC_PERM_STRUC
    at IPC_PERM_STRUC.__key,                dq 0
    at IPC_PERM_STRUC.uid,                  dd 0
    at IPC_PERM_STRUC.gid,                  dd 0
    at IPC_PERM_STRUC.cuid,                 dd 0
    at IPC_PERM_STRUC.cgid,                 dd 0
    at IPC_PERM_STRUC.mode,                 dw 0
    at IPC_PERM_STRUC._pad1,                dw 0
    at IPC_PERM_STRUC.__seg,                dw 0
    at IPC_PERM_STRUC._pad2,                dw 0
    at IPC_PERM_STRUC.__glibc_reserved1,    dq 0
    at IPC_PERM_STRUC.__glibc_reserved2,    dq 0
    
    IEND  

    ; definition macro's for IPC_PERM structure
    ; !! warn: Leave commented lines commented, they are here to be complete. If in the future some of these fields will be used.
    
    %define %1.__key              %1+IPC_PERM_STRUC.__key
    %define %1.uid                %1+IPC_PERM_STRUC.uid
    %define %1.gid                %1+IPC_PERM_STRUC.gid
    %define %1.cuid               %1+IPC_PERM_STRUC.cuid
    %define %1.cgid               %1+IPC_PERM_STRUC.cgid
    %define %1.mode               %1+IPC_PERM_STRUC.mode
    %define %1._pad1              %1+IPC_PERM_STRUC.__pad1
    %define %1._seg               %1+IPC_PERM_STRUC._seg
    %define %1._pad2              %1+IPC_PERM_STRUC.__pad2
    %define %1.__glibc_reserved1  %1+IPC_PERM_STRUC.__glibc_reserved1
    %define %1.__glibc_reserved2  %1+IPC_PERM_STRUC.__glibc_reserved2
    
%endmacro

%endif    ; _ASM_SYS_IPC_INC_