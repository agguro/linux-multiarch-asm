;name: httpsocket.asm
;
;build: nasm -felf64 httpsocket.asm -l httpsocket.lst -o httpsocket.o
;       ld -s -melf_x86_64 -o httpsocket httpsocket.o 
;
;description: Testprogram to connect to localhost:4444 and interact with several server examples.
;             (Like HTTP,FTP,... own build servers like httpserver example.)
;             localhost:4444 is hardcoded for not extending this testprogram too much.
;             use it as it suits you or not at all.

bits 64

[list -]
    %include "unistd.inc"
    %include "asm-generic/socket.inc"
    %include "sys/time.inc"
[list +]

%DEFINE BUFFERSIZE 4096						;buffersize in bytes for the reply
%define DEBUG=1

struc STRUC_SOCKETADDR_IN
   .sin_family: 	resw 1
   .sin_port:		resw 1
   .sin_addr:		resd 1
   .sin_pad:		resb 8
endstruc

section .bss
 
	fdsocket:	        resq	1
	heapstart:	        resq	1
    nbytesread:         resq    1
	buffer:             resb    2048

section .data
    
    sockaddr_in: istruc STRUC_SOCKETADDR_IN
		at STRUC_SOCKETADDR_IN.sin_family,	dw	0
		at STRUC_SOCKETADDR_IN.sin_port,	dw	0
		at STRUC_SOCKETADDR_IN.sin_addr,	dd	0
		at STRUC_SOCKETADDR_IN.sin_pad,	times 8 db 0
    iend
    
    errormsg:		db  "error", 10
    .length:		equ	$-errormsg
%ifdef DEBUG    
    connected:      db  "Connected", 10
    .length:        equ $-connected
    disconnected:   db  10, "Connection closed", 10
    .length:        equ $-disconnected
%endif
	ipaddress:		db  127,0,0,1
    port:           db  17,92
    
	request:		db	"GET /index.php HTTP/1.1",0x0A
                    db  "User-Agent: curl/7.68.0",0x0A
                    db  "Host: localhost",0x0A
                    db  0x0A,0x0A
    .length:        equ $-request

    TIMEVAL time_out,1                      ;1 seconds time out

section .text
    global _start
_start:

;prepare memory for our reply
    syscall brk,0
    and     rax,rax
    js      error
    mov     qword[heapstart],rax

.repeat:
    add     rax, BUFFERSIZE                      ;add 1024 bytes to the current memory break
    syscall brk, rax
    xor     rax, rdi                      ;rax = new memory pointer, test if different from start of heap
    jnz     error                          ;if zero then memory is allocated otherwise we have to free the allocated heap

;create a socket
    syscall socket, PF_INET, SOCK_STREAM , IPPROTO_IP
    and     rax,rax
    js      error
	mov     qword[fdsocket],rax           ;save socket descriptor
;fill in the socket structure
	mov		word[sockaddr_in + STRUC_SOCKETADDR_IN.sin_family],AF_INET
	mov		ax,word[port]
	mov		word[sockaddr_in + STRUC_SOCKETADDR_IN.sin_port],ax
	mov		eax,dword[ipaddress]
	mov		dword[sockaddr_in + STRUC_SOCKETADDR_IN.sin_addr],eax
	;STRUC_SOCKETADDR_IN.sin_pad must remain zero (padding)

;set the socket options
    syscall setsockopt, qword[fdsocket],SOL_SOCKET,SO_RCVTIMEO,time_out,time_out.size


;connect to the remote host
    syscall connect,qword[fdsocket],sockaddr_in,STRUC_SOCKETADDR_IN_size
    and     rax,rax
    js      error

%ifdef DEBUG    
;we are connected
    syscall write,stdout,connected,connected.length
%endif
;send the request
	syscall sendto,qword[fdsocket],request,request.length,0,0,0
    and     rax,rax
    js      error
;get start_of_heap in r15
    mov     r15,qword[heapstart]
    jmp     .get_reply

;
.get_reply:
;receive the reply    

    syscall recvfrom,qword[fdsocket],r15,BUFFERSIZE,0,0,0
    and     rax, rax
    jz      .close_socket
    js      .close_socket  
 ;we print the buffer
    syscall write,stdout,r15,rax
;go to receive next bytes    
    jmp     .get_reply
.close_socket:        
    syscall close,qword[fdsocket]  
%ifdef DEBUG         
; disconnected message
    syscall write,stdout,disconnected,disconnected.length
%endif
; exit program
    syscall exit,0

error:
	;later we need to distinguish the errors 
	syscall	write,stderr,errormsg,errormsg.length
	syscall	exit,1
