%ifndef _sharedlib_inc_
%define _sharedlib_inc_       1

extern  _GLOBAL_OFFSET_TABLE_

; five macros to make life a bit easier
; each global function/method/routine (whatever you call it) must start with the PROLOGUE
%macro _prologue 0
        push      rbp 
        mov       rbp,rsp 
        push      rbx 
        call      ._get_got 
    ._get_got: 
        pop       rbx 
        add       rbx,_GLOBAL_OFFSET_TABLE_+$$-._get_got wrt ..gotpc 
%endmacro

; each global function/method/routine (whatever you call it) must end with the EPILOGUE
%macro _epilogue 0
        mov       rbx,[rbp-8] 
        mov       rsp,rbp 
        pop       rbp 
        ret
%endmacro

; macro to initiate and export the global procedure while defining it as a PROCEDURE
; doing so it's harder to forget to export it
%macro procedure 1
    global    %1:function
    %1:
        _prologue
%endmacro

; macro to end the procedure
%macro endp 1
        _epilogue
%endmacro    

; self defined macro to declare global data and export it the same time
%macro _global 3
    global    %1:data (%1.end - %1)
    section   .data
        %1:	%2	%3
        %1.end:
%endmacro
  
%endif
