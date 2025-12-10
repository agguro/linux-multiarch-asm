#include <asm/unistd.h>

.data
msg: .asciiz "Hello from MIPS\n"
len =   . - msg

.text
.globl __start

__start:
    # write(1, msg, len)
    li      $v0, __NR_write      # Syscall constante uit header
    li      $a0, 1
    la      $a1, msg
    li      $a2, len
    syscall

    # exit(0)
    li      $v0, __NR_exit
    li      $a0, 0
    syscall
