;name: ftok.asm
;
;description: This is the assembler version of the c/c++ function ftok.
;             the type key_t is actually just a LONG, you can use any number you want.
;             the ftok() function which a key from two arguments:
;             key_t ftok(const char *path, int id);
;
;source: http://beej.us/guide/bgipc/output/html/multipage/mq.html

bits 64

%include "sys/stat.inc"

section .text

global ftok

ftok:
; entry:      RDI has the path/file string to the file
;             RSI has an 'project id' arbitrary choosen.
; on return:  RAX has a unique key
; on failure: RAX = a negative number containing the error
;
; the ftok function is defined in c/c++ as follows:
; key = ((st.st_ino & 0xffff) | ((st.st_dev & 0xff) << 16) | ((proj_id & 0xff) << 24));

; save used registers
    push      rbx
    push      rdi
    push      rsi
    push      r8
; save the project id in R8 (will remain after syscalls)
    mov       r8,rsi
; open the file
    syscall   open,rdi, O_RDONLY
    and       rax,rax
    js        .done                                ; something wrong, errno in rax and return
    syscall   fstat,rax, stat                     ; get filestatus
    and       rax,rax
    js        .done                                ; something wrong, errno in rax and return
    mov       rax,qword [stat.st_ino]             ; get the file size
    and       rax,0xFFFF
    mov       rbx,qword [stat.st_dev]             ; ID of device containing file
    and       rbx,0xFF
    shl       rbx,16
    or        rax,rbx
    and       r8,0xFF                             ; R8 = proj_id
    shl       r8,24
    or        rax,r8
.done:
; rax now contains a key which uniquely identifies the file.
; restore used registers
    pop       r8
    pop       rsi
    pop       rdi
    pop       rbx
    ret
