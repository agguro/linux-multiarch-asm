# ----------------------------------------------------------------------------------------
# Name        : dirinfo.s
# Description : Displays directory entries information of the current working directory.
#               Uses external library functions for string length and numeric conversion.
# Build       : as --64 -g dirinfo.s -o dirinfo.o
#               ld -m elf_x86_64 -pie -z noexecstack --dynamic-linker 
#                  /lib64/ld-linux-x86-64.so.2 -o dirinfo dirinfo.o strlen.o u64toa.o u64tohex.o
# ----------------------------------------------------------------------------------------

.nolist
    .include "unistd.inc"
.list

.equ O_RDONLY, 0
.equ O_DIRECTORY, 0200000

.section .rodata
    tableheader: .asciz "  inode   |   next entry     | record length |        filetype          |  filename  \n"
    totallength: .asciz "                 Total length |"
    spacer:      .asciz " "
    col:         .asciz "|"
    line:        .asciz "---------------------------------------------------------------------------------------------------------\n"
    crlf:        .asciz "\n"

.section .data
    path:        .asciz "."

    # File Type Strings
    type_unk:    .asciz "unknown           "
    type_reg:    .asciz "regular file      "
    type_dir:    .asciz "directory         "
    type_soc:    .asciz "unix domain socket"
    type_chr:    .asciz "character device  "
    type_lnk:    .asciz "symbolic link     "
    type_blk:    .asciz "block device      "
    type_non:    .asciz "entry without type"
    type_pip:    .asciz "named pipe        "

    # PIE-safe Lookup Table
    .align 8
    type_table:  .quad type_unk, type_reg, type_dir, type_soc, type_chr, type_lnk, type_blk, type_non, type_pip

.section .bss
    .align 16
    buffer:           .skip 4096            # Buffer for getdents64
    .equ BUFFER_LEN, 4096
    fd:               .quad 0
    nread:            .quad 0
    dirent_buf:       .skip 512             # Local copy of current entry
    
    # Buffers for library string conversions
    conv_buf:         .skip 64

.section .text
    .globl _start

    # External Library Functions
    .extern strlen
    .extern u64toa
    .extern u64tohex

_start:
    # 1. Open Directory
    leaq    path(%rip), %rdi
    movq    $(O_RDONLY | O_DIRECTORY), %rsi
    movq    $open, %rax
    syscall
    
    cmpq    $0, %rax
    jl      3f
    leaq    fd(%rip), %rdi
    movq    %rax, (%rdi)

    # 2. Get Directory Entries
    movq    %rax, %rdi               
    leaq    buffer(%rip), %rsi
    movq    $BUFFER_LEN, %rdx
    movq    $getdents64, %rax
    syscall
    
    cmpq    $0, %rax
    jle     2f
    
    leaq    nread(%rip), %rdi
    movq    %rax, (%rdi)
    
    # 3. Print Header
    leaq    line(%rip), %rdi
    call    string_tostdout
    leaq    tableheader(%rip), %rdi
    call    string_tostdout
    leaq    line(%rip), %rdi
    call    string_tostdout
    
    xorq    %r12, %r12               
1:
    leaq    buffer(%rip), %rbx
    addq    %r12, %rbx               
    movzwq  16(%rbx), %rcx   
    
    movq    %rbx, %rsi
    leaq    dirent_buf(%rip), %rdi
    pushq   %rcx                     
    cld
    rep     movsb
    popq    %rcx                     

    leaq    dirent_buf(%rip), %r13   
    
    # Inode
    leaq    spacer(%rip), %rdi
    call    string_tostdout   
    movq    (%r13), %rdi             
    leaq    conv_buf(%rip), %rsi
    movq    $64, %rdx
    call    u64toa                   
    call    print_lib_output         
    
    leaq    spacer(%rip), %rdi
    call    string_tostdout
    leaq    col(%rip), %rdi
    call    string_tostdout
    
    # Offset
    leaq    spacer(%rip), %rdi
    call    string_tostdout
    movq    8(%r13), %rdi            
    leaq    conv_buf(%rip), %rsi
    movq    $64, %rdx
    call    u64tohex                 
    call    print_lib_output
    
    leaq    spacer(%rip), %rdi
    call    string_tostdout
    leaq    col(%rip), %rdi
    call    string_tostdout
    
    # Reclen
    movq    $6, %rax
    call    PrintSpacers
    movzwq  16(%r13), %rdi           
    leaq    conv_buf(%rip), %rsi
    movq    $64, %rdx
    call    u64toa                   
    call    print_lib_output
    movq    $1, %rax
    call    PrintSpacers
    leaq    col(%rip), %rdi
    call    string_tostdout

    # Type
    leaq    spacer(%rip), %rdi
    call    string_tostdout
    movzbq  18(%r13), %rdi           
    leaq    conv_buf(%rip), %rsi
    movq    $64, %rdx
    call    u64toa                   
    call    print_lib_output
    movq    $4, %rax
    call    PrintSpacers
    
    movzbq  18(%r13), %rax
    call    Entry.GetType            
    movq    %rax, %rdi
    call    string_tostdout
    leaq    col(%rip), %rdi
    call    string_tostdout

    # Name
    leaq    spacer(%rip), %rdi
    call    string_tostdout
    leaq    19(%r13), %rdi           
    call    string_tostdout
    
    leaq    crlf(%rip), %rdi
    call    string_tostdout
    
    movzwq  16(%r13), %rax
    addq    %rax, %r12               
    leaq    nread(%rip), %r8
    movq    (%r8), %rax
    cmpq    %rax, %r12               
    jl      1b

    # Footer
    leaq    line(%rip), %rdi
    call    string_tostdout
    leaq    totallength(%rip), %rdi
    call    string_tostdout
    leaq    nread(%rip), %rax
    movq    (%rax), %rdi             
    leaq    conv_buf(%rip), %rsi
    movq    $64, %rdx
    call    u64toa
    call    print_lib_output
    leaq    crlf(%rip), %rdi
    call    string_tostdout
      
2:
    leaq    fd(%rip), %rax
    movq    (%rax), %rdi
    movq    $close, %rax
    syscall

3:      
    movq    $exit, %rax
    xorq    %rdi, %rdi
    syscall

# --- Helpers ---

print_lib_output:
    # Input: %rsi (ptr), %rdx (len) - Already correct for write syscall
    movq    $stdout, %rdi
    movq    $write, %rax
    syscall
    ret

PrintSpacers:
    movq    %rax, %rcx
4:
    pushq   %rcx
    leaq    spacer(%rip), %rdi
    call    string_tostdout
    popq    %rcx
    loop    4b
    ret

Entry.GetType:
    andq    $0x0F, %rax
    movb    %al, %ah
    andb    $0x55, %ah
    shlb    $1, %ah
    andb    $0xAA, %al
    shrb    $1, %al
    orb     %ah, %al
    movb    %al, %ah
    andb    $0x33, %ah
    shlb    $2, %ah
    andb    $0xCC, %al
    shrb    $2, %al
    orb     %ah, %al
    andq    $0x0F, %rax
    leaq    type_table(%rip), %rbx
    shlq    $3, %rax                 
    addq    %rbx, %rax
    movq    (%rax), %rax             
    ret

string_tostdout:
    pushq   %rdi                     
    call    strlen
    movq    %rax, %rdx               
    popq    %rsi                     
    movq    $stdout, %rdi
    movq    $write, %rax
    syscall
    ret

.section .note.GNU-stack,"",@progbits
