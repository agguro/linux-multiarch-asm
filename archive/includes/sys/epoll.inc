%ifndef _ASM_SYS_EPOLL_INC_
%define _ASM_SYS_EPOLL_INC_

    ; Get the platform-dependent flags.
    %define        EPOLL_CLOEXEC = 0x02000000

    ; EPOLL events
    %define        EPOLLIN         0x001
    %define        EPOLLPRI        0x002
    %define        EPOLLOUT        0x004
    %define        EPOLLRDNORM     0x040
    %define        EPOLLRDBAND     0x080
    %define        EPOLLWRNORM     0x100
    %define        EPOLLWRBAND     0x200
    %define        EPOLLMSG        0x400
    %define        EPOLLERR        0x008
    %define        EPOLLHUP        0x010
    %define        EPOLLRDHUP      0x2000
    %define        EPOLLWAKEUP     0x20000000        ; 1u << 29,
    %define        EPOLLONESHOT    0x40000000        ; 1u << 30,
    %define        EPOLLET         0x800000000       ; 1u << 31

    ; Valid opcodes ( "op" parameter ) to issue to epoll_ctl().
    %define EPOLL_CTL_ADD 1        ; Add a file descriptor to the interface.
    %define EPOLL_CTL_DEL 2        ; Remove a file descriptor from the interface.
    %define EPOLL_CTL_MOD 3        ; Change file descriptor epoll_event structure.

%endif	; _ASM_SYS_EPOLL_INC_
