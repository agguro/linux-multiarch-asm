#include "syscalls.h"

.section .data
msg:    .asciz "Hello World\n"
.equ    len, . - msg

.text
.globl _start
_start:

    _syscall write, $stdout, msg, $len
    
    _syscall exit, $0

