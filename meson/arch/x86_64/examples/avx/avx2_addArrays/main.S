/*
 * main.S - Fully PIE compliant (Position Independent Executable)
 */

.section .rodata
    .align 32
array1:
    .float 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0

    .align 32
array2:
    .float 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0

fmt_str:
    .asciz "%f\t"
newline:
    .asciz "\n"

.section .bss
    .align 32
dest:
    .skip 32

.text
.globl main
.extern avx2_addArrays
.extern printf

main:
    # --- Stack Setup ---
    push %rbp
    mov %rsp, %rbp
    push %rbx
    push %r12
    sub $8, %rsp      # Alignment fix

    # ==========================================
    # STEP 1: Call avx2_addArrays
    # ==========================================
    
    # RIP-relative addressing is THE secret to PIE.
    # This works regardless of where the code is loaded into memory.
    lea dest(%rip),   %rdi
    lea array1(%rip), %rsi
    lea array2(%rip), %rdx
    
    # Since avx2_addArrays is inside our own binary (statically linked via .o files),
    # a standard 'call' is usually sufficient.
    call avx2_addArrays

    # ==========================================
    # STEP 2: Print Loop
    # ==========================================
    
    xor %rbx, %rbx
    lea dest(%rip), %r12

loop_start:
    cmp $8, %rbx
    je loop_end

    movss (%r12, %rbx, 4), %xmm0
    cvtss2sd %xmm0, %xmm0

    lea fmt_str(%rip), %rdi
    mov $1, %rax
    
    # [NOTE] Use @PLT for external library calls!
    # This is essential for PIE when the linker is strict.
    call printf@PLT

    inc %rbx
    jmp loop_start

loop_end:
    lea newline(%rip), %rdi
    xor %rax, %rax
    
    # [NOTE] Use @PLT here as well
    call printf@PLT

    # Exit
    add $8, %rsp
    pop %r12
    pop %rbx
    xor %rax, %rax
    leave
    ret
    
    # Extra security for the stack in modern Linux (prevents executable stack warnings)
    .section .note.GNU-stack,"",@progbits
