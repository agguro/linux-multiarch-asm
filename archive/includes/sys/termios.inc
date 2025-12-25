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

%endif  ; _ASM_SYS_TERMIOS_INC_
