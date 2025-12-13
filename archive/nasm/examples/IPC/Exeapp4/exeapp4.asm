;name:        exeapp4.asm
;
;build:       nasm "-felf64" exeapp4.asm -l exeapp4.lst -o exeapp4.o
;             ld -s -melf_x86_64 -o exeapp4 exeapp4.o
;
;description: Demonstration on how to execute a program / shell script from within an assembler program.
;             Let's make ourself an application that directly opens our favorite website with just a mouseclick in
;             our favorite webbrowser.
;             We need to define the DISPLAY parameter to tell the application to which display we need to write it.
;
;more info:   http://geoffgarside.co.uk/2009/08/28/using-execve-for-the-first-time/
;
;remarks:     Passing arguments more than the url via the arguments list doesn't have any effect, however when we add
;             the options in the command string, we can run firefox in a new tab like I would.
;             Problem solved.
;
;todo:        - extend the program to check wether the user runs in a textbased or gui-based terminal and apply the right browser.
;             - config file to read favorite browser.
;             - solving: "Permission denied.  dconf will not work properly." problem

bits 64

[list -]
    %include "unistd.inc"
[list +]

    %define FAVO_BROWSER    "firefox"
    %define FAVO_SITE       "https://www.linuxnasm.be"

section .data
        
    filename:       db  "/usr/bin/",FAVO_BROWSER,0        ;full path!
    .len:           equ $-filename
    command:        db  FAVO_BROWSER, " -new-tab", 0      ;do not forget the space before -new-tab
    argv1:          db  FAVO_SITE, 0                      ;argument to pass
    ;... put more arguments here
    envp1:          db  "DISPLAY=:0",0                  ;environment parameter, if you forget this then
                                                          ;Error: no display specified will be displayed
    envp2:          db  "PATH=/usr/bin",0                                        
    argvPtr:        dq  command                           ;argument list
                    dq  argv1
                    dq  0                    
    envPtr:         dq  envp1                             ;environment parameter list
                    dq  envp2
                    dq  0
    forkerror:      db  "fork error",10
    .len:           equ $-forkerror
    execveerror:    db  "execve error(not expected)",10
    .len:           equ $-execveerror
    wait4error:     db  "wait4 error",10
    .len:           equ $-wait4error
         
section .text

global _start
_start:

    syscall fork
    and     rax,rax
    jns     .continue
    syscall write,stderr,forkerror,forkerror.len
    jmp     .exit
.continue:
    jz      .runchild
    ; wait for child to terminate
    syscall wait4,0,0,0,0
    jns     .exit
    syscall write,stderr,wait4error,wait4error.len
    jmp     .exit

.runchild:
    syscall execve,filename,argvPtr,envPtr
    jns     .exit
    syscall write,stderr,execveerror,execveerror.len
.exit:    
    syscall exit,0
