%ifndef _ASM_SYS_TERMIOS_INC_
%define _ASM_SYS_TERMIOS_INC_

    ; possible input and output devices for the console

    ;IOCTL values
    %define TCGETS      5401h	; termios instruction to read flags
    %define TCSETS      5402h	; termios instruction to write flags
    %define TIOCGWINSZ  5413h	; winsize

    %define ICANON       2
    %define ECHO         8

    ; *** STRUCTURES ***

    STRUC TERMIOS_STRUC
        .c_iflag:   resd    1   ; input mode flags
        .c_oflag:   resd    1   ; output mode flags
        .c_cflag:   resd    1   ; control mode flags
        .c_lflag:   resd    1   ; local mode flags
        .c_line:    resb    1   ; line discipline
        .c_cc:      resb    19  ; control characters
    ENDSTRUC

    STRUC WINSIZE_STRUC
        .rows:      resq    1
        .cols:      resq    1
        .xpixels:   resq    1       ; not used
        .ypixels:   resq    1       ; not used
    ENDSTRUC

    ; *** MACROS ***

    %macro TERMIOS 1
        %1: ISTRUC TERMIOS_STRUC
            at TERMIOS_STRUC.c_iflag, dd 0
            at TERMIOS_STRUC.c_oflag, dd 0
            at TERMIOS_STRUC.c_cflag, dd 0
            at TERMIOS_STRUC.c_lflag, dd 0
            at TERMIOS_STRUC.c_line,  db 0
            at TERMIOS_STRUC.c_cc,    times 19 db 0
        IEND
        %define %1.c_iflag %1+TERMIOS_STRUC.c_iflag
        %define %1.c_oflag %1+TERMIOS_STRUC.c_oflag
        %define %1.c_cflag %1+TERMIOS_STRUC.c_cflag
        %define %1.c_lflag %1+TERMIOS_STRUC.c_lflag
        %define %1.c_line %1+TERMIOS_STRUC.c_line
        %define %1.c_cc %1+TERMIOS_STRUC.c_cc
    %endmacro

    %macro WINSIZE 1
        %1: ISTRUC WINSIZE_STRUC
                at WINSIZE_STRUC.rows,    dq 0
                at WINSIZE_STRUC.cols,    dq 0
                at WINSIZE_STRUC.xpixels, dq 0
                at WINSIZE_STRUC.ypixels, dq 0
            IEND
        %define %1.rows     %1+WINSIZE_STRUC.rows
        %define %1.cols     %1+WINSIZE_STRUC.cols
        %define %1.xpixels  %1+WINSIZE_STRUC.xpixels
        %define %1.ypixels  %1+WINSIZE_STRUC.ypixels 
    %endmacro

%endif  ; _ASM_SYS_TERMIOS_INC_