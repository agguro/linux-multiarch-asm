/* **************************************************************************
 * Name        : strlen.s
 * Description : Page-boundary safe Bit-Magic strlen (ABI compliant).
 * Uses numeric local labels for internal branching.
 * ************************************************************************** */

.section .text
.globl strlen
.type strlen, @function

strlen:
    # --- Prologue ---
    pushq   %rbp            # Save caller's frame pointer
    movq    %rsp, %rbp      # Establish 16-byte alignment

    # Preserve RBX as it is a callee-saved register
    pushq   %rbx

    movq    %rdi, %rax      # Working pointer

    # --- Step 1: Align to 8-byte boundary ---
    # We check each byte until the pointer is aligned to prevent 
    # crossing a 4k page boundary during a quadword load.
1:
    testq   $7, %rax        # Is the pointer 8-byte aligned?
    jz      2f              # If yes, jump FORWARD to bit-magic
    cmpb    $0, (%rax)      # Is it a null terminator?
    je      3f              # If yes, jump FORWARD to done
    incq    %rax            # Move to next byte
    jmp     1b              # Jump BACKWARD to check again

    # --- Step 2: Bit-Magic Initialization ---
2:
    movabsq $0x0101010101010101, %r8  # Mask for least significant bits
    movabsq $0x8080808080808080, %r9  # Mask for most significant bits

    # --- Step 3: Main Loop (Processing 8 bytes at a time) ---
4:
    movq    (%rax), %rdx    # LOAD 8 bytes
    movq    %rdx, %rbx

    subq    %r8, %rbx       # (x - 0x01...)
    notq    %rdx            # ~x
    andq    %rdx, %rbx      # (x - 0x01...) & ~x
    andq    %r9, %rbx       # ... & 0x80...

    jnz     5f              # If non-zero, a NULL was found; jump FORWARD
    addq    $8, %rax        # Move to next quadword
    jmp     4b              # Jump BACKWARD to loop

    # --- Step 4: Identify NULL position ---
5:
    bsfq    %rbx, %rbx      # Bit Scan Forward to find the first '1'
    shrq    $3, %rbx        # Divide by 8 to get byte offset
    addq    %rbx, %rax      # Add offset to current pointer

    # --- Step 5: Final Calculation and Exit ---
3:
    subq    %rdi, %rax      # Result = Current Pointer - Start Pointer

    # Restore callee-saved registers
    popq    %rbx            # Restore RBX

    # --- Epilogue ---
    popq    %rbp            # Restore caller's RBP
    ret                     # Return length in RAX

.section .note.GNU-stack,"",@progbits
