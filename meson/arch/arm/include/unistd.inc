%ifndef _ASM_UNISTD_INC_
%define _ASM_UNISTD_INC_
   
   %include "asm-generic/unistd64.inc"

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
