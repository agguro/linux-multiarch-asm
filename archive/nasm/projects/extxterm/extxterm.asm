;name: extxterm.asm
;
;description: redirect stderr to a separate terminal, xterm in this example.
;
;inspirated by Evan Terans edb debugger

bits 64

%include "../extxterm/extxterm.inc"

global _start

section .bss
;uninitialized read-write data 
    stderrchildpid:    resq    1
    stdoutchildpid:    resq    1
    fdfifo:            resq    1
    buffer:            resb    1024
    .len:              equ     $-buffer
    nbytesread:        resq    1
    fdterm:            resq    1
    oldstdout:         resq    1
    oldstderr:         resq    1

section .data
;initialized read-write data

section .rodata
;read-only data
    ;error messages
    mknoderror:     db      "mknod error",10
    .len:           equ     $-mknoderror
    forkerror:      db      "fork error",10
    .len:           equ     $-forkerror
    execveerror:    db      "execve error(not expected)",10
    .len:           equ     $-execveerror
    wait4error:     db      "wait4 error",10
    .len:           equ     $-wait4error
    ;fifoname
    fifobuffer:     db      FIFOBUFFER,0
    ;xterm
    command:        db      COMMAND,0
    ;arguments to pass to xterm
    arg:
    .1:             db      "/usr/bin/xterm",0
    .2:             db      "-fa",0
                    ;to chose another font:
                    ;http://www.futurile.net/2016/06/14/xterm-setup-and-truetype-font-configuration/
    .3:             db      "DejaVu Sans Mono",0
    .4:             db      "-fs",0
    .5:             db      "11",0
    .6:             db      "-hold",0
    .7:             db      "-title",0
    .8:             db      DISPLAYNAME,0
    .9:             db      "-e",0
    .10:            db      "sh",0
    .11:            db      "-c",0
    .12:            db      SCRIPT,0
    argp:           dq      arg.1,arg.2,arg.3,arg.4,arg.5,arg.6,arg.7,arg.8,arg.9,arg.10,arg.11,arg.12
                    dq      0
    ;environment parameters to pass to xterm
    env:
    .1:             db      "DISPLAY=:0",0
    .2:             db      "PATH=/bin:/usr/bin",0
    envp:           dq      env.1,env.2
                    dq      0
    stderrmsg:      db      "stderr: message received",0x0A
    .len:           equ     $-stderrmsg
    stdoutmsg:      db      "stdout: message received",0x0A
    .len:           equ     $-stdoutmsg
section .text

_start:
    ;create a FIFO file to communicate with the terminal to get the tty of it.
    ;once we got it, we can delete it and communication continues over the
    ;tty device.
    syscall mknod , fifobuffer , S_IFIFO | S_IRUSR | S_IWUSR , 0
    and     rax,rax                                     ;if mknod doesn't return zero there is a problem
    jz     .startfork                                   ;all ok here
    cmp     rax,EEXIST                                  ;if fifo already exists on disk so we can continue
    jne     .mknoderror                                 ;otherwise there is something else wrong

.startfork:
    ;fork to get a child process, this will terminate when the parent terminates.
    syscall fork
    mov     [stderrchildpid],rax                              ;save pid from child
    and     rax,rax
    js      .forkerror
    jnz     .parent

.stderrchild:
    ;we are in the child process.  The child starts xterm.
    syscall execve,command,argp,envp
    and     rax,rax
    js      .execveerror
    jmp     .exit                                       ;if success we will not get it to here

.parent:
    ;we are in the parent process
    ;open a connection to the fifo to read from it
    syscall open,fifobuffer, 666o ,O_RDONLY
    and     rax,rax
    js      .openerror                                  ;if negative we got an error
    mov     [fdfifo],rax                                ;save filedescriptor to fifo
    ;read the message the shell script in xterm has send to us.  This should contain the
    ;pseude terminal device of xterm
    ;wait until child is done
    syscall read,[fdfifo],buffer,buffer.len
    and     rax,rax
    js      .readerror                                  ;if return value is negative we have an error
    jz      .commerror                                  ;if return value is zero we have a communication error
    mov     [nbytesread],rax                            ;save length of returned string
    ;close the fifo
    syscall close,[fdfifo]
    and     rax,rax                                     ;if negative there was an error
    js      .closeerror
    ;delete the FIFO file, we don't need it any more(?)
    syscall unlink,fifobuffer                           ;if return value negative then error
    js      .unlinkerror
    ;the problem we got is that this string contains an end of line character in it
    ;we have to replace this with a zero
    mov     rax,buffer                                  ;get address of buffer
    add     rax,[nbytesread]                            ;go to last character+1
    dec     rax                                         ;go to location of 0x0A
    mov     byte[rax],0                                 ;overwrite with 0x00
    ;the buffer contains the path to xterm
    ;at this point we can check, when debugging that we can send messages to the terminal with
    ;for example: echo "message" > /dev/pts/6. Just replace /dev/pts/6 with the string in the buffer.
    ;open a connection to the new path, we just want to write
    syscall open, buffer, 0666o ,O_WRONLY               ;we just want to write
    js      .openerror                                  ;if negative we got an error
    mov     [fdterm],rax                                ;save filedescriptor to terminal

    syscall close,stderr
    syscall dup,[fdterm]
    syscall close,[fdterm]
    syscall write,stderr,stderrmsg,stderrmsg.len        ;write a message to stderr, should be visible in xterm
    syscall write,stdout,stdoutmsg,stdoutmsg.len        ;write a message to stdout, should be visible in normal terminal

    ;wait for the kid to end
    syscall wait4,0,0,0,0
    and     rax,rax
    js     .waiterror
.exit:
    ;exit program
    xor     rax,rax             ;return error code
    ret                         ;exit is handled by compiler

;this section can be used to deal with errors
.unlinkerror:
    ;
    ;jmp     .errexit
.writeerror:
    ;
    ;jmp     .errexit
.commerror:
    ;
    ;jmp     .errexit
.closeerror:
    ;
    ;jmp     .errexit
.readerror:
    ;
    ;jmp     .errexit
.openerror:
    ;
    ;jmp     .errexit
.waiterror:
    ;
    ;jmp     .errexit
.execveerror:
    ;
    ;jmp     .errexit
.forkerror:
    ;
    ;jmp     .errexit
.mknoderror:
    ;
    ;jmp     .errexit

.errexit:
    mov     rax,-1
    ret
