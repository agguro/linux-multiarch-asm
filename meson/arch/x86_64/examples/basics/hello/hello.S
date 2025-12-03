/* * hello.S - Prints "Hello world!" and exits.
 * This file is processed by the C-Preprocessor first!
 */

/* Include our OWN header file with constants */
#include "unistd.h"

.intel_syntax noprefix
.global _start

.text
_start:
    /* Prachtig schoon! */
    do_syscall write, stdout, offset msg, 15

    do_syscall exit, 0

.data
msg: .asciz "Hello Clean World!\n"
