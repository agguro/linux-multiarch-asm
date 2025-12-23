#ifndef CLASS_CIRCLE_S
#define CLASS_CIRCLE_S 1

#include "shape.S"

CLASS Circle
    EXTENDS Shape, Circle
    FIELD Circle, radius, 8
ENDCLASS

# --- DATA SECTION ---
.section .rodata
msg_draw: .asciz ">>> Hello! I am a Circle and I am being drawn!\n"

.text
# --- DESTRUCTOR ---
.globl Circle_destroy
Circle_destroy:
    ret

# --- DRAW METHOD ---
.globl Circle_draw
Circle_draw:
    # 1. Setup stack frame (ABI requirement)
    push %rbp
    mov %rsp, %rbp
    
    # 2. Prepare printf
    # RDI = Format string (First argument)
    leaq msg_draw(%rip), %rdi
    
    # AL = 0 (Number of vector registers used, required for varargs functions like printf)
    xor %rax, %rax
    
    # 3. Call C function
    call printf
    
    # 4. Teardown stack frame and return
    leave
    ret

VTABLE Circle
    VFUNC Circle_destroy
    VFUNC Circle_draw
ENDVTABLE

#endif
