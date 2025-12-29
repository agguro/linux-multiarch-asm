%ifndef _ASM_SYS_TIME_INC_
%define _ASM_SYS_TIME_INC_ 1

    %define CLOCK_REALTIME 0

    STRUC STRUC_TIMESPEC
        .tv_sec:      resq    1
        .tv_nsec:     resq    1
    ENDSTRUC

    STRUC STRUC_TIMEVAL
        .tv_sec:      resq    1               ; seconds
        .tv_usec:     resq    1               ; microseconds
    ENDSTRUC

    STRUC STRUC_TIMEZONE
        .tz_minuteswest:      resq    1               ; minutes west of Greenwich
        .tz_dsttime:          resq    1               ; type of DST correction
    ENDSTRUC


    ; TIMESPEC takes one mandatory parameter %1 which is the name of the data structure.
    ; The second and third refers to secs and nanosecs respectively and aren't mandatory.
    ; When no value is given for seconds and/or nanoseconds they defaults to zero.
    %macro TIMESPEC 1-3 0,0
        %1:  ISTRUC STRUC_TIMESPEC
            at  STRUC_TIMESPEC.tv_sec,     dq %2
            at  STRUC_TIMESPEC.tv_nsec,    dq %3
        IEND
       
        %define %1.tv_sec   %1+STRUC_TIMESPEC.tv_sec
        %define %1.tv_nsec  %1+STRUC_TIMESPEC.tv_nsec
        %define %1.size     %1+STRUC_TIMESPEC_size
    %endmacro

    ; TIMEVAL takes one mandatory parameter %1 which is the name of the data structure.
    ; The second and third refers to secs and microsecs respectively and aren't mandatory.
    ; When no value is given for seconds and/or nanoseconds they defaults to zero.
    %macro TIMEVAL 1-3 0,0
        %1:  istruc STRUC_TIMEVAL
            at  STRUC_TIMEVAL.tv_sec,     dq %2
            at  STRUC_TIMEVAL.tv_usec,    dq %3
        IEND
       
        %define %1.tv_sec   %1+STRUC_TIMEVAL.tv_sec
        %define %1.tv_usec  %1+STRUC_TIMEVAL.tv_usec
        %define %1.size     %1+STRUC_TIMEVAL_size
    %endmacro

    ; TIMEZONE takes one mandatory parameter %1 which is the name of the data structure.
    ; The second and third refers to minuteswest and dsttime respectively and aren't mandatory.
    ; When no value is given for minuteswest and/or dsttime they defaults to zero.
    %macro TIMEZONE 1-3 0,0
        %1:  ISTRUC STRUC_TIMEZONE
            at  STRUC_TIMEZONE.tz_minuteswest,     dq %2
            at  STRUC_TIMEZONE.tz_dsttime,         dq %3
        IEND
       
        %define %1.tz_minuteswest   %1+STRUC_TIMEZONE.tz_minuteswest
        %define %1.tz_dsttime       %1+STRUC_TIMEZONE.tz_dsttime
        %define %1.size             %1+STRUC_TIMEZONE_size
    %endmacro

%endif	; _ASM_SYS_TIME_INC_
