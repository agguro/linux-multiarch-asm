#ifndef OOP_CLASS_H
#define OOP_CLASS_H 1

# --- CLASS ---
# Alleen grootte instellen, GEEN labels aanmaken!
# Het label wordt pas gemaakt door VTABLE.
.macro CLASS name
    .set \name\().size, PTR_SIZE
.endm

# --- FIELD ---
.macro FIELD class, field, size
    .set \class\().\field, \class\().size
    .set \class\().size, \class\().size + \size
.endm

# --- EXTENDS ---
.macro EXTENDS parent, child
    .set \child\().size, \parent\().size
.endm

# --- ENDCLASS ---
.macro ENDCLASS
    # Placeholder
.endm

# --- METHOD ---
# Deze mag blijven, die voegt alleen pointers toe aan de VTABLE sectie
.macro METHOD class, index, label
    .pushsection .rodata
        .quad \label
    .popsection
.endm

#endif
