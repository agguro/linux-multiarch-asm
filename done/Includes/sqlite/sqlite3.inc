%ifndef _ASM_SQLITE_SQLITE3_INC_
%define _ASM_SQLITE_SQLITE3_INC_

    extern	_fini
    extern	_init
    extern	sqlite3_aggregate_context
    extern	sqlite3_aggregate_count
    extern	sqlite3_auto_extension
    extern	sqlite3_backup_finish
    extern	sqlite3_backup_init
    extern	sqlite3_backup_pagecount
    extern	sqlite3_backup_remaining
    extern	sqlite3_backup_step
    extern	sqlite3_bind_blob
    extern	sqlite3_bind_double
    extern	sqlite3_bind_int
    extern	sqlite3_bind_int64
    extern	sqlite3_bind_null
    extern	sqlite3_bind_parameter_count
    extern	sqlite3_bind_parameter_index
    extern	sqlite3_bind_parameter_name
    extern	sqlite3_bind_text
    extern	sqlite3_bind_text16
    extern	sqlite3_bind_value
    extern	sqlite3_bind_zeroblob
    extern	sqlite3_blob_bytes
    extern	sqlite3_blob_close
    extern	sqlite3_blob_open
    extern	sqlite3_blob_read
    extern	sqlite3_blob_reopen
    extern	sqlite3_blob_write
    extern	sqlite3_busy_handler
    extern	sqlite3_busy_timeout
    extern	sqlite3_cancel_auto_extension
    extern	sqlite3_changes
    extern	sqlite3_clear_bindings
    extern	sqlite3_close
    extern	sqlite3_close_v2
    extern	sqlite3_collation_needed
    extern	sqlite3_collation_needed16
    extern	sqlite3_column_blob
    extern	sqlite3_column_bytes
    extern	sqlite3_column_bytes16
    extern	sqlite3_column_count
    extern	sqlite3_column_decltype
    extern	sqlite3_column_decltype16
    extern	sqlite3_column_double
    extern	sqlite3_column_int
    extern	sqlite3_column_int64
    extern	sqlite3_column_name
    extern	sqlite3_column_name16
    extern	sqlite3_column_text
    extern	sqlite3_column_text16
    extern	sqlite3_column_type
    extern	sqlite3_column_value
    extern	sqlite3_commit_hook
    extern	sqlite3_compileoption_get
    extern	sqlite3_compileoption_used
    extern	sqlite3_complete
    extern	sqlite3_complete16
    extern	sqlite3_config
    extern	sqlite3_context_db_handle
    extern	sqlite3_create_collation
    extern	sqlite3_create_collation16
    extern	sqlite3_create_collation_v2
    extern	sqlite3_create_function
    extern	sqlite3_create_function16
    extern	sqlite3_create_function_v2
    extern	sqlite3_create_module
    extern	sqlite3_create_module_v2
    extern	sqlite3_data_count
    extern	sqlite3_db_config
    extern	sqlite3_db_filename
    extern	sqlite3_db_handle
    extern	sqlite3_db_mutex
    extern	sqlite3_db_readonly
    extern	sqlite3_db_release_memory
    extern	sqlite3_db_status
    extern	sqlite3_declare_vtab
    extern	sqlite3_enable_load_extension
    extern	sqlite3_enable_shared_cache
    extern	sqlite3_errcode
    extern	sqlite3_errmsg
    extern	sqlite3_errmsg16
    extern	sqlite3_errstr
    extern	sqlite3_exec
    extern	sqlite3_expired
    extern	sqlite3_extended_errcode
    extern	sqlite3_extended_result_codes
    extern	sqlite3_file_control
    extern	sqlite3_finalize
    extern	sqlite3_free
    extern	sqlite3_free_table
    extern	sqlite3_get_autocommit
    extern	sqlite3_get_auxdata
    extern	sqlite3_get_table
    extern	sqlite3_global_recover
    extern	sqlite3_initialize
    extern	sqlite3_interrupt
    extern	sqlite3_last_insert_rowid
    extern	sqlite3_libversion
    extern	sqlite3_libversion_number
    extern	sqlite3_limit
    extern	sqlite3_load_extension
    extern	sqlite3_log
    extern	sqlite3_malloc
    extern	sqlite3_memory_alarm
    extern	sqlite3_memory_highwater
    extern	sqlite3_memory_used
    extern	sqlite3_mprintf
    extern	sqlite3_mutex_alloc
    extern	sqlite3_mutex_enter
    extern	sqlite3_mutex_free
    extern	sqlite3_mutex_leave
    extern	sqlite3_mutex_try
    extern	sqlite3_next_stmt
    extern	sqlite3_open
    extern	sqlite3_open16
    extern	sqlite3_open_v2
    extern	sqlite3_os_end
    extern	sqlite3_os_init
    extern	sqlite3_overload_function
    extern	sqlite3_prepare
    extern	sqlite3_prepare16
    extern	sqlite3_prepare16_v2
    extern	sqlite3_prepare_v2
    extern	sqlite3_profile
    extern	sqlite3_progress_handler
    extern	sqlite3_randomness
    extern	sqlite3_realloc
    extern	sqlite3_release_memory
    extern	sqlite3_reset
    extern	sqlite3_reset_auto_extension
    extern	sqlite3_result_blob
    extern	sqlite3_result_double
    extern	sqlite3_result_error
    extern	sqlite3_result_error16
    extern	sqlite3_result_error_code
    extern	sqlite3_result_error_nomem
    extern	sqlite3_result_error_toobig
    extern	sqlite3_result_int
    extern	sqlite3_result_int64
    extern	sqlite3_result_null
    extern	sqlite3_result_text
    extern	sqlite3_result_text16
    extern	sqlite3_result_text16be
    extern	sqlite3_result_text16le
    extern	sqlite3_result_value
    extern	sqlite3_result_zeroblob
    extern	sqlite3_rollback_hook
    extern	sqlite3_rtree_geometry_callback
    extern	sqlite3_set_authorizer
    extern	sqlite3_set_auxdata
    extern	sqlite3_shutdown
    extern	sqlite3_sleep
    extern	sqlite3_snprintf
    extern	sqlite3_soft_heap_limit
    extern	sqlite3_soft_heap_limit64
    extern	sqlite3_sourceid
    extern	sqlite3_sql
    extern	sqlite3_status
    extern	sqlite3_step
    extern	sqlite3_stmt_busy
    extern	sqlite3_stmt_readonly
    extern	sqlite3_stmt_status
    extern	sqlite3_strglob
    extern	sqlite3_stricmp
    extern	sqlite3_strnicmp
    extern	sqlite3_test_control
    extern	sqlite3_thread_cleanup
    extern	sqlite3_threadsafe
    extern	sqlite3_total_changes
    extern	sqlite3_trace
    extern	sqlite3_transfer_bindings
    extern	sqlite3_update_hook
    extern	sqlite3_uri_boolean
    extern	sqlite3_uri_int64
    extern	sqlite3_uri_parameter
    extern	sqlite3_user_data
    extern	sqlite3_value_blob
    extern	sqlite3_value_bytes
    extern	sqlite3_value_bytes16
    extern	sqlite3_value_double
    extern	sqlite3_value_int
    extern	sqlite3_value_int64
    extern	sqlite3_value_numeric_type
    extern	sqlite3_value_text
    extern	sqlite3_value_text16
    extern	sqlite3_value_text16be
    extern	sqlite3_value_text16le
    extern	sqlite3_value_type
    extern	sqlite3_vfs_find
    extern	sqlite3_vfs_register
    extern	sqlite3_vfs_unregister
    extern	sqlite3_vmprintf
    extern	sqlite3_vsnprintf
    extern	sqlite3_vtab_config
    extern	sqlite3_vtab_on_conflict
    extern	sqlite3_wal_autocheckpoint
    extern	sqlite3_wal_checkpoint
    extern	sqlite3_wal_checkpoint_v2
    extern	sqlite3_wal_hook

    ; CAPI3REF: Result Codes
    %define SQLITE_OK           0   ;/* Successful result */
    ; beginning-of-error-codes
    %define SQLITE_ERROR        1   ;/* SQL error or missing database */
    %define SQLITE_INTERNAL     2   ;/* Internal logic error in SQLite */
    %define SQLITE_PERM         3   ;/* Access permission denied */
    %define SQLITE_ABORT        4   ;/* Callback routine requested an abort */
    %define SQLITE_BUSY         5   ;/* The database file is locked */
    %define SQLITE_LOCKED       6   ;/* A table in the database is locked */
    %define SQLITE_NOMEM        7   ;/* A malloc() failed */
    %define SQLITE_READONLY     8   ;/* Attempt to write a readonly database */
    %define SQLITE_INTERRUPT    9   ;/* Operation terminated by sqlite3_interrupt()*/
    %define SQLITE_IOERR       10   ;/* Some kind of disk I/O error occurred */
    %define SQLITE_CORRUPT     11   ;/* The database disk image is malformed */
    %define SQLITE_NOTFOUND    12   ;/* Unknown opcode in sqlite3_file_control() */
    %define SQLITE_FULL        13   ;/* Insertion failed because database is full */
    %define SQLITE_CANTOPEN    14   ;/* Unable to open the database file */
    %define SQLITE_PROTOCOL    15   ;/* Database lock protocol error */
    %define SQLITE_EMPTY       16   ;/* Database is empty */
    %define SQLITE_SCHEMA      17   ;/* The database schema changed */
    %define SQLITE_TOOBIG      18   ;/* String or BLOB exceeds size limit */
    %define SQLITE_CONSTRAINT  19   ;/* Abort due to constraint violation */
    %define SQLITE_MISMATCH    20   ;/* Data type mismatch */
    %define SQLITE_MISUSE      21   ;/* Library used incorrectly */
    %define SQLITE_NOLFS       22   ;/* Uses OS features not supported on host */
    %define SQLITE_AUTH        23   ;/* Authorization denied */
    %define SQLITE_FORMAT      24   ;/* Auxiliary database format error */
    %define SQLITE_RANGE       25   ;/* 2nd parameter to sqlite3_bind out of range */
    %define SQLITE_NOTADB      26   ;/* File opened that is not a database file */
    %define SQLITE_ROW         100  ;/* sqlite3_step() has another row ready */
    %define SQLITE_DONE        101  ;/* sqlite3_step() has finished executing */
    ; end-of-error-codes

    ; CAPI3REF: Extended Result Codes

    %define SQLITE_IOERR_READ              (SQLITE_IOERR | (1<<8))
    %define SQLITE_IOERR_SHORT_READ        (SQLITE_IOERR | (2<<8))
    %define SQLITE_IOERR_WRITE             (SQLITE_IOERR | (3<<8))
    %define SQLITE_IOERR_FSYNC             (SQLITE_IOERR | (4<<8))
    %define SQLITE_IOERR_DIR_FSYNC         (SQLITE_IOERR | (5<<8))
    %define SQLITE_IOERR_TRUNCATE          (SQLITE_IOERR | (6<<8))
    %define SQLITE_IOERR_FSTAT             (SQLITE_IOERR | (7<<8))
    %define SQLITE_IOERR_UNLOCK            (SQLITE_IOERR | (8<<8))
    %define SQLITE_IOERR_RDLOCK            (SQLITE_IOERR | (9<<8))
    %define SQLITE_IOERR_DELETE            (SQLITE_IOERR | (10<<8))
    %define SQLITE_IOERR_BLOCKED           (SQLITE_IOERR | (11<<8))
    %define SQLITE_IOERR_NOMEM             (SQLITE_IOERR | (12<<8))
    %define SQLITE_IOERR_ACCESS            (SQLITE_IOERR | (13<<8))
    %define SQLITE_IOERR_CHECKRESERVEDLOCK (SQLITE_IOERR | (14<<8))
    %define SQLITE_IOERR_LOCK              (SQLITE_IOERR | (15<<8))
    %define SQLITE_IOERR_CLOSE             (SQLITE_IOERR | (16<<8))
    %define SQLITE_IOERR_DIR_CLOSE         (SQLITE_IOERR | (17<<8))
    %define SQLITE_IOERR_SHMOPEN           (SQLITE_IOERR | (18<<8))
    %define SQLITE_IOERR_SHMSIZE           (SQLITE_IOERR | (19<<8))
    %define SQLITE_IOERR_SHMLOCK           (SQLITE_IOERR | (20<<8))
    %define SQLITE_IOERR_SHMMAP            (SQLITE_IOERR | (21<<8))
    %define SQLITE_IOERR_SEEK              (SQLITE_IOERR | (22<<8))
    %define SQLITE_LOCKED_SHAREDCACHE      (SQLITE_LOCKED |  (1<<8))
    %define SQLITE_BUSY_RECOVERY           (SQLITE_BUSY   |  (1<<8))
    %define SQLITE_CANTOPEN_NOTEMPDIR      (SQLITE_CANTOPEN | (1<<8))
    %define SQLITE_CORRUPT_VTAB            (SQLITE_CORRUPT | (1<<8))
    %define SQLITE_READONLY_RECOVERY       (SQLITE_READONLY | (1<<8))
    %define SQLITE_READONLY_CANTLOCK       (SQLITE_READONLY | (2<<8))

    ; CAPI3REF: Flags For File Open Operations

    %define SQLITE_OPEN_READONLY         0x00000001  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_READWRITE        0x00000002  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_CREATE           0x00000004  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_DELETEONCLOSE    0x00000008  ;/* VFS only */
    %define SQLITE_OPEN_EXCLUSIVE        0x00000010  ;/* VFS only */
    %define SQLITE_OPEN_AUTOPROXY        0x00000020  ;/* VFS only */
    %define SQLITE_OPEN_URI              0x00000040  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_MAIN_DB          0x00000100  ;/* VFS only */
    %define SQLITE_OPEN_TEMP_DB          0x00000200  ;/* VFS only */
    %define SQLITE_OPEN_TRANSIENT_DB     0x00000400  ;/* VFS only */
    %define SQLITE_OPEN_MAIN_JOURNAL     0x00000800  ;/* VFS only */
    %define SQLITE_OPEN_TEMP_JOURNAL     0x00001000  ;/* VFS only */
    %define SQLITE_OPEN_SUBJOURNAL       0x00002000  ;/* VFS only */
    %define SQLITE_OPEN_MASTER_JOURNAL   0x00004000  ;/* VFS only */
    %define SQLITE_OPEN_NOMUTEX          0x00008000  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_FULLMUTEX        0x00010000  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_SHAREDCACHE      0x00020000  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_PRIVATECACHE     0x00040000  ;/* Ok for sqlite3_open_v2() */
    %define SQLITE_OPEN_WAL              0x00080000  ;/* VFS only */

    ; Reserved:                         0x00F00000 

    ; CAPI3REF: Device Characteristics

    %define SQLITE_IOCAP_ATOMIC                 0x00000001
    %define SQLITE_IOCAP_ATOMIC512              0x00000002
    %define SQLITE_IOCAP_ATOMIC1K               0x00000004
    %define SQLITE_IOCAP_ATOMIC2K               0x00000008
    %define SQLITE_IOCAP_ATOMIC4K               0x00000010
    %define SQLITE_IOCAP_ATOMIC8K               0x00000020
    %define SQLITE_IOCAP_ATOMIC16K              0x00000040
    %define SQLITE_IOCAP_ATOMIC32K              0x00000080
    %define SQLITE_IOCAP_ATOMIC64K              0x00000100
    %define SQLITE_IOCAP_SAFE_APPEND            0x00000200
    %define SQLITE_IOCAP_SEQUENTIAL             0x00000400
    %define SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN  0x00000800

    ; CAPI3REF: File Locking Levels

    %define SQLITE_LOCK_NONE          0
    %define SQLITE_LOCK_SHARED        1
    %define SQLITE_LOCK_RESERVED      2
    %define SQLITE_LOCK_PENDING       3
    %define SQLITE_LOCK_EXCLUSIVE     4

    ; CAPI3REF: Synchronization Type Flags

    %define SQLITE_SYNC_NORMAL        0x00002
    %define SQLITE_SYNC_FULL          0x00003
    %define SQLITE_SYNC_DATAONLY      0x00010

%endif  ; _ASM_SQLITE_SQLITE3_INC_