/* * name        : strlen.s
 * description : ABI compliant (rdi=ptr, rax=return), Hacker's Delight logic
 * build       : as --64 -g strlen.s -o strlen.o
 */

.section .text
.globl strlen
.type strlen, @function

strlen:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx
    pushq   %rdi                    # Save start pointer
    
    # Standard ABI: Input is in RDI. 
    # But our loop logic uses RSI/RAX frequently. Let's move it.
    movq    %rdi, %rax              # Use RAX as the moving pointer

    # Load masks locally (keeps the function self-contained)
    movabsq $0x0101010101010101, %r8
    movabsq $0x8080808080808080, %r9

.loop_8:
    movq    (%rax), %rdx            # Load 8 bytes into RDX
    movq    %rdx, %rbx
    
    subq    %r8, %rbx               # (x - 0x01...)
    notq    %rdx                    # ~x
    andq    %rdx, %rbx              # (x - 0x01...) & ~x
    andq    %r9, %rbx               # ... & 0x80...
    
    jnz     .found_null
    addq    $8, %rax
    jmp     .loop_8

.found_null:
    bsfq    %rbx, %rbx              # Find first 0x80 bit
    shrq    $3, %rbx                # Bit index to byte offset
    addq    %rbx, %rax              # RAX now points exactly to the NULL
    
    popq    %rdi                    # Restore start pointer
    subq    %rdi, %rax              # Length = Current - Start
    
    popq    %rbx
    popq    %rbp
    ret
    
.section .note.GNU-stack,"",@progbits
