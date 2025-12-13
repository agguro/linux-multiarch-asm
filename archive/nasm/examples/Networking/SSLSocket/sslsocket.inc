%ifndef __SSLSOCKETTEST_INC__
%define __SSLSOCKETTEST_INC__

;include files
    %include "unistd.inc"               ;syscalls
    %include "sys/stat.inc"             ;S_IRUSR, S_IWUSR
    %include "asm-generic/mman.inc"     ;O_RDWR, O_CREAT

;lib ssl and crypto functions
    extern  OPENSSL_init_ssl
    extern  BIO_read
    extern  TLS_client_method
    extern  SSL_CTX_new
    extern  BIO_new_ssl_connect
    extern  BIO_free_all    
    extern  SSL_CTX_free

;OpenSSL definitions
;see /usr/local/include/openssl for info about constants and functions
%define C_SET_CONNECT 0x64
%define BIO_C_DO_STATE_MACHINE 0x65

%define LF 0x0A
%define CR 0x0D
%define HOST "linuxnasm.be:443"
%define EOL CR,LF

%define MSG_CTX_NULL "The creation of a new SSL_CTX object failed."
%define MSG_SSL_UNINITIALIZED "SSL initialization failed."
%define ERROR_FILE_CREATION "cannot create a file"
%define ERROR_CONNECTION_FAILED "cannot connect to host"
%define ERROR_REQUEST_FAILED "Failed request"

%endif  ;__SSLSOCKETTEST_INC__
