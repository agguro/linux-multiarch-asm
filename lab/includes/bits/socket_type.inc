%ifndef _ASM_BITS_SOCKET_TYPE_INC_
%define _ASM_BITS_SOCKET_TYPE_INC_

    %define    SOCK_STREAM       1            ; Sequenced, reliable, connection-based byte streams.
    %define    SOCK_DGRAM        2            ; Connectionless, unreliable datagrams of fixed maximum length.
    %define    SOCK_RAW          3            ; Raw protocol interface.
    %define    SOCK_RDM          4            ; Reliably-delivered messages.
    %define    SOCK_SEQPACKET    5            ; Sequenced, reliable, connection-based, datagrams of fixed maximum length.
    %define    SOCK_DCCP         6            ; Datagram Congestion Control Protocol.
    %define    SOCK_PACKET      10            ; Linux specific way of getting packets at the dev level.  For writing rarp and other similar things on the user level.

;Flags to be ORed into the type parameter of socket and socketpair and used for the flags parameter of paccept.

%define    SOCK_CLOEXEC         0x02000000    ; Atomically set close-on-exec flag for the new descriptor(s).
%define    SOCK_NONBLOCK        0x00004000    ; Atomically mark descriptor(s) as non-blocking.
  
%endif ;_ASM_BITS_SOCKET_TYPE_INC_
