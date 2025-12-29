#ifndef CLASS_SHAPE_S
#define CLASS_SHAPE_S 1

CLASS Shape
    FIELD Shape, x, 8
    FIELD Shape, y, 8
ENDCLASS

# --- DATA VOOR PRINTF ---
.section .rodata
msg_shape: .asciz ">>> I am just a generic Shape.\n"

.text

# --- DESTRUCTOR ---
.globl Shape_destroy
Shape_destroy:
    ret

# --- DRAW METHODE ---
.globl Shape_draw
Shape_draw:
    # 1. Stack setup
    push %rbp
    mov %rsp, %rbp
    
    # 2. Printf
    leaq msg_shape(%rip), %rdi
    xor %rax, %rax
    call printf
    
    # 3. Return
    leave
    ret

VTABLE Shape
    VFUNC Shape_destroy
    VFUNC Shape_draw
ENDVTABLE

#endif
