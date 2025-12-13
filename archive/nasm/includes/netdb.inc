%ifndef __NETDB_INC
%define __NETDB_INC   1

struc STRUC_HOSTENT
   .h_name:         resq 1      ; official name of host.
   .h_aliases:      resq 1      ; Alias list.
   .h_addrtype:     resd 1      ; host address type.
   .h_length:       resd 1      ; Length of address.
   .h_addr_list:    resq 1      ; List of addresses from name server.
endstruc

; HOSTENT takes one mandatory parameter %1 which is the name of the data structure.

%macro HOSTENT 1
    %1:  istruc STRUC_HOSTENT
        at  STRUC_HOSTENT.h_name,       dq 0
        at  STRUC_HOSTENT.h_aliases,    dq 0
        at  STRUC_HOSTENT.h_addrtype,   dd 0
        at  STRUC_HOSTENT.h_length,     dd 0
        at  STRUC_HOSTENT.h_addr_list,  dq 0
        iend

    %define %1.h_name       %1+STRUC_HOSTENT.h_name
    %define %1.h_aliases    %1+STRUC_HOSTENT.h_aliases
    %define %1.h_addrtype   %1+STRUC_HOSTENT.h_addrtype
    %define %1.h_length     %1+STRUC_HOSTENT.h_length
    %define %1.h_addr_list  %1+STRUC_HOSTENT.h_addr_list

%endmacro

%endif ; __NETDB_INC
