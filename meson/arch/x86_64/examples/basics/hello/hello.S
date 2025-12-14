#include "syscalls.h"

.section .data
msg:    .asciz "Hello World\n"
.equ    len, . - msg

.text
.globl _start
_start:

    _syscall $__NR_write, $STDOUT, msg, $len
    
/* EXPANDS AS:
*  $0x1,%rdi
*  lea    0xff2(%rip),%rsi        # 402000 <msg>
*  mov    $0xd,%rdx
*  mov    $0x1,%rax
*  syscall
*/  
    _syscall $__NR_exit, $0

/* EXPANDS AS:
*  xor    %rdi,%rdi
*  mov    $0x3c,%rax
*  syscall
*/
