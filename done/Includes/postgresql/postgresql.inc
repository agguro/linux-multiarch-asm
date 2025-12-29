%ifndef _ASM_POSTGRESQL_INC_
%define _ASM_POSTGRESQL_INC_
 
    extern  appendBinaryPQExpBuffer
    extern  appendPQExpBuffer
    extern  appendPQExpBufferChar
    extern  appendPQExpBufferStr
    extern  createPQExpBuffer
    extern  destroyPQExpBuffer
    extern  enlargePQExpBuffer
    extern  initPQExpBuffer
    extern  lo_close
    extern  lo_creat
    extern  lo_create
    extern  lo_export
    extern  lo_import
    extern  lo_import_with_oid
    extern  lo_lseek
    extern  lo_open
    extern  lo_read
    extern  lo_tell
    extern  lo_truncate
    extern  lo_unlink
    extern  lo_write
    extern  pg_char_to_encoding
    extern  pg_encoding_to_char
    extern  pg_utf_mblen
    extern  pg_valid_server_encoding
    extern  pg_valid_server_encoding_id
    extern  PQbackendPID
    extern  PQbinaryTuples
    extern  PQcancel
    extern  PQclear
    extern  PQclientEncoding
    extern  PQcmdStatus
    extern  PQcmdTuples
    extern  PQconndefaults
    extern  PQconnectdb
    extern  PQconnectdbParams
    extern  PQconnectionNeedsPassword
    extern  PQconnectionUsedPassword
    extern  PQconnectPoll
    extern  PQconnectStart
    extern  PQconnectStartParams
    extern  PQconninfoFree
    extern  PQconninfoParse
    extern  PQconsumeInput
    extern  PQcopyResult
    extern  PQdb
    extern  PQdescribePortal
    extern  PQdescribePrepared
    extern  PQdisplayTuples
    extern  PQdsplen
    extern  PQencryptPassword
    extern  PQendcopy
    extern  PQenv2encoding
    extern  PQerrorMessage
    extern  PQescapeBytea
    extern  PQescapeByteaConn
    extern  PQescapeIdentifier
    extern  PQescapeLiteral
    extern  PQescapeString
    extern  PQescapeStringConn
    extern  PQexec
    extern  PQexecParams
    extern  PQexecPrepared
    extern  PQfformat
    extern  PQfinish
    extern  PQfireResultCreateEvents
    extern  PQflush
    extern  PQfmod
    extern  PQfn
    extern  PQfname
    extern  PQfnumber
    extern  PQfreeCancel
    extern  PQfreemem
    extern  PQfreeNotify
    extern  PQfsize
    extern  PQftable
    extern  PQftablecol
    extern  PQftype
    extern  PQgetCancel
    extern  PQgetCopyData
    extern  PQgetisnull
    extern  PQgetlength
    extern  PQgetline
    extern  PQgetlineAsync
    extern  PQgetResult
    extern  PQgetssl
    extern  PQgetvalue
    extern  PQhost
    extern  PQinitOpenSSL
    extern  PQinitSSL
    extern  PQinstanceData
    extern  PQisBusy
    extern  PQisnonblocking
    extern  PQisthreadsafe
    extern  PQlibVersion
    extern  PQmakeEmptyPGresult
    extern  PQmblen
    extern  PQnfields
    extern  PQnotifies
    extern  PQnparams
    extern  PQntuples
    extern  PQoidStatus
    extern  PQoidValue
    extern  PQoptions
    extern  PQparameterStatus
    extern  PQparamtype
    extern  PQpass
    extern  PQping
    extern  PQpingParams
    extern  PQport
    extern  PQprepare
    extern  PQprint
    extern  PQprintTuples
    extern  PQprotocolVersion
    extern  PQputCopyData
    extern  PQputCopyEnd
    extern  PQputline
    extern  PQputnbytes
    extern  PQregisterEventProc
    extern  PQregisterThreadLock
    extern  PQrequestCancel
    extern  PQreset
    extern  PQresetPoll
    extern  PQresetStart
    extern  PQresStatus
    extern  PQresultAlloc
    extern  PQresultErrorField
    extern  PQresultErrorMessage
    extern  PQresultInstanceData
    extern  PQresultSetInstanceData
    extern  PQresultStatus
    extern  PQsendDescribePortal
    extern  PQsendDescribePrepared
    extern  PQsendPrepare
    extern  PQsendQuery
    extern  PQsendQueryParams
    extern  PQsendQueryPrepared
    extern  PQserverVersion
    extern  PQsetClientEncoding
    extern  PQsetdbLogin
    extern  PQsetErrorVerbosity
    extern  PQsetInstanceData
    extern  PQsetnonblocking
    extern  PQsetNoticeProcessor
    extern  PQsetNoticeReceiver
    extern  PQsetResultAttrs
    extern  PQsetvalue
    extern  pqsignal
    extern  PQsocket
    extern  PQstatus
    extern  PQtrace
    extern  PQtransactionStatus
    extern  PQtty
    extern  PQunescapeBytea
    extern  PQuntrace
    extern  PQuser
    extern  printfPQExpBuffer
    extern  resetPQExpBuffer
    extern  termPQExpBuffer

    %define PG_COPYRES_ATTRS                                0x01
    %define PG_COPYRES_TUPLES                               0x02    ; Implies PG_COPYRES_ATTRS
    %define PG_COPYRES_EVENTS                               0x04
    %define PG_COPYRES_NOTICEHOOKS                          0x08

    ; ConnStatusType
    %define CONNECTION_OK                    0
    %define CONNECTION_BAD                   1
    %define CONNECTION_STARTED               2   ; Waiting for connection to be made.
    %define CONNECTION_MADE                  3   ; Connection OK; waiting to send.
    %define CONNECTION_AWAITING_RESPONSE     4   ; Waiting for a response from the postmaster.
    %define CONNECTION_AUTH_OK               5,  ; Received authentication; waiting for backend startup.
    %define CONNECTION_SETENV,               6   ; Negotiating environment.
    %define CONNECTION_SSL_STARTUP,          7   ; Negotiating SSL.
    %define CONNECTION_NEEDED                8   ; Internal state: connect() needed

    ; PostgresPollingStatusType
    %define PGRES_POLLING_FAILED      0
    %define PGRES_POLLING_READING     1   ; These two indicate that one may
    %define PGRES_POLLING_WRITING     2   ; use select before polling again.
    %define PGRES_POLLING_OK          3
    %define PGRES_POLLING_ACTIVE      4   ; unused; keep for awhile for backwards compatibility

    ; ExecStatusType
    %define PGRES_EMPTY_QUERY         0   ; empty query string was executed
    %define PGRES_COMMAND_OK          1   ; a query command that doesn't return anything was executed properly by the backend
    %define PGRES_TUPLES_OK           2   ; a query command that returns tuples was executed properly by the backend, PGresult contains the result tuples
    %define PGRES_COPY_OUT            3   ; Copy Out data transfer in progress
    %define PGRES_COPY_IN             4   ; Copy In data transfer in progress
    %define PGRES_BAD_RESPONSE        5   ; an unexpected response was recv'd from the backend
    %define PGRES_NONFATAL_ERROR      6   ; notice or warning message
    %define PGRES_FATAL_ERROR         7   ; query failed
    %define PGRES_COPY_BOTH           8   ; Copy In/Out data transfer in progress

    ; PGTransactionStatusType
    %define PQTRANS_IDLE              0   ; connection idle
    %define PQTRANS_ACTIVE            1   ; command in progress
    %define PQTRANS_INTRANS           2   ; idle, within transaction block
    %define PQTRANS_INERROR           3   ; idle, within failed transaction
    %define PQTRANS_UNKNOWN           4   ; cannot determine status

    ; PGVerbosity
    %define PQERRORS_TERSE          0   ; single-line error messages
    %define PQERRORS_DEFAULT        1   ; recommended style
    %define PQERRORS_VERBOSE        2   ; all the facts, ma'am

    ; PGPing
    %define PQPING_OK               0   ; server is accepting connections
    %define PQPING_REJECT           1   ; server is alive but rejecting connections
    %define PQPING_NO_RESPONSE      2   ; could not establish connection
    %define PQPING_NO_ATTEMPT       3   ; connection not attempted (bad params)

%endif  ; _ASM_POSTGRESQL_INC_
