/* object.s - Universal Base Class for OOP in x86-64 Assembly (ABI Compliant) */

/* --- Virtual Function Index Definitions --- */
.set V_DTOR, 0     /* Index 0: The Destructor (Offset 8) */
.set V_TOSTRING, 1 /* Index 1: The toString method (Offset 16) */

/* --- Data Section (Object Size) --- */
.section .data
.globl Object_size
.align 8
Object_size:
    .quad 8  /* Size: 8 bytes (only the VPtr) */


/* --- Read-Only Data Section (VTable) --- */
.section .rodata
.globl Object_vtable
.align 8
Object_vtable:
    /* VTable Layout: [RTTI Ptr: 0] [DTOR: 8] [TOSTRING: 16] */
    
    /* 0 bytes: RTTI Pointer */
    .quad 0                
    
    /* 8 bytes: Destructor, using @GOT for PIE-safe relocation */
    .quad Object___dtor@GOT  
    
    /* 16 bytes: toString method, using @GOT for PIE-safe relocation */
    .quad Object_toString@GOT  

/* --- Text Section (Code) --- */
.section .text

/* External functions from the C library (ABI) */
.extern malloc
.extern free

/* -------------------------------------------
 * Object_toString: Virtual Method (Index 1)
 * -------------------------------------------
 * Arg 1: 'this' pointer in %rdi
 * Returns: Pointer to string in %rax (NULL for now)
 */
.globl Object_toString
Object_toString:
    mov $0, %rax
    ret 

/* -------------------------------------------
 * Object___dtor: Virtual Destructor (Index 0)
 * -------------------------------------------
 * Arg 1: 'this' pointer in %rdi
 */
.globl Object___dtor
Object___dtor:
    ret 

/* -------------------------------------------
 * Object_new: Constructor (Factory)
 * -------------------------------------------
 * Returns: Object pointer in %rax
 */
.globl Object_new
Object_new:
    /* 1. Allocate memory based on Object_size */
    mov Object_size@GOTPCREL(%rip), %r11
    mov (%r11), %rdi                   
    call malloc@PLT  
    
    /* 2. Initialize the VPtr */
    leaq Object_vtable(%rip), %r11
    mov %r11, (%rax)
    
    ret

/* -------------------------------------------
 * Object_delete: Deallocator (Calls Virtual Destructor + free)
 * -------------------------------------------
 * Arg 1: Object pointer in %rdi
 */
.globl Object_delete
Object_delete:
    /* 1. Null check */
    cmp $0, %rdi
    je .Ldelete_done
    
    /* 2. VCall the virtual destructor (Index 0, Offset 8) */
    push %rdi        
    
    mov (%rdi), %r11 
    mov 8(%r11), %rax 
    
    call *%rax      
    
    /* 3. Call free */
    pop %rdi         
    call free@PLT

.Ldelete_done:
    ret


/* -------------------------------------------
 * Object_vcall_toString: VCall Helper (Index 1)
 * -------------------------------------------
 * Arg 1: Object pointer in %rdi
 * Returns: string pointer in %rax
 */
.globl Object_vcall_toString
Object_vcall_toString:
    /* 1. Load VTable address to %rax */
    mov (%rdi), %rax  

    /* 2. Load the toString pointer (Index 1, offset 16) to %r11 */
    mov 16(%rax), %r11  
    
    /* 3. Call the function (this is already in %rdi) */
    call *%r11
    
    /* 4. The return value (string pointer) is now in %rax (ABI) */
    mov %r11, %rax
    ret
