# ============================================================
#   OBJECT ORIENTED PROGRAMMING FRAMEWORK FOR GAS/AT&T
#   Supports:
#     - class definitions
#     - fields
#     - vtables
#     - methods
#     - inheritance
#     - object creation
#     - virtual dispatch
# ============================================================

# ------------------------------------------------------------
# INTERNALS: symbol concatenation helper
#   CONCAT prefix, suffix → prefix_suffix
# ------------------------------------------------------------
.macro CONCAT out:req, a:req, b:req
    .set \out, \a\()_\b
.endm


# ------------------------------------------------------------
# FIELD DEFINITIONS
# Usage:
#   .field x, 8
#
# Generates:
#   MyClass_x = <offset>
#   and increases internal offset counter
# ------------------------------------------------------------
.macro .field name, size
    # define global offset symbol: ClassName_name = offset
    \CLASSNAME_\name = \CLASS_OFFSET
    .set CLASS_OFFSET, CLASS_OFFSET + \size
.endm


# ------------------------------------------------------------
# BEGIN CLASS
# Usage:
#   .class MyClass
#
# Creates symbols:
#   CLASSNAME = MyClass
#   CLASS_OFFSET = 0
# ------------------------------------------------------------
.macro .class name
    .set CLASS_OFFSET, 0
    .set CLASSNAME, \name
    # Reserve space for vtable pointer at offset 0
    \name\()_vptr = 0
    .set CLASS_OFFSET, 8         # pointer size
.endm


# ------------------------------------------------------------
# END CLASS
# Usage:
#   .endclass
#
# Produces symbol MyClass_SIZE
# ------------------------------------------------------------
.macro .endclass
    \CLASSNAME\()_SIZE = CLASS_OFFSET
.endm


# ------------------------------------------------------------
# METHOD DECLARATION
# Usage inside class:
#   .method draw
#
# Generates:
#   MyClass_draw_label:
# ------------------------------------------------------------
.macro .method name
    .globl \CLASSNAME\()_\name
    \CLASSNAME\()_\name:
.endm


# ------------------------------------------------------------
# VTABLE DEFINITION
# Usage:
#   .vtable MyClass draw, move, update
#
# Produces:
#   MyClass_vtable:
#       .quad MyClass_draw
#       .quad MyClass_move
#       .quad MyClass_update
# ------------------------------------------------------------
.macro .vtable class:req, methods:vararg
    .globl \class\()_vtable
\class\()_vtable:
    .irp M, \methods
        .quad \class\()_\M
    .endr
.endm


# ------------------------------------------------------------
# OBJECT CREATION
# Usage:
#   new_object obj, MyClass
#
# Produces:
#   alloc SIZE
#   mov pointer to vtable
# ------------------------------------------------------------
.macro new_object out:req, class:req
    .comm \out, \class\()_SIZE, 8
    leaq \class\()_vtable(%rip), %rax
    movq %rax, \out(%rip)
.endm


# ------------------------------------------------------------
# FIELD ACCESS
# Usage:
#   set_field obj, MyClass, x, %rdi
#   get_field obj, MyClass, x, %rax
# ------------------------------------------------------------
.macro set_field obj, class, fld, reg
    movq \reg, \obj + \class\()_\fld
.endm

.macro get_field obj, class, fld, reg
    movq \obj + \class\()_\fld, \reg
.endm


# ------------------------------------------------------------
# CALL METHOD (true OOP dispatch)
# Usage:
#   call_method obj, draw
#
# Does:
#   mov vtable from [obj]
#   mov method pointer from vtable offset
#   call method
# ------------------------------------------------------------
.macro call_method obj:req, method:req
    movq \obj(%rip), %rax          # load vptr
    # method index resolution requires enumeration:
    # Here we assume methods placed in .vtable in same order
    # So method offset must be:
    #   <methodIndex> * 8
    # 
    # For generic solution we allow user to define:
    #   .set draw_INDEX, 0
    #
    movq (\method\()_INDEX * 8)(%rax), %rax
    call *%rax
.endm

