%ifndef _ASM_GENERIC_ERRNO_INC_
%define _ASM_GENERIC_ERRNO_INC_ 1
    
    %include "asm-generic/errno-base.inc"
    
    %define   EDEADLK        -35        ; Resource deadlock would occur
    %define   ENAMETOOLONG   -36        ; File name too long
    %define   ENOLCK         -37        ; No record locks available
    %define   ENOSYS         -38        ; Function not implemented
    %define   ENOTEMPTY      -39        ; Directory not empty
    %define   ELOOP          -40        ; Too many symbolic links encountered
    %define   EWOULDBLOCK    -11        ; Operation would block, same as EAGAIN
    %define   ENOMSG         -42        ; No message of desired type
    %define   EIDRM          -43        ; Identifier removed
    %define   ECHRNG         -44        ; Channel number out of range
    %define   EL2NSYNC       -45        ; Level 2 not synchronized
    %define   EL3HLT         -46        ; Level 3 halted
    %define   EL3RST         -47        ; Level 3 reset
    %define   ELNRNG         -48        ; Link number out of range
    %define   EUNATCH        -49        ; Protocol driver not attached
    %define   ENOCSI         -50        ; No CSI structure available
    %define   EL2HLT         -51        ; Level 2 halted
    %define   EBADE          -52        ; Invalid exchange
    %define   EBADR          -53        ; Invalid request descriptor
    %define   EXFULL         -54        ; Exchange full
    %define   ENOANO         -55        ; No anode
    %define   EBADRQC        -56        ; Invalid request code
    %define   EBADSLT        -57        ; Invalid slot
    %define   EDEADLOCK      -35        ; Resource deadlock would occur, same as EDEADLK
    %define   EBFONT         -59        ; Bad font file format
    %define   ENOSTR         -60        ; Device not a stream
    %define   ENODATA        -61        ; No data available
    %define   ETIME          -62        ; Timer expired
    %define   ENOSR          -63        ; Out of streams resources
    %define   ENONET         -64        ; Machine is not on the network
    %define   ENOPKG         -65        ; Package not installed
    %define   EREMOTE        -66        ; Object is remote
    %define   ENOLINK        -67        ; Link has been severed
    %define   EADV           -68        ; Advertise error
    %define   ESRMNT         -69        ; Srmount error
    %define   ECOMM          -70        ; Communication error on send
    %define   EPROTO         -71        ; Protocol error
    %define   EMULTIHOP      -72        ; Multihop attempted
    %define   EDOTDOT        -73        ; RFS specific error
    %define   EBADMSG        -74        ; Not a data message
    %define   EOVERFLOW      -75        ; Value too large for defined data type
    %define   ENOTUNIQ       -76        ; Name not unique on network
    %define   EBADFD         -77        ; File descriptor in bad state
    %define   EREMCHG        -78        ; Remote address changed
    %define   ELIBACC        -79        ; Can not access a needed shared library
    %define   ELIBBAD        -80        ; Accessing a corrupted shared library
    %define   ELIBSCN        -81        ; .lib section in a.out corrupted
    %define   ELIBMAX        -82        ; Attempting to link in too many shared libraries
    %define   ELIBEXEC       -83        ; Cannot exec a shared library directly
    %define   EILSEQ         -84        ; Illegal byte sequence
    %define   ERESTART       -85        ; Interrupted system call should be restarted
    %define   ESTRPIPE       -86        ; Streams pipe error
    %define   EUSERS         -87        ; Too many users
    %define   ENOTSOCK       -88        ; Socket operation on non-socket
    %define   EDESTADDRREQ   -89        ; Destination address required
    %define   EMSGSIZE       -90        ; Message too long
    %define   EPROTOTYPE     -91        ; Protocol wrong type for socket
    %define   ENOPROTOOPT    -92        ; Protocol not available
    %define   EPROTONOSUPPORT     -93   ; Protocol not supported
    %define   ESOCKTNOSUPPORT     -94   ; Socket type not supported
    %define   EOPNOTSUPP     -95        ; Operation not supported on transport endpoint
    %define   EPFNOSUPPORT   -96        ; Protocol family not supported
    %define   EAFNOSUPPORT   -97        ; Address family not supported by protocol
    %define   EADDRINUSE     -98        ; Address already in use
    %define   EADDRNOTAVAIL  -99        ; Cannot assign requested address
    %define   ENETDOWN       -100       ; Network is down
    %define   ENETUNREACH    -101       ; Network is unreachable
    %define   ENETRESET      -102       ; Network dropped connection because of reset
    %define   ECONNABORTED   -103       ; Software caused connection abort
    %define   ECONNRESET     -104       ; Connection reset by peer
    %define   ENOBUFS        -105       ; No buffer space available
    %define   EISCONN        -106       ; Transport endpoint is already connected
    %define   ENOTCONN       -107       ; Transport endpoint is not connected
    %define   ESHUTDOWN      -108       ; Cannot send after transport endpoint shutdown
    %define   ETOOMANYREFS   -109       ; Too many references: cannot splice
    %define   ETIMEDOUT      -110       ; Connection timed out
    %define   ECONNREFUSED   -111       ; Connection refused
    %define   EHOSTDOWN      -112       ; Host is down
    %define   EHOSTUNREACH   -113       ; No route to host
    %define   EALREADY       -114       ; Operation already in progress
    %define   EINPROGRESS    -115       ; Operation now in progress
    %define   ESTALE         -116       ; Stale NFS file handle
    %define   EUCLEAN        -117       ; Structure needs cleaning
    %define   ENOTNAM        -118       ; Not a XENIX named type file
    %define   ENAVAIL        -119       ; No XENIX semaphores available
    %define   EISNAM         -120       ; Is a named type file
    %define   EREMOTEIO      -121       ; Remote I/O error
    %define   EDQUOT         -122       ; Quota exceeded
    %define   ENOMEDIUM      -123       ; No medium found
    %define   EMEDIUMTYPE    -124       ; Wrong medium type
    %define   ECANCELED      -125       ; Operation Canceled
    %define   ENOKEY         -126       ; Required key not available
    %define   EKEYEXPIRED    -127       ; Key has expired
    %define   EKEYREVOKED    -128       ; Key has been revoked
    %define   EKEYREJECTED   -129       ; Key was rejected by service

    ; for robust mutexes
    %define   EOWNERDEAD          -130  ; Owner died
    %define   ENOTRECOVERABLE     -131  ; State not recoverable
    %define   ERFKILL             -132  ; Operation not possible due to RF-kill
    %define   EHWPOISON           -133  ; Memory page has hardware error

    ; error text messages
    %define   EDEADLK.text                  "Resource deadlock would occur"
    %define   ENAMETOOLONG.text             "File name too long"
    %define   ENOLCK.text                   "No record locks available"
    %define   ENOSYS.text                   "Function not implemented"
    %define   ENOTEMPTY.text                "Directory not empty"
    %define   ELOOP.text                    "Too many symbolic links encountered"
    %define   EWOULDBLOCK.text              "Operation would block"                    ; same as EAGAIN"
    %define   ENOMSG.text                   "No message of desired type"
    %define   EIDRM.text                    "Identifier removed"
    %define   ECHRNG.text                   "Channel number out of range"
    %define   EL2NSYNC.text                 "Level 2 not synchronized"
    %define   EL3HLT.text                   "Level 3 halted"
    %define   EL3RST.text                   "Level 3 reset"
    %define   ELNRNG.text                   "Link number out of range"
    %define   EUNATCH.text                  "Protocol driver not attached"
    %define   ENOCSI.text                   "No CSI structure available"
    %define   EL2HLT.text                   "Level 2 halted"
    %define   EBADE.text                    "Invalid exchange"
    %define   EBADR.text                    "Invalid request descriptor"
    %define   EXFULL.text                   "Exchange full"
    %define   ENOANO.text                   "No anode"
    %define   EBADRQC.text                  "Invalid request code"
    %define   EBADSLT.text                  "Invalid slot"
    %define   EDEADLOCK.text                "Resource deadlock would occur"            ; same as EDEADLK
    %define   EBFONT.text                   "Bad font file format"
    %define   ENOSTR.text                   "Device not a stream"
    %define   ENODATA.text                  "No data available"
    %define   ETIME.text                    "Timer expired"
    %define   ENOSR.text                    "Out of streams resources"
    %define   ENONET.text                   "Machine is not on the network"
    %define   ENOPKG.text                   "Package not installed"
    %define   EREMOTE.text                  "Object is remote"
    %define   ENOLINK.text                  "Link has been severed"
    %define   EADV.text                     "Advertise error"
    %define   ESRMNT.text                   "Srmount error"
    %define   ECOMM.text                    "Communication error on send"
    %define   EPROTO.text                   "Protocol error"
    %define   EMULTIHOP.text                "Multihop attempted"
    %define   EDOTDOT.text                  "RFS specific error"
    %define   EBADMSG                       "Not a data message"
    %define   EOVERFLOW.text                "Value too large for defined data type"
    %define   ENOTUNIQ.text                 "Name not unique on network"
    %define   EBADFD.text                   "File descriptor in bad state"
    %define   EREMCHG.text                  "Remote address changed"
    %define   ELIBACC.text                  "Can not access a needed shared library"
    %define   ELIBBAD.text                  "Accessing a corrupted shared library"
    %define   ELIBSCN.text                  ".lib section in a.out corrupted"
    %define   ELIBMAX.text                  "Attempting to link in too many shared libraries"
    %define   ELIBEXEC.text                 "Cannot exec a shared library directly"
    %define   EILSEQ.text                   "Illegal byte sequence"
    %define   ERESTART.text                 "Interrupted system call should be restarted"
    %define   ESTRPIPE.text                 "Streams pipe error"
    %define   EUSERS.text                   "Too many users"
    %define   ENOTSOCK.text                 "Socket operation on non-socket"
    %define   EDESTADDRREQ.text             "Destination address required"
    %define   EMSGSIZE.text                 "Message too long"
    %define   EPROTOTYPE.text               "Protocol wrong type for socket"
    %define   ENOPROTOOPT.text              "Protocol not available"
    %define   EPROTONOSUPPORT.text          "Protocol not supported"
    %define   ESOCKTNOSUPPORT.text          "Socket type not supported"
    %define   EOPNOTSUPP.text               "Operation not supported on transport endpoint"
    %define   EPFNOSUPPORT.text             "Protocol family not supported"
    %define   EAFNOSUPPORT.text             "Address family not supported by protocol"
    %define   EADDRINUSE.text               "Address already in use"
    %define   EADDRNOTAVAIL.text            "Cannot assign requested address"
    %define   ENETDOWN.text                 "Network is down"
    %define   ENETUNREACH.text              "Network is unreachable"
    %define   ENETRESET.text                "Network dropped connection because of reset"
    %define   ECONNABORTED.text             "Software caused connection abort"
    %define   ECONNRESET.text               "Connection reset by peer"
    %define   ENOBUFS.text                  "No buffer space available"
    %define   EISCONN.text                  "Transport endpoint is already connected"
    %define   ENOTCONN.text                 "Transport endpoint is not connected"
    %define   ESHUTDOWN.text                "Cannot send after transport endpoint shutdown"
    %define   ETOOMANYREFS.text             "Too many references: cannot splice"
    %define   ETIMEDOUT.text                "Connection timed out"
    %define   ECONNREFUSED.text             "Connection refused"
    %define   EHOSTDOWN.text                "Host is down"
    %define   EHOSTUNREACH.text             "No route to host"
    %define   EALREADY.text                 "Operation already in progress"
    %define   EINPROGRESS.text              "Operation now in progress"
    %define   ESTALE.text                   "Stale NFS file handle"
    %define   EUCLEAN.text                  "Structure needs cleaning"
    %define   ENOTNAM.text                  "Not a XENIX named type file"
    %define   ENAVAIL.text                  "No XENIX semaphores available"
    %define   EISNAM.text                   "Is a named type file"
    %define   EREMOTEIO.text                "Remote I/O error"
    %define   EDQUOT.text                   "Quota exceeded"
    %define   ENOMEDIUM.text                "No medium found"
    %define   EMEDIUMTYPE.text              "Wrong medium type"
    %define   ECANCELED.text                "Operation Canceled"
    %define   ENOKEY.text                   "Required key not available"
    %define   EKEYEXPIRED.text              "Key has expired"
    %define   EKEYREVOKED.text              "Key has been revoked"
    %define   EKEYREJECTED.text             "Key was rejected by service"

    ; for robust mutexes
    %define   EOWNERDEAD.text               "Owner died"
    %define   ENOTRECOVERABLE.text          "State not recoverable"
    %define   ERFKILL.text                  "Operation not possible due to RF-kill"
    %define   EHWPOISON.text                "Memory page has hardware error"
  
%endif  ; _ASM_GENERIC_ERRNO_INC_
