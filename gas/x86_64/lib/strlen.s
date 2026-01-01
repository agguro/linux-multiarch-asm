/* **************************************************************************
 * name        : strlen.s
 * description : Page-boundary safe Bit-Magic strlen (ABI compliant)
 * ************************************************************************** */

.section .text
.globl strlen
.type strlen, @function

strlen:
    pushq   %rbp            # Save caller's frame pointer
    movq    %rsp, %rbp      # Now RSP is 16-byte aligned (8 for RIP + 8 for RBP)

    # 2. Preserve Callee-Saved Registers
    # Only push these if your function actually changes them
    pushq   %rbx

    movq    %rdi, %rax              # Working pointer

    # --- Step 1: Align to 8-byte boundary ---
    # We must not read 8 bytes if we aren't aligned, or we cross pages.
.align_check:
    testq   $7, %rax                # Check if last 3 bits are 0
    jz      .start_bitmagic
    cmpb    $0, (%rax)              # Safe 1-byte check
    je      .done
    incq    %rax
    jmp     .align_check

    # --- Step 2: Bit-Magic (Safe now as we can't cross a 4k page boundary) ---
.start_bitmagic:
    movabsq $0x0101010101010101, %r8
    movabsq $0x8080808080808080, %r9

.loop_8:
    movq    (%rax), %rdx            # LOAD 8 bytes (Page Safe)
    movq    %rdx, %rbx

    subq    %r8, %rbx               # (x - 0x01...)
    notq    %rdx                    # ~x
    andq    %rdx, %rbx              # (x - 0x01...) & ~x
    andq    %r9, %rbx               # ... & 0x80...

    jnz     .found_null
    addq    $8, %rax
    jmp     .loop_8

.found_null:
    # Final check: which byte in the 8-byte word was NULL?
    bsfq    %rbx, %rbx
    shrq    $3, %rbx
    addq    %rbx, %rax

.done:
    subq    %rdi, %rax              # Length = Current - Start

    popq    %rbx

    # 4. Epilogue
    popq    %rbp            # Restore caller's RBP
    ret

.section .note.GNU-stack,"",@progbits
