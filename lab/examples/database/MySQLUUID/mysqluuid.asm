;name: mysqluuid.asm
;
;build: nasm -felf64 mysqluuid.asm -o mysqluuid.o 
;       ld -melf_x86_64 -o mysqluuid mysqluuid.o --dynamic-linker /lib64/ld-linux-x86-64.so.2 -lmysqlclient
;
;description: As an alternative for the uuid example, we can get a uuid from mysql server.
;             The benefit is that mysql keeps track of unique uuids but then you need to have access to one.
;
;to build: you need libmysqlclient libary. (sudo apt-get install libmysqlclient)

bits 64

[list -]
    extern    mysql_close
    extern    mysql_errno
    extern    mysql_error
    extern    mysql_fetch_row
    extern    mysql_free_result
    extern    mysql_init
    extern    mysql_query
    extern    mysql_real_connect
    extern    mysql_server_end
    extern    mysql_server_init
    extern    mysql_use_result    
    %include  "unistd.inc"
[list +]

section .bss

    conn:       resq  1
    result:     resq  1
    row:        resq  1

section .rodata:

    host:       db  "localhost",0
    port:       dq  3306
    user:       dq  "user",0
    password:   dq  "Password",0
    database:   db  "test",0
    socket:     dq  0
    clientflag: dq  0

section .data

    strserverinit:  db  "MySQL library could not be initialized",10
    .len:           equ $-strserverinit
    strobjinit:     db  "MySQL init object failed", 10
    .len:           equ $-strobjinit
    strresult:      db  "MySQL result error", 10
    .len:           equ $-strresult
    strfetchrow:    db  "MySQL fetch row error", 10
    .len:           equ $-strfetchrow
    query:                      db  "select uuid()",0
    
section .text

global _start
_start:
    ;connect to mysql server
    ;not an embedded MySQL so all arguments must be zero
    xor     rdi, rdi
    xor     rsi, rsi
    xor     rdx, rdx
    call    mysql_server_init
    and     rax, rax
    jnz     errserverinit
    ; From this point we need to cleanup the library!!!!
    xor     rdi, rdi
    call    mysql_init
    and     rax, rax
    jz      errobjinit
    ; no errors, connect and login 
    mov     qword[conn], rax                 ; save *mysql
    mov     rdi, rax                          ; value of mysql = pointer to mysql instance of connection
    push    0                                 ; the value of clientflags or NULL if none
    push    0                                 ; the value of socket or NULL if none
    mov     r9d, dword[port]                 ; the value of the port to connect to               
    mov     r8,database                            ; pointer to zero terminated database string
    mov     rcx, password             ; pointer to zero terminated password string
    mov     rdx, user                 ; pointer to zero terminated user string
    mov     rsi, host                 ; pointer to zero terminated host string
    call    mysql_real_connect                ; connect
    pop     rdx                               ; restore stackpointer
    pop     rdx
    sub     rax, qword[conn]                 ; if conn == pointer to mysql instance then succes
    and     rax, rax      
    jnz     errconnect
    ; We are connected, execute the query

    mov     rsi, query                        ; pointer to zero terminated query string
    mov     rdi, qword[conn]                 ; value of mysql = pointer to mysql instance of connection
    call    mysql_query                       ; query the server
    ; check for errors
    mov     rdi, qword[conn]                 ; check if an error occured
    call    mysql_errno
    and     rax, rax
    jnz     errerror
    mov     rdi, qword[conn]
    call    mysql_use_result                  ; we don't ask all the records at once (less client side memory)
    and     rax, rax
    jz      errresult
    ; get databases from resultset
    mov     qword[result], rax
nextrecord:
    mov     rdi, qword[result]
    call    mysql_fetch_row
    ; the result is a pointer to a row
    ; first 8 bytes of that result is a pointer to the name of the item in the row
    ; we have to loop this procedure until the row == null
    ; after row == null received always check first for errors
    and     rax, rax
    jz      norows                            ; any record left?
    cmp     rax, 2000                         ; unknown error
    je      errerror
    cmp     rax, 2013                         ; connection lost
    je      errerror
    mov     qword[row], rax
    ; print the record
    mov     rsi, [rax]
    mov     rdi, rsi
    call    stringlength
    mov     rdx, rax
    add     rax, rsi
    inc     rdx
    mov     byte[rax], 0x0A
    call    string2stdout   
    ;go for next record
    jmp     nextrecord
norows:      
    mov     rdi, qword[conn]
    call    mysql_errno
    and     rax, rax
    jnz     errerror
    ; free result
    mov     rdi, qword[result]
    call    mysql_free_result
closeconnection:
    mov     rdi, qword[conn]
    call    mysql_close
endserver:        
    call    mysql_server_end
exit:
    syscall exit, 0

errserverinit:
    mov     rsi, strserverinit
    mov     rdx, strserverinit.len
    call    string2stderr
    jmp     exit
errobjinit:
    mov     rsi, strobjinit
    mov     rdx, strobjinit.len
    call    string2stderr
    jmp     endserver
errconnect:
    push    endserver
    jmp     errerror.@1
errerror:
    push    closeconnection
.@1:     
    mov     rdi, qword[conn]
    call    mysql_error
    mov     rsi, rax
    mov     rdi, rax
    call    stringlength
    mov     rdx, rax
    inc     rdx
    add     rax, rsi
    mov     byte[rax], 0x0A
    call    string2stderr
    ret
errresult:
    mov     rsi, strresult
    mov     rdx, strresult.len
    call    string2stderr
    jmp     closeconnection
errfetchrow:
    mov     rsi, strfetchrow
    mov     rdx, strfetchrow.len
    call    string2stderr
    jmp     closeconnection   

string2stderr:
    push    rcx
    push    r11
    mov     rdi, stderr
    jmp     _syscallwrite
    
string2stdout:
    push    rcx
    push    r11
    mov     rdi, stdout
_syscallwrite:     
    syscall write, rdi, rsi, rdx
    pop     r11
    pop     rcx
    ret

; determine string length of a string in rdi
stringlength:
    xor     rcx, rcx
    dec     rcx
    xor     rax, rax
    repne   scasb
    neg     rcx
    dec     rcx
    dec     rcx
    and     rcx, rcx
    mov     rax, rcx                  ; return length in RAX
    ret
