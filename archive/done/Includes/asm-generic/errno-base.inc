%ifndef _ASM_GENERIC_ERRNO_BASE_INC_
%define _ASM_GENERIC_ERRNO_BASE_INC_ 1

    %define   EPERM       -1     ; Operation not permitted
    %define   ENOENT      -2     ; No such file or directory
    %define   ESRCH       -3     ; No such process
    %define   EINTR       -4     ; Interrupted system call
    %define   EIO         -5     ; I/O error
    %define   ENXIO       -6     ; No such device or address
    %define   E2BIG       -7     ; Argument list too long
    %define   ENOEXEC     -8     ; Exec format error
    %define   EBADF       -9     ; Bad file number
    %define   ECHILD     -10     ; No child processes
    %define   EAGAIN     -11     ; Try again
    %define   ENOMEM     -12     ; Out of memory
    %define   EACCES     -13     ; Permission denied
    %define   EFAULT     -14     ; Bad address
    %define   ENOTBLK    -15     ; Block device required
    %define   EBUSY      -16     ; Device or resource busy
    %define   EEXIST     -17     ; File Exists
    %define   EXDEV      -18     ; Cross-device link
    %define   ENODEV     -19     ; No such device
    %define   ENOTDIR    -20     ; Not a directory
    %define   EISDIR     -21     ; Is a directory
    %define   EINVAL     -22     ; Invalid argument
    %define   ENFILE     -23     ; File table overflow
    %define   EMFILE     -24     ; Too many open files
    %define   ENOTTY     -25     ; Not a typewriter
    %define   ETXTBSY    -26     ; Text file busy
    %define   EFBIG      -27     ; File too large
    %define   ENOSPC     -28     ; No space left on device
    %define   ESPIPE     -29     ; Illegal seek
    %define   EROFS      -30     ; Read-only file system
    %define   EMLINK     -31     ; Too many links
    %define   EPIPE      -32     ; Broken pipe
    %define   EDOM       -33     ; Math argument out of domain of func
    %define   ERANGE     -34     ; Math result not representable

    ; error text messages

    %define   EPERM.text       "Operation not permitted"
    %define   ENOENT.text      "No such file or directory"
    %define   ESRCH.text       "No such process"
    %define   EINTR.text       "Interrupted system call"
    %define   EIO.text         "I/O error"
    %define   ENXIO.text       "No such device or address"
    %define   E2BIG.text       "Argument list too long"
    %define   ENOEXEC.text     "Exec format error"
    %define   EBADF.text       "Bad file number"
    %define   ECHILD.text      "No child processes"
    %define   EAGAIN.text      "Try again"
    %define   ENOMEM.text      "Out of memory"
    %define   EACCES.text      "Permission denied"
    %define   EFAULT.text      "Bad address"
    %define   ENOTBLK.text     "Block device required"
    %define   EBUSY.text       "Device or resource busy"
    %define   EEXIST.text      "File exists"
    %define   EXDEV.text       "Cross-device link"
    %define   ENODEV.text      "No such device"
    %define   ENOTDIR.text     "Not a directory"
    %define   EISDIR.text      "Is a directory"
    %define   EINVAL.text      "Invalid argument"
    %define   ENFILE.text      "File table overflow"
    %define   EMFILE.text      "Too many open files"
    %define   ENOTTY.text      "Not a typewriter"
    %define   ETXTBSY.text     "Text file busy"
    %define   EFBIG.text       "File too large"
    %define   ENOSPC.text      "No space left on device"
    %define   ESPIPE.text      "Illegal seek"
    %define   EROFS.text       "Read-only file system"
    %define   EMLINK.text      "Too many links"
    %define   EPIPE.text       "Broken pipe"
    %define   EDOM.text        "Math argument out of domain of func"
    %define   ERANGE.text      "Math result not representable"

%endif  ; _ASM_GENERIC_ERRNO_BASE_INC_
