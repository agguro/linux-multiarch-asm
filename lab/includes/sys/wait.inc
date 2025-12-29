%ifndef _ASM_SYS_WAIT_INC_
%define _ASM_SYS_WAIT_INC_

    %define P_ALL           0               ; Wait for any child.  */
    %define P_PID           1               ; Wait for specified process.
    %define P_PGID          2               ; Wait for members of process group.
    %define WNOHANG         1               ; Don't block waiting.
    %define WUNTRACED       2               ; Report status of stopped children.

    ; Bits in the fourth argument to `waitid'.
    %define WSTOPPED        2               ; Report stopped child (same as WUNTRACED).
    %define WEXITED         4               ; Report dead child.
    %define WCONTINUED      8               ; Report continued child.
    %define WNOWAIT         0x01000000      ; Don't reap, just poll status.
    %define __WNOTHREAD     0x20000000      ; Don't wait on children of other threads in this group
    %define __WALL          0x40000000      ; Wait for any child.
    %define __WCLONE        0x80000000      ; Wait for cloned process.

    %define W_CONTINUED           0xffff
    %define WCOREFLAG             0x80

    %macro WEXITSTATUS 2
        ; example WEXITSTATUS rax, status will expand to
        ; mov  rax, QWORD[status]
        ; and  rax, 0xFF00
        ; shr  rax, 8
        mov     %1, %2
        and     %1, 0xFF00
        shr     %1, 8
    %endmacro    

    ; macros from C bits/waitstatus.h
    ; not yet implemented

    ;/* If WIFSIGNALED(STATUS), the terminating signal.  */
    ;%define WTERMSIG(status)      ((status) & 0x7f)

    ;/* If WIFSTOPPED(STATUS), the signal that stopped the child.  */
    ;%define WSTOPSIG(status)      __WEXITSTATUS(status)

    ;/* Nonzero if STATUS indicates normal termination.  */
    ;%define WIFEXITED(status)     (__WTERMSIG(status) == 0)

    ;/* Nonzero if STATUS indicates termination by a signal.  */
    ;%define WIFSIGNALED(status) \
    ;  (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)

    ;/* Nonzero if STATUS indicates the child is stopped.  */
    ;%define WIFSTOPPED(status)    (((status) & 0xff) == 0x7f)

    ;/* Nonzero if STATUS indicates the child continued after a stop.  We only
    ;   define this if <bits/waitflags.h> provides the WCONTINUED flag bit.  */
    ;#ifdef WCONTINUED
    ;# define __WIFCONTINUED(status) ((status) == __W_CONTINUED)
    ;#endif

    ;/* Nonzero if STATUS indicates the child dumped core.  */
    ;%define WCOREDUMP(status)     ((status) & __WCOREFLAG)

    ;/* Macros for constructing status values.  */
    ;%define W_EXITCODE(ret, sig)  ((ret) << 8 | (sig))
    ;%define W_STOPCODE(sig)       ((sig) << 8 | 0x7f)

%endif  ; _ASM_SYS_WAIT_INC_