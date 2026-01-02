/* --------------------------------------------------------------------------
 * name        : u64tohex.s
 * input       : RDI = value, RSI = start of buffer, RDX = buffer len
 * output      : RAX = 0 (success) or 1 (overflow)
 * RDI = unchanged
 * RSI = pointer to start of hex digits (including 0x)
 * RDX = actual length (including 0x)
 * -------------------------------------------------------------------------- */
.section .text
.globl u64tohex
.type u64tohex, @function

u64tohex:
    pushq   %rbp            
    movq    %rsp, %rbp      

    leaq    (%rsi, %rdx), %rcx      # End of buffer
    movq    %rcx, %r9               # Save for length math
    movq    %rdi, %rax              

    # --- Main Hex Loop ---
1:
    decq    %rcx
    cmpq    %rsi, %rcx              
    jl      3f                      

    movq    %rax, %r8
    andq    $0xF, %r8               

    cmpb    $10, %r8b
    jl      2f                      
    addb    $('A' - 10), %r8b       
    jmp     4f                      

2:
    addb    $'0', %r8b              

4:
    movb    %r8b, (%rcx)            
    shrq    $4, %rax
    jnz     1b                      

    # --- Add "0x" Prefix ---
    # We need 2 more bytes available in the buffer
    subq    $2, %rcx
    cmpq    %rsi, %rcx
    jl      3f                      # If no room for "0x", trigger overflow

    movb    $'0', (%rcx)            # Store '0'
    movb    $'x', 1(%rcx)           # Store 'x' at next byte

    # --- Success Exit ---
    movq    %r9, %rdx
    subq    %rcx, %rdx              # Length now includes 2 bytes for 0x
    movq    %rcx, %rsi              # RSI now points to '0' of "0x..."
    xorq    %rax, %rax              
    popq    %rbp                    
    ret

3:
    movq    $1, %rax                
    popq    %rbp                    
    ret

.section .note.GNU-stack,"",@progbits
