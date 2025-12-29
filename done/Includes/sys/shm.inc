%ifndef _ASM_SYS_SHM_INC_
%define _ASM_SYS_SHM_INC_

;!! values with leading zero are in octal notation

    ; Permission flag for shmget.
    %define SHM_R           0400        ; or S_IRUGO from <linux/stat.h>
    %define SHM_W           0200        ; or S_IWUGO from <linux/stat.h>

    ; Flags for shmat.
    %define SHM_RDONLY    010000        ; attach read-only else read-write
    %define SHM_RND       020000        ; round attach address to SHMLBA
    %define SHM_REMAP     040000        ; take-over region on attach
    %define SHM_EXEC     0100000        ; execution access

    ; Commands for shmctl.
    %define SHM_LOCK          11        ; lock segment (root only)
    %define SHM_UNLOCK        12        ; unlock segment (root only)

    ; ipcs ctl commands
    %define SHM_STAT          13
    %define SHM_INFO          14

    ; shm_mode upper byte flags
    %define SHM_DEST       01000        ; segment will be destroyed on last detach
    %define SHM_LOCKED     02000        ; segment will not be swapped
    %define SHM_HUGETLB    04000        ; segment is mapped via hugetlb
    %define SHM_NORESERVE 010000        ; don't check for reservations

%endif  ; _ASM_SYS_SHM_INC
