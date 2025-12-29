;name: httpserver.asm
;
;build: nasm -felf64 httpserver.asm -o httpserver.o
;       ld -s -melf_x86_64 -o httpserver httpserver.o
;
;description: A very very basic httpserver demonstration.
;             For this I got my inspiration from the 32 bit application httpd from
;             asmutils-0.18. (http://asm.sourceforge.net/asmutils.html)
;
;updates: 4/11/2014 : bug in creating the socket,
;                     mov rdi, PF_INET
;                     mov rsi, SOCK_STREAM
;                     added %define for constants AF_INET, SOCK_STREAM, PF_INET, IPPROTO_IP,INADDR_ANY
;
;todos: - configuration file
;       - execute binary files (cgi-bin)
;       - environment variables
;
;use:           Start program from a terminal and open browser. go to localhost:4444
;               while keeping the terminal open. Send some data and watch http header
;               in terminal.
;               To terminate this program either use kill [pid] or ctrl-C.
;
;notes about google chrome : if the content-length isn't correct it hangs
;                            use firefox (matters less) to see the real content-length

bits 64

[list -]
	%include "unistd.inc"
	%include "sys/wait.inc"
	%include "asm-generic/socket.inc"
	%include "asm-generic/errno.inc"
[list +]

section .bss
	sockfd:             resq 1
	sock_addr:          resq 1
 
section .data
    ; message to keep user confortable that the server is actually running
    server_listening:	db "server is listening",10
    .length:			equ $-server_listening
    lf:				db 10
    trying:			db  "starting..."
    .length:			equ $-trying 
    dot:				db  "."
    ; the buffer to read the client request.
    buffer:			times 1024 db 0
    .length:			equ $-buffer
    reply:			db 'HTTP/1.1 200 OK',10
					;change 'demo web server' to your own name
					db 'Server: demo web server',10
					;the length of the content to send,
					;this should be calculated programatically
					db 'Content-length: 295',10
					db 'Content-Type: text/html',10
					;cookies
					db 'Set-Cookie:UserID=XYZ',10
					db 'Set-Cookie:Password=XYZ123',10
					db 'Set-Cookie:Domain=www.agguro.be',10
					db 'Set-Cookie:Path=/',10
					db 10                                           ;extra line !!
					;start of content
					db '<!DOCTYPE html><html><head><title>demo w'
					db 'ebserver</title></head><body><h1>Demo we'
					db 'bserver</h1><form method="post" action="'
					db 'http://localhost:4444/"><input type="tex'
					db 't" name="inputfield" value="type somethi'
					db 'ng" /><button type= "submit" name="submi'
					db 't" value="name">Send data</button></form'
					db '></body></html>'
					;end of content
					db 0                                            ;for later use with strlen
    reply.length:		equ $-reply
    socketerror:		db  "socketerror", 10
    .length:			equ $-socketerror
    listenerror:		db  "listenerror", 10
    .length:			equ $-listenerror
    binderror:			db  "binderror", 10
    .length:			equ $-binderror
    port:				db  17,92           ; port 4444 (256 * 17 + 92)
    version:			db  "demo httpserver v0.1 (by Agguro)",10
					db  "inspir(at)ed by asmutils(c) (see:http://asm.sourceforge.net/asmutils.html)",10
					db  "license: GNU General Public License, version 2",10
					db  "(https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html)",10
    .length:			equ $-version
    
section .text
    global _start
 
_start:
    pop     rax                         ;get argc
    pop     rsi                         ;ptr to name of program
    pop     rsi                         ;ptr to argv
    push    rsi                         ;restore stack
    push    rsi
    push    rax
    cmp     rax,2                       ;cmdline arguments supplied?
    jl      .start
    mov     rax,qword[rsi]
    mov     rdx,"-version"
    xor     rdx,rax
    jz      .showversion
    mov     dx,"-v"
    xor     dx,ax
    jnz     .start
.showversion:
    syscall write,stdout,version,version.length
    syscall exit,0
.start:    
    push    rax                         ;restore stack
    ;create a socket
    syscall socket,PF_INET,SOCK_STREAM,IPPROTO_IP
    cmp     rax,0
    jz      .socketerror
    mov     qword[sockfd], rax
    ;fill in sock_addr structure on stack
    xor     r8,r8                       ;INADDR_ANY = 0
    ;if we only want to connect locally uncomment next line
    mov     r8,0x100007F
    push    r8                          ;push r8 to the stack
    push    word [port]                 ;port number
    push    word AF_INET                ;protocol argument
    mov     qword[sock_addr],rsp        ;Save the sock_addr_in
;bind the socket to the address, keep trying until we succeed.
;if the address is still in use, bind will fail, we can avoid this with the 
;setsockopt syscall, but we use INADDR_ANY so anyone can
;bind to the server's socket.
;information: http://hea-www.harvard.edu/~fine/Tech/addrinuse.html
;Instead I keep trying until the server allows us to bind again, 
;in the meanwhile we wait ....
    syscall write,stdout,trying,trying.length
.tryagain: 
    syscall bind,qword[sockfd],qword[sock_addr],16
    and     rax,rax
    js      .checkerror
    jmp     .bindsucces
.checkerror:
    cmp     rax,EADDRINUSE
    jne     .binderror
    ;if the socket is still in use the terminal is flooded with dots, a timer can resolve this
    syscall write,stdout,dot,1
    jmp     .tryagain
.bindsucces:
    ; first end the previous line with LF
    syscall write,stdout,lf,1
    syscall listen,qword[sockfd],0
    and     rax,rax
    jnz     .listenerror
    ; inform user that the server is listening
    syscall write,stdout,server_listening,server_listening.length
.acceptloop:
    syscall accept,qword[sockfd],0,0
    test     rax,rax
    js      .acceptloop
    mov     r12,rax                    ;use the accept socket from here
    ;two waits to prevent zombie processes
    syscall wait4,-1,0,WNOHANG,0
    syscall wait4,-1,0,WNOHANG,0

    ;we have accepted a connection, let a child do the work while the parent
    ;wait to accept other connections.
    syscall fork
    and     rax, rax
    jz      .serveclient                ;child continues here
    ;parent closes the connection
    syscall close,r12
    jmp     .acceptloop                 ;and go back to accept new incoming connections
 
.serveclient:
    ;the client has send a request, we read this and put it in a buffer
    syscall read,r12,buffer,buffer.length
    ;write received request to the terminal (later this can be a log file)
    ;the actual read bytes are stored in rax
    syscall write,stdout,buffer,rax
    ;additional end of line
    syscall write,stdout,lf,1
     
    ;here we parse the request from client that's put in STDIN
    ;now we just reply with the so called "reply"
    ;decision making stuff comes here, exp: CGI scripts, request for additional pages etc...
    ;see the original source.

    ; send the reply to the client
    syscall write,r12,reply,reply.length
    syscall close,r12
    ;we are done, exit child process
    syscall exit,0
; the errors
.binderror:
    mov     rsi,binderror
    mov     rdx,binderror.length
    jmp     .print
.listenerror:
    mov     rsi,listenerror
    mov     rdx,listenerror.length
    jmp     .print
.socketerror:
    mov     rsi,socketerror
    mov     rdx,socketerror.length
.print:
    syscall write,stdout
.exit:
    syscall exit,0
