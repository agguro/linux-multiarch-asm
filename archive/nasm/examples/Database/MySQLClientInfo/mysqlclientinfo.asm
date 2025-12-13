;name: mysqlclientinfo.asm
;
;build: nasm -felf64 mysqlclientinfo.asm -o mysqlclientinfo.o
;       ld -melf_x86_64 -o mysqlclientinfo mysqlclientinfo.o -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -lmysqlclient
;
;description: display MySQL Client version
;
;to build: you need libmysqlclient libary. (sudo apt-get install libmysqlclient)

bits 64

[list -]
    extern      mysql_get_client_info
    extern      printf
    extern      exit
[list +]

section .rodata

    text:   db "MySQL client Version: %s", 10, 0
      
section .text

global _start
_start:

    call      mysql_get_client_info
    mov       rsi, rax        ; pointer to version info in rsi
    mov       rdi, text       ; pointer to text in rdi
    xor       rax, rax        ; no integers to print
    call      printf
    xor       rdi, rdi        ; no error
    call      exit
