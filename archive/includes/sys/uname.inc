%ifndef _ASM_SYS_UNAME_INC_
%define _ASM_SYS_UNAME_INC_

;the use of the macro is fairly simple:
;
;section .data
;    UNAME  name               ;define a pointer to the UNAME macro with 'name'
;
;section .code
;
;name.sysname       ;address of sysname entry in the structure
;name.nodename      ;address of nodename entry in the structure
;name.release       ;address of release entry in the structure
;name.version       ;address of version entry in the structure
;name.machine       ;address of machine entry in the structure
;
;each of maximum _UTSNAME_LENGTH length

%include "bits/uname.inc"               ;length of the entries in `struct utsname'
    
;definitions from sys/utsname.h
    %define _UTSNAME_SYSNAME_LENGTH _UTSNAME_LENGTH
    %define _UTSNAME_NODENAME_LENGTH _UTSNAME_LENGTH
    %define _UTSNAME_RELEASE_LENGTH _UTSNAME_LENGTH
    %define _UTSNAME_VERSION_LENGTH _UTSNAME_LENGTH
    %define _UTSNAME_MACHINE_LENGTH _UTSNAME_LENGTH

    STRUC STRUC_UTSNAME
        .sysname:   resb    _UTSNAME_SYSNAME_LENGTH
        .nodename:  resb    _UTSNAME_NODENAME_LENGTH
        .release:   resb    _UTSNAME_RELEASE_LENGTH
        .version:   resb    _UTSNAME_VERSION_LENGTH
        .machine:   resb    _UTSNAME_MACHINE_LENGTH
    ENDSTRUC

%macro UTSNAME 1
	%1:  ISTRUC STRUC_UTSNAME
		at  STRUC_UTSNAME.sysname,     times _UTSNAME_SYSNAME_LENGTH db 0
		at  STRUC_UTSNAME.nodename,    times _UTSNAME_NODENAME_LENGTH db 0
        at  STRUC_UTSNAME.release,     times _UTSNAME_RELEASE_LENGTH db 0
        at  STRUC_UTSNAME.version,     times _UTSNAME_VERSION_LENGTH db 0
        at  STRUC_UTSNAME.machine,     times _UTSNAME_MACHINE_LENGTH db 0
	IEND
	
	%define %1.sysname   %1+STRUC_UTSNAME.sysname
	%define %1.nodename  %1+STRUC_UTSNAME.nodename
	%define %1.release   %1+STRUC_UTSNAME.release
	%define %1.version  %1+STRUC_UTSNAME.version
	%define %1.machine  %1+STRUC_UTSNAME.machine
	%define %1.size     %1+STRUC_UTSNAME_size
%endmacro    

%endif  ; _ASM_SYS_UNAME_INC_