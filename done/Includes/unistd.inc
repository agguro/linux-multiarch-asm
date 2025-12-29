%ifndef _ASM_UNISTD_INC_
%define _ASM_UNISTD_INC_

%if __BITS__ == 32
   %warning "using 32 bits syscalls"
   %include "unistd32.inc"
%elif __BITS__ == 64
   %include "unistd64.inc"
   %include "obsolete_syscalls.inc"          ; this file will be removed once all examples are updated
%endif
   %define stdin   0
   %define stdout  1
   %define stderr  2
   %define true    1
   %define false   0
   %define STDIN   stdin         ; just in case someone likes the uppercase version
   %define STDOUT  stdout        ; just in case someone likes the uppercase version
   %define STDERR  stderr        ; just in case someone likes the uppercase version
   %define TRUE    true
   %define FALSE   false

%endif   ; _ASM_UNISTD_INC_