#ifndef WSABASEERR
#define WSABASEERR 10000
//
// MessageId: WSAEINTR
//
// MessageText:
//
// A blocking operation was interrupted by a call to WSACancelBlockingCall.
//
#define WSAEINTR                         10004L

//
// MessageId: WSAEBADF
//
// MessageText:
//
// The file handle supplied is not valid.
//
#define WSAEBADF                         10009L

//
// MessageId: WSAEACCES
//
// MessageText:
//
// An attempt was made to access a socket in a way forbidden by its access permissions.
//
#define WSAEACCES                        10013L

//
// MessageId: WSAEFAULT
//
// MessageText:
//
// The system detected an invalid pointer address in attempting to use a pointer argument in a call.
//
#define WSAEFAULT                        10014L

//
// MessageId: WSAEINVAL
//
// MessageText:
//
// An invalid argument was supplied.
//
#define WSAEINVAL                        10022L

//
// MessageId: WSAEMFILE
//
// MessageText:
//
// Too many open sockets.
//
#define WSAEMFILE                        10024L

//
// MessageId: WSAEWOULDBLOCK
//
// MessageText:
//
// A non-blocking socket operation could not be completed immediately.
//
#define WSAEWOULDBLOCK                   10035L

//
// MessageId: WSAEINPROGRESS
//
// MessageText:
//
// A blocking operation is currently executing.
//
#define WSAEINPROGRESS                   10036L

//
// MessageId: WSAEALREADY
//
// MessageText:
//
// An operation was attempted on a non-blocking socket that already had an operation in progress.
//
#define WSAEALREADY                      10037L

//
// MessageId: WSAENOTSOCK
//
// MessageText:
//
// An operation was attempted on something that is not a socket.
//
#define WSAENOTSOCK                      10038L

//
// MessageId: WSAEDESTADDRREQ
//
// MessageText:
//
// A required address was omitted from an operation on a socket.
//
#define WSAEDESTADDRREQ                  10039L

//
// MessageId: WSAEMSGSIZE
//
// MessageText:
//
// A message sent on a datagram socket was larger than the internal message buffer or some other network limit, or the buffer used to receive a datagram into was smaller than the datagram itself.
//
#define WSAEMSGSIZE                      10040L

//
// MessageId: WSAEPROTOTYPE
//
// MessageText:
//
// A protocol was specified in the socket function call that does not support the semantics of the socket type requested.
//
#define WSAEPROTOTYPE                    10041L

//
// MessageId: WSAENOPROTOOPT
//
// MessageText:
//
// An unknown, invalid, or unsupported option or level was specified in a getsockopt or setsockopt call.
//
#define WSAENOPROTOOPT                   10042L

//
// MessageId: WSAEPROTONOSUPPORT
//
// MessageText:
//
// The requested protocol has not been configured into the system, or no implementation for it exists.
//
#define WSAEPROTONOSUPPORT               10043L

//
// MessageId: WSAESOCKTNOSUPPORT
//
// MessageText:
//
// The support for the specified socket type does not exist in this address family.
//
#define WSAESOCKTNOSUPPORT               10044L

//
// MessageId: WSAEOPNOTSUPP
//
// MessageText:
//
// The attempted operation is not supported for the type of object referenced.
//
#define WSAEOPNOTSUPP                    10045L

//
// MessageId: WSAEPFNOSUPPORT
//
// MessageText:
//
// The protocol family has not been configured into the system or no implementation for it exists.
//
#define WSAEPFNOSUPPORT                  10046L

//
// MessageId: WSAEAFNOSUPPORT
//
// MessageText:
//
// An address incompatible with the requested protocol was used.
//
#define WSAEAFNOSUPPORT                  10047L

//
// MessageId: WSAEADDRINUSE
//
// MessageText:
//
// Only one usage of each socket address (protocol/network address/port) is normally permitted.
//
#define WSAEADDRINUSE                    10048L

//
// MessageId: WSAEADDRNOTAVAIL
//
// MessageText:
//
// The requested address is not valid in its context.
//
#define WSAEADDRNOTAVAIL                 10049L

//
// MessageId: WSAENETDOWN
//
// MessageText:
//
// A socket operation encountered a dead network.
//
#define WSAENETDOWN                      10050L

//
// MessageId: WSAENETUNREACH
//
// MessageText:
//
// A socket operation was attempted to an unreachable network.
//
#define WSAENETUNREACH                   10051L

//
// MessageId: WSAENETRESET
//
// MessageText:
//
// The connection has been broken due to keep-alive activity detecting a failure while the operation was in progress.
//
#define WSAENETRESET                     10052L

//
// MessageId: WSAECONNABORTED
//
// MessageText:
//
// An established connection was aborted by the software in your host machine.
//
#define WSAECONNABORTED                  10053L

//
// MessageId: WSAECONNRESET
//
// MessageText:
//
// An existing connection was forcibly closed by the remote host.
//
#define WSAECONNRESET                    10054L

//
// MessageId: WSAENOBUFS
//
// MessageText:
//
// An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full.
//
#define WSAENOBUFS                       10055L

//
// MessageId: WSAEISCONN
//
// MessageText:
//
// A connect request was made on an already connected socket.
//
#define WSAEISCONN                       10056L

//
// MessageId: WSAENOTCONN
//
// MessageText:
//
// A request to send or receive data was disallowed because the socket is not connected and (when sending on a datagram socket using a sendto call) no address was supplied.
//
#define WSAENOTCONN                      10057L

//
// MessageId: WSAESHUTDOWN
//
// MessageText:
//
// A request to send or receive data was disallowed because the socket had already been shut down in that direction with a previous shutdown call.
//
#define WSAESHUTDOWN                     10058L

//
// MessageId: WSAETOOMANYREFS
//
// MessageText:
//
// Too many references to some kernel object.
//
#define WSAETOOMANYREFS                  10059L

//
// MessageId: WSAETIMEDOUT
//
// MessageText:
//
// A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond.
//
#define WSAETIMEDOUT                     10060L

//
// MessageId: WSAECONNREFUSED
//
// MessageText:
//
// No connection could be made because the target machine actively refused it.
//
#define WSAECONNREFUSED                  10061L

//
// MessageId: WSAELOOP
//
// MessageText:
//
// Cannot translate name.
//
#define WSAELOOP                         10062L

//
// MessageId: WSAENAMETOOLONG
//
// MessageText:
//
// Name component or name was too long.
//
#define WSAENAMETOOLONG                  10063L

//
// MessageId: WSAEHOSTDOWN
//
// MessageText:
//
// A socket operation failed because the destination host was down.
//
#define WSAEHOSTDOWN                     10064L

//
// MessageId: WSAEHOSTUNREACH
//
// MessageText:
//
// A socket operation was attempted to an unreachable host.
//
#define WSAEHOSTUNREACH                  10065L

//
// MessageId: WSAENOTEMPTY
//
// MessageText:
//
// Cannot remove a directory that is not empty.
//
#define WSAENOTEMPTY                     10066L

//
// MessageId: WSAEPROCLIM
//
// MessageText:
//
// A Windows Sockets implementation may have a limit on the number of applications that may use it simultaneously.
//
#define WSAEPROCLIM                      10067L

//
// MessageId: WSAEUSERS
//
// MessageText:
//
// Ran out of quota.
//
#define WSAEUSERS                        10068L

//
// MessageId: WSAEDQUOT
//
// MessageText:
//
// Ran out of disk quota.
//
#define WSAEDQUOT                        10069L

//
// MessageId: WSAESTALE
//
// MessageText:
//
// File handle reference is no longer available.
//
#define WSAESTALE                        10070L

//
// MessageId: WSAEREMOTE
//
// MessageText:
//
// Item is not available locally.
//
#define WSAEREMOTE                       10071L

//
// MessageId: WSASYSNOTREADY
//
// MessageText:
//
// WSAStartup cannot function at this time because the underlying system it uses to provide network services is currently unavailable.
//
#define WSASYSNOTREADY                   10091L

//
// MessageId: WSAVERNOTSUPPORTED
//
// MessageText:
//
// The Windows Sockets version requested is not supported.
//
#define WSAVERNOTSUPPORTED               10092L

//
// MessageId: WSANOTINITIALISED
//
// MessageText:
//
// Either the application has not called WSAStartup, or WSAStartup failed.
//
#define WSANOTINITIALISED                10093L

//
// MessageId: WSAEDISCON
//
// MessageText:
//
// Returned by WSARecv or WSARecvFrom to indicate the remote party has initiated a graceful shutdown sequence.
//
#define WSAEDISCON                       10101L

//
// MessageId: WSAENOMORE
//
// MessageText:
//
// No more results can be returned by WSALookupServiceNext.
//
#define WSAENOMORE                       10102L

//
// MessageId: WSAECANCELLED
//
// MessageText:
//
// A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
//
#define WSAECANCELLED                    10103L

//
// MessageId: WSAEINVALIDPROCTABLE
//
// MessageText:
//
// The procedure call table is invalid.
//
#define WSAEINVALIDPROCTABLE             10104L

//
// MessageId: WSAEINVALIDPROVIDER
//
// MessageText:
//
// The requested service provider is invalid.
//
#define WSAEINVALIDPROVIDER              10105L

//
// MessageId: WSAEPROVIDERFAILEDINIT
//
// MessageText:
//
// The requested service provider could not be loaded or initialized.
//
#define WSAEPROVIDERFAILEDINIT           10106L

//
// MessageId: WSASYSCALLFAILURE
//
// MessageText:
//
// A system call that should never fail has failed.
//
#define WSASYSCALLFAILURE                10107L

//
// MessageId: WSASERVICE_NOT_FOUND
//
// MessageText:
//
// No such service is known. The service cannot be found in the specified name space.
//
#define WSASERVICE_NOT_FOUND             10108L

//
// MessageId: WSATYPE_NOT_FOUND
//
// MessageText:
//
// The specified class was not found.
//
#define WSATYPE_NOT_FOUND                10109L

//
// MessageId: WSA_E_NO_MORE
//
// MessageText:
//
// No more results can be returned by WSALookupServiceNext.
//
#define WSA_E_NO_MORE                    10110L

//
// MessageId: WSA_E_CANCELLED
//
// MessageText:
//
// A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
//
#define WSA_E_CANCELLED                  10111L

//
// MessageId: WSAEREFUSED
//
// MessageText:
//
// A database query failed because it was actively refused.
//
#define WSAEREFUSED                      10112L

//
// MessageId: WSAHOST_NOT_FOUND
//
// MessageText:
//
// No such host is known.
//
#define WSAHOST_NOT_FOUND                11001L

//
// MessageId: WSATRY_AGAIN
//
// MessageText:
//
// This is usually a temporary error during hostname resolution and means that the local server did not receive a response from an authoritative server.
//
#define WSATRY_AGAIN                     11002L

//
// MessageId: WSANO_RECOVERY
//
// MessageText:
//
// A non-recoverable error occurred during a database lookup.
//
#define WSANO_RECOVERY                   11003L

//
// MessageId: WSANO_DATA
//
// MessageText:
//
// The requested name is valid, but no data of the requested type was found.
//
#define WSANO_DATA                       11004L

//
// MessageId: WSA_QOS_RECEIVERS
//
// MessageText:
//
// At least one reserve has arrived.
//
#define WSA_QOS_RECEIVERS                11005L

//
// MessageId: WSA_QOS_SENDERS
//
// MessageText:
//
// At least one path has arrived.
//
#define WSA_QOS_SENDERS                  11006L

//
// MessageId: WSA_QOS_NO_SENDERS
//
// MessageText:
//
// There are no senders.
//
#define WSA_QOS_NO_SENDERS               11007L

//
// MessageId: WSA_QOS_NO_RECEIVERS
//
// MessageText:
//
// There are no receivers.
//
#define WSA_QOS_NO_RECEIVERS             11008L

//
// MessageId: WSA_QOS_REQUEST_CONFIRMED
//
// MessageText:
//
// Reserve has been confirmed.
//
#define WSA_QOS_REQUEST_CONFIRMED        11009L

//
// MessageId: WSA_QOS_ADMISSION_FAILURE
//
// MessageText:
//
// Error due to lack of resources.
//
#define WSA_QOS_ADMISSION_FAILURE        11010L

//
// MessageId: WSA_QOS_POLICY_FAILURE
//
// MessageText:
//
// Rejected for administrative reasons - bad credentials.
//
#define WSA_QOS_POLICY_FAILURE           11011L

//
// MessageId: WSA_QOS_BAD_STYLE
//
// MessageText:
//
// Unknown or conflicting style.
//
#define WSA_QOS_BAD_STYLE                11012L

//
// MessageId: WSA_QOS_BAD_OBJECT
//
// MessageText:
//
// Problem with some part of the filterspec or providerspecific buffer in general.
//
#define WSA_QOS_BAD_OBJECT               11013L

//
// MessageId: WSA_QOS_TRAFFIC_CTRL_ERROR
//
// MessageText:
//
// Problem with some part of the flowspec.
//
#define WSA_QOS_TRAFFIC_CTRL_ERROR       11014L

//
// MessageId: WSA_QOS_GENERIC_ERROR
//
// MessageText:
//
// General QOS error.
//
#define WSA_QOS_GENERIC_ERROR            11015L

//
// MessageId: WSA_QOS_ESERVICETYPE
//
// MessageText:
//
// An invalid or unrecognized service type was found in the flowspec.
//
#define WSA_QOS_ESERVICETYPE             11016L

//
// MessageId: WSA_QOS_EFLOWSPEC
//
// MessageText:
//
// An invalid or inconsistent flowspec was found in the QOS structure.
//
#define WSA_QOS_EFLOWSPEC                11017L

//
// MessageId: WSA_QOS_EPROVSPECBUF
//
// MessageText:
//
// Invalid QOS provider-specific buffer.
//
#define WSA_QOS_EPROVSPECBUF             11018L

//
// MessageId: WSA_QOS_EFILTERSTYLE
//
// MessageText:
//
// An invalid QOS filter style was used.
//
#define WSA_QOS_EFILTERSTYLE             11019L

//
// MessageId: WSA_QOS_EFILTERTYPE
//
// MessageText:
//
// An invalid QOS filter type was used.
//
#define WSA_QOS_EFILTERTYPE              11020L

//
// MessageId: WSA_QOS_EFILTERCOUNT
//
// MessageText:
//
// An incorrect number of QOS FILTERSPECs were specified in the FLOWDESCRIPTOR.
//
#define WSA_QOS_EFILTERCOUNT             11021L

//
// MessageId: WSA_QOS_EOBJLENGTH
//
// MessageText:
//
// An object with an invalid ObjectLength field was specified in the QOS provider-specific buffer.
//
#define WSA_QOS_EOBJLENGTH               11022L

//
// MessageId: WSA_QOS_EFLOWCOUNT
//
// MessageText:
//
// An incorrect number of flow descriptors was specified in the QOS structure.
//
#define WSA_QOS_EFLOWCOUNT               11023L

//
// MessageId: WSA_QOS_EUNKOWNPSOBJ
//
// MessageText:
//
// An unrecognized object was found in the QOS provider-specific buffer.
//
#define WSA_QOS_EUNKOWNPSOBJ             11024L

//
// MessageId: WSA_QOS_EPOLICYOBJ
//
// MessageText:
//
// An invalid policy object was found in the QOS provider-specific buffer.
//
#define WSA_QOS_EPOLICYOBJ               11025L

//
// MessageId: WSA_QOS_EFLOWDESC
//
// MessageText:
//
// An invalid QOS flow descriptor was found in the flow descriptor list.
//
#define WSA_QOS_EFLOWDESC                11026L

//
// MessageId: WSA_QOS_EPSFLOWSPEC
//
// MessageText:
//
// An invalid or inconsistent flowspec was found in the QOS provider specific buffer.
//
#define WSA_QOS_EPSFLOWSPEC              11027L

//
// MessageId: WSA_QOS_EPSFILTERSPEC
//
// MessageText:
//
// An invalid FILTERSPEC was found in the QOS provider-specific buffer.
//
#define WSA_QOS_EPSFILTERSPEC            11028L

//
// MessageId: WSA_QOS_ESDMODEOBJ
//
// MessageText:
//
// An invalid shape discard mode object was found in the QOS provider specific buffer.
//
#define WSA_QOS_ESDMODEOBJ               11029L

//
// MessageId: WSA_QOS_ESHAPERATEOBJ
//
// MessageText:
//
// An invalid shaping rate object was found in the QOS provider-specific buffer.
//
#define WSA_QOS_ESHAPERATEOBJ            11030L

//
// MessageId: WSA_QOS_RESERVED_PETYPE
//
// MessageText:
//
// A reserved policy element was found in the QOS provider-specific buffer.
//
#define WSA_QOS_RESERVED_PETYPE          11031L

#endif // defined(WSABASEERR)

///////////////////////////////////////////////////
//                                               //
//           End of WinSock Error Codes          //
//                                               //
//                 10000 to 11999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                12000 to 129999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//           Start of IPSec Error codes          //
//                                               //
//                 13000 to 13999                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_IPSEC_QM_POLICY_EXISTS
//
// MessageText:
//
// The specified quick mode policy already exists.
//
#define ERROR_IPSEC_QM_POLICY_EXISTS     13000L

//
// MessageId: ERROR_IPSEC_QM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified quick mode policy was not found.
//
#define ERROR_IPSEC_QM_POLICY_NOT_FOUND  13001L

//
// MessageId: ERROR_IPSEC_QM_POLICY_IN_USE
//
// MessageText:
//
// The specified quick mode policy is being used.
//
#define ERROR_IPSEC_QM_POLICY_IN_USE     13002L

//
// MessageId: ERROR_IPSEC_MM_POLICY_EXISTS
//
// MessageText:
//
// The specified main mode policy already exists.
//
#define ERROR_IPSEC_MM_POLICY_EXISTS     13003L

//
// MessageId: ERROR_IPSEC_MM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified main mode policy was not found
//
#define ERROR_IPSEC_MM_POLICY_NOT_FOUND  13004L

//
// MessageId: ERROR_IPSEC_MM_POLICY_IN_USE
//
// MessageText:
//
// The specified main mode policy is being used.
//
#define ERROR_IPSEC_MM_POLICY_IN_USE     13005L

//
// MessageId: ERROR_IPSEC_MM_FILTER_EXISTS
//
// MessageText:
//
// The specified main mode filter already exists.
//
#define ERROR_IPSEC_MM_FILTER_EXISTS     13006L

//
// MessageId: ERROR_IPSEC_MM_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified main mode filter was not found.
//
#define ERROR_IPSEC_MM_FILTER_NOT_FOUND  13007L

//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_EXISTS
//
// MessageText:
//
// The specified transport mode filter already exists.
//
#define ERROR_IPSEC_TRANSPORT_FILTER_EXISTS 13008L

//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified transport mode filter does not exist.
//
#define ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND 13009L

//
// MessageId: ERROR_IPSEC_MM_AUTH_EXISTS
//
// MessageText:
//
// The specified main mode authentication list exists.
//
#define ERROR_IPSEC_MM_AUTH_EXISTS       13010L

//
// MessageId: ERROR_IPSEC_MM_AUTH_NOT_FOUND
//
// MessageText:
//
// The specified main mode authentication list was not found.
//
#define ERROR_IPSEC_MM_AUTH_NOT_FOUND    13011L

//
// MessageId: ERROR_IPSEC_MM_AUTH_IN_USE
//
// MessageText:
//
// The specified main mode authentication list is being used.
//
#define ERROR_IPSEC_MM_AUTH_IN_USE       13012L

//
// MessageId: ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified default main mode policy was not found.
//
#define ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND 13013L

//
// MessageId: ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND
//
// MessageText:
//
// The specified default main mode authentication list was not found.
//
#define ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND 13014L

//
// MessageId: ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified default quick mode policy was not found.
//
#define ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND 13015L

//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_EXISTS
//
// MessageText:
//
// The specified tunnel mode filter exists.
//
#define ERROR_IPSEC_TUNNEL_FILTER_EXISTS 13016L

//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified tunnel mode filter was not found.
//
#define ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND 13017L

//
// MessageId: ERROR_IPSEC_MM_FILTER_PENDING_DELETION
//
// MessageText:
//
// The Main Mode filter is pending deletion.
//
#define ERROR_IPSEC_MM_FILTER_PENDING_DELETION 13018L

//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION
//
// MessageText:
//
// The transport filter is pending deletion.
//
#define ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION 13019L

//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION
//
// MessageText:
//
// The tunnel filter is pending deletion.
//
#define ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION 13020L

//
// MessageId: ERROR_IPSEC_MM_POLICY_PENDING_DELETION
//
// MessageText:
//
// The Main Mode policy is pending deletion.
//
#define ERROR_IPSEC_MM_POLICY_PENDING_DELETION 13021L

//
// MessageId: ERROR_IPSEC_MM_AUTH_PENDING_DELETION
//
// MessageText:
//
// The Main Mode authentication bundle is pending deletion.
//
#define ERROR_IPSEC_MM_AUTH_PENDING_DELETION 13022L

//
// MessageId: ERROR_IPSEC_QM_POLICY_PENDING_DELETION
//
// MessageText:
//
// The Quick Mode policy is pending deletion.
//
#define ERROR_IPSEC_QM_POLICY_PENDING_DELETION 13023L

//
// MessageId: WARNING_IPSEC_MM_POLICY_PRUNED
//
// MessageText:
//
// The Main Mode policy was successfully added, but some of the requested offers are not supported.
//
#define WARNING_IPSEC_MM_POLICY_PRUNED   13024L

//
// MessageId: WARNING_IPSEC_QM_POLICY_PRUNED
//
// MessageText:
//
// The Quick Mode policy was successfully added, but some of the requested offers are not supported.
//
#define WARNING_IPSEC_QM_POLICY_PRUNED   13025L

//
// MessageId: ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
//
// MessageText:
//
//  ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
//
#define ERROR_IPSEC_IKE_NEG_STATUS_BEGIN 13800L

//
// MessageId: ERROR_IPSEC_IKE_AUTH_FAIL
//
// MessageText:
//
// IKE authentication credentials are unacceptable
//
#define ERROR_IPSEC_IKE_AUTH_FAIL        13801L

//
// MessageId: ERROR_IPSEC_IKE_ATTRIB_FAIL
//
// MessageText:
//
// IKE security attributes are unacceptable
//
#define ERROR_IPSEC_IKE_ATTRIB_FAIL      13802L

//
// MessageId: ERROR_IPSEC_IKE_NEGOTIATION_PENDING
//
// MessageText:
//
// IKE Negotiation in progress
//
#define ERROR_IPSEC_IKE_NEGOTIATION_PENDING 13803L

//
// MessageId: ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR
//
// MessageText:
//
// General processing error
//
#define ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR 13804L

//
// MessageId: ERROR_IPSEC_IKE_TIMED_OUT
//
// MessageText:
//
// Negotiation timed out
//
#define ERROR_IPSEC_IKE_TIMED_OUT        13805L

//
// MessageId: ERROR_IPSEC_IKE_NO_CERT
//
// MessageText:
//
// IKE failed to find valid machine certificate. Contact your Network Security Administrator about installing a valid certificate in the appropriate Certificate Store.
//
#define ERROR_IPSEC_IKE_NO_CERT          13806L

//
// MessageId: ERROR_IPSEC_IKE_SA_DELETED
//
// MessageText:
//
// IKE SA deleted by peer before establishment completed
//
#define ERROR_IPSEC_IKE_SA_DELETED       13807L

//
// MessageId: ERROR_IPSEC_IKE_SA_REAPED
//
// MessageText:
//
// IKE SA deleted before establishment completed
//
#define ERROR_IPSEC_IKE_SA_REAPED        13808L

//
// MessageId: ERROR_IPSEC_IKE_MM_ACQUIRE_DROP
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
#define ERROR_IPSEC_IKE_MM_ACQUIRE_DROP  13809L

//
// MessageId: ERROR_IPSEC_IKE_QM_ACQUIRE_DROP
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
#define ERROR_IPSEC_IKE_QM_ACQUIRE_DROP  13810L

//
// MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_MM
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
#define ERROR_IPSEC_IKE_QUEUE_DROP_MM    13811L

//
// MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM
//
// MessageText:
//
// Negotiation request sat in Queue too long
//
#define ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM 13812L

//
// MessageId: ERROR_IPSEC_IKE_DROP_NO_RESPONSE
//
// MessageText:
//
// No response from peer
//
#define ERROR_IPSEC_IKE_DROP_NO_RESPONSE 13813L

//
// MessageId: ERROR_IPSEC_IKE_MM_DELAY_DROP
//
// MessageText:
//
// Negotiation took too long
//
#define ERROR_IPSEC_IKE_MM_DELAY_DROP    13814L

//
// MessageId: ERROR_IPSEC_IKE_QM_DELAY_DROP
//
// MessageText:
//
// Negotiation took too long
//
#define ERROR_IPSEC_IKE_QM_DELAY_DROP    13815L

//
// MessageId: ERROR_IPSEC_IKE_ERROR
//
// MessageText:
//
// Unknown error occurred
//
#define ERROR_IPSEC_IKE_ERROR            13816L

//
// MessageId: ERROR_IPSEC_IKE_CRL_FAILED
//
// MessageText:
//
// Certificate Revocation Check failed
//
#define ERROR_IPSEC_IKE_CRL_FAILED       13817L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_KEY_USAGE
//
// MessageText:
//
// Invalid certificate key usage
//
#define ERROR_IPSEC_IKE_INVALID_KEY_USAGE 13818L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_CERT_TYPE
//
// MessageText:
//
// Invalid certificate type
//
#define ERROR_IPSEC_IKE_INVALID_CERT_TYPE 13819L

//
// MessageId: ERROR_IPSEC_IKE_NO_PRIVATE_KEY
//
// MessageText:
//
// IKE negotiation failed because the machine certificate used does not have a private key. IPsec certificates require a private key. Contact your Network Security administrator about replacing with a certificate that has a private key.
//
#define ERROR_IPSEC_IKE_NO_PRIVATE_KEY   13820L

//
// MessageId: ERROR_IPSEC_IKE_DH_FAIL
//
// MessageText:
//
// Failure in Diffie-Helman computation
//
#define ERROR_IPSEC_IKE_DH_FAIL          13822L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HEADER
//
// MessageText:
//
// Invalid header
//
#define ERROR_IPSEC_IKE_INVALID_HEADER   13824L

//
// MessageId: ERROR_IPSEC_IKE_NO_POLICY
//
// MessageText:
//
// No policy configured
//
#define ERROR_IPSEC_IKE_NO_POLICY        13825L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_SIGNATURE
//
// MessageText:
//
// Failed to verify signature
//
#define ERROR_IPSEC_IKE_INVALID_SIGNATURE 13826L

//
// MessageId: ERROR_IPSEC_IKE_KERBEROS_ERROR
//
// MessageText:
//
// Failed to authenticate using kerberos
//
#define ERROR_IPSEC_IKE_KERBEROS_ERROR   13827L

//
// MessageId: ERROR_IPSEC_IKE_NO_PUBLIC_KEY
//
// MessageText:
//
// Peer's certificate did not have a public key
//
#define ERROR_IPSEC_IKE_NO_PUBLIC_KEY    13828L

// These must stay as a unit.
//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR
//
// MessageText:
//
// Error processing error payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR      13829L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_SA
//
// MessageText:
//
// Error processing SA payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_SA   13830L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_PROP
//
// MessageText:
//
// Error processing Proposal payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_PROP 13831L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_TRANS
//
// MessageText:
//
// Error processing Transform payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_TRANS 13832L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_KE
//
// MessageText:
//
// Error processing KE payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_KE   13833L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_ID
//
// MessageText:
//
// Error processing ID payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_ID   13834L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT
//
// MessageText:
//
// Error processing Cert payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_CERT 13835L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ
//
// MessageText:
//
// Error processing Certificate Request payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ 13836L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_HASH
//
// MessageText:
//
// Error processing Hash payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_HASH 13837L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_SIG
//
// MessageText:
//
// Error processing Signature payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_SIG  13838L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NONCE
//
// MessageText:
//
// Error processing Nonce payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_NONCE 13839L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY
//
// MessageText:
//
// Error processing Notify payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY 13840L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_DELETE
//
// MessageText:
//
// Error processing Delete Payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_DELETE 13841L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR
//
// MessageText:
//
// Error processing VendorId payload
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR 13842L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_PAYLOAD
//
// MessageText:
//
// Invalid payload received
//
#define ERROR_IPSEC_IKE_INVALID_PAYLOAD  13843L

//
// MessageId: ERROR_IPSEC_IKE_LOAD_SOFT_SA
//
// MessageText:
//
// Soft SA loaded
//
#define ERROR_IPSEC_IKE_LOAD_SOFT_SA     13844L

//
// MessageId: ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN
//
// MessageText:
//
// Soft SA torn down
//
#define ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN 13845L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_COOKIE
//
// MessageText:
//
// Invalid cookie received.
//
#define ERROR_IPSEC_IKE_INVALID_COOKIE   13846L

//
// MessageId: ERROR_IPSEC_IKE_NO_PEER_CERT
//
// MessageText:
//
// Peer failed to send valid machine certificate
//
#define ERROR_IPSEC_IKE_NO_PEER_CERT     13847L

//
// MessageId: ERROR_IPSEC_IKE_PEER_CRL_FAILED
//
// MessageText:
//
// Certification Revocation check of peer's certificate failed
//
#define ERROR_IPSEC_IKE_PEER_CRL_FAILED  13848L

//
// MessageId: ERROR_IPSEC_IKE_POLICY_CHANGE
//
// MessageText:
//
// New policy invalidated SAs formed with old policy
//
#define ERROR_IPSEC_IKE_POLICY_CHANGE    13849L

//
// MessageId: ERROR_IPSEC_IKE_NO_MM_POLICY
//
// MessageText:
//
// There is no available Main Mode IKE policy.
//
#define ERROR_IPSEC_IKE_NO_MM_POLICY     13850L

//
// MessageId: ERROR_IPSEC_IKE_NOTCBPRIV
//
// MessageText:
//
// Failed to enabled TCB privilege.
//
#define ERROR_IPSEC_IKE_NOTCBPRIV        13851L

//
// MessageId: ERROR_IPSEC_IKE_SECLOADFAIL
//
// MessageText:
//
// Failed to load SECURITY.DLL.
//
#define ERROR_IPSEC_IKE_SECLOADFAIL      13852L

//
// MessageId: ERROR_IPSEC_IKE_FAILSSPINIT
//
// MessageText:
//
// Failed to obtain security function table dispatch address from SSPI.
//
#define ERROR_IPSEC_IKE_FAILSSPINIT      13853L

//
// MessageId: ERROR_IPSEC_IKE_FAILQUERYSSP
//
// MessageText:
//
// Failed to query Kerberos package to obtain max token size.
//
#define ERROR_IPSEC_IKE_FAILQUERYSSP     13854L

//
// MessageId: ERROR_IPSEC_IKE_SRVACQFAIL
//
// MessageText:
//
// Failed to obtain Kerberos server credentials for ISAKMP/ERROR_IPSEC_IKE service. Kerberos authentication will not function. The most likely reason for this is lack of domain membership. This is normal if your computer is a member of a workgroup.
//
#define ERROR_IPSEC_IKE_SRVACQFAIL       13855L

//
// MessageId: ERROR_IPSEC_IKE_SRVQUERYCRED
//
// MessageText:
//
// Failed to determine SSPI principal name for ISAKMP/ERROR_IPSEC_IKE service (QueryCredentialsAttributes).
//
#define ERROR_IPSEC_IKE_SRVQUERYCRED     13856L

//
// MessageId: ERROR_IPSEC_IKE_GETSPIFAIL
//
// MessageText:
//
// Failed to obtain new SPI for the inbound SA from Ipsec driver. The most common cause for this is that the driver does not have the correct filter. Check your policy to verify the filters.
//
#define ERROR_IPSEC_IKE_GETSPIFAIL       13857L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_FILTER
//
// MessageText:
//
// Given filter is invalid
//
#define ERROR_IPSEC_IKE_INVALID_FILTER   13858L

//
// MessageId: ERROR_IPSEC_IKE_OUT_OF_MEMORY
//
// MessageText:
//
// Memory allocation failed.
//
#define ERROR_IPSEC_IKE_OUT_OF_MEMORY    13859L

//
// MessageId: ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED
//
// MessageText:
//
// Failed to add Security Association to IPSec Driver. The most common cause for this is if the IKE negotiation took too long to complete. If the problem persists, reduce the load on the faulting machine.
//
#define ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED 13860L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_POLICY
//
// MessageText:
//
// Invalid policy
//
#define ERROR_IPSEC_IKE_INVALID_POLICY   13861L

//
// MessageId: ERROR_IPSEC_IKE_UNKNOWN_DOI
//
// MessageText:
//
// Invalid DOI
//
#define ERROR_IPSEC_IKE_UNKNOWN_DOI      13862L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_SITUATION
//
// MessageText:
//
// Invalid situation
//
#define ERROR_IPSEC_IKE_INVALID_SITUATION 13863L

//
// MessageId: ERROR_IPSEC_IKE_DH_FAILURE
//
// MessageText:
//
// Diffie-Hellman failure
//
#define ERROR_IPSEC_IKE_DH_FAILURE       13864L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_GROUP
//
// MessageText:
//
// Invalid Diffie-Hellman group
//
#define ERROR_IPSEC_IKE_INVALID_GROUP    13865L

//
// MessageId: ERROR_IPSEC_IKE_ENCRYPT
//
// MessageText:
//
// Error encrypting payload
//
#define ERROR_IPSEC_IKE_ENCRYPT          13866L

//
// MessageId: ERROR_IPSEC_IKE_DECRYPT
//
// MessageText:
//
// Error decrypting payload
//
#define ERROR_IPSEC_IKE_DECRYPT          13867L

//
// MessageId: ERROR_IPSEC_IKE_POLICY_MATCH
//
// MessageText:
//
// Policy match error
//
#define ERROR_IPSEC_IKE_POLICY_MATCH     13868L

//
// MessageId: ERROR_IPSEC_IKE_UNSUPPORTED_ID
//
// MessageText:
//
// Unsupported ID
//
#define ERROR_IPSEC_IKE_UNSUPPORTED_ID   13869L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HASH
//
// MessageText:
//
// Hash verification failed
//
#define ERROR_IPSEC_IKE_INVALID_HASH     13870L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HASH_ALG
//
// MessageText:
//
// Invalid hash algorithm
//
#define ERROR_IPSEC_IKE_INVALID_HASH_ALG 13871L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_HASH_SIZE
//
// MessageText:
//
// Invalid hash size
//
#define ERROR_IPSEC_IKE_INVALID_HASH_SIZE 13872L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG
//
// MessageText:
//
// Invalid encryption algorithm
//
#define ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG 13873L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_AUTH_ALG
//
// MessageText:
//
// Invalid authentication algorithm
//
#define ERROR_IPSEC_IKE_INVALID_AUTH_ALG 13874L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_SIG
//
// MessageText:
//
// Invalid certificate signature
//
#define ERROR_IPSEC_IKE_INVALID_SIG      13875L

//
// MessageId: ERROR_IPSEC_IKE_LOAD_FAILED
//
// MessageText:
//
// Load failed
//
#define ERROR_IPSEC_IKE_LOAD_FAILED      13876L

//
// MessageId: ERROR_IPSEC_IKE_RPC_DELETE
//
// MessageText:
//
// Deleted via RPC call
//
#define ERROR_IPSEC_IKE_RPC_DELETE       13877L

//
// MessageId: ERROR_IPSEC_IKE_BENIGN_REINIT
//
// MessageText:
//
// Temporary state created to perform reinit. This is not a real failure.
//
#define ERROR_IPSEC_IKE_BENIGN_REINIT    13878L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY
//
// MessageText:
//
// The lifetime value received in the Responder Lifetime Notify is below the Windows 2000 configured minimum value. Please fix the policy on the peer machine.
//
#define ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY 13879L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN
//
// MessageText:
//
// Key length in certificate is too small for configured security requirements.
//
#define ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN 13881L

//
// MessageId: ERROR_IPSEC_IKE_MM_LIMIT
//
// MessageText:
//
// Max number of established MM SAs to peer exceeded.
//
#define ERROR_IPSEC_IKE_MM_LIMIT         13882L

//
// MessageId: ERROR_IPSEC_IKE_NEGOTIATION_DISABLED
//
// MessageText:
//
// IKE received a policy that disables negotiation.
//
#define ERROR_IPSEC_IKE_NEGOTIATION_DISABLED 13883L

//
// MessageId: ERROR_IPSEC_IKE_QM_LIMIT
//
// MessageText:
//
// Reached maximum quick mode limit for the main mode. New main mode will be started.
//
#define ERROR_IPSEC_IKE_QM_LIMIT         13884L

//
// MessageId: ERROR_IPSEC_IKE_MM_EXPIRED
//
// MessageText:
//
// Main mode SA lifetime expired or peer sent a main mode delete.
//
#define ERROR_IPSEC_IKE_MM_EXPIRED       13885L

//
// MessageId: ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID
//
// MessageText:
//
// Main mode SA assumed to be invalid because peer stopped responding.
//
#define ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID 13886L

//
// MessageId: ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH
//
// MessageText:
//
// Certificate doesn't chain to a trusted root in IPsec policy.
//
#define ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH 13887L

//
// MessageId: ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID
//
// MessageText:
//
// Received unexpected message ID.
//
#define ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID 13888L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD
//
// MessageText:
//
// Received invalid authentication offers.
//
#define ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD 13889L

//
// MessageId: ERROR_IPSEC_IKE_DOS_COOKIE_SENT
//
// MessageText:
//
// Sent DOS cookie notify to intiator.
//
#define ERROR_IPSEC_IKE_DOS_COOKIE_SENT  13890L

//
// MessageId: ERROR_IPSEC_IKE_SHUTTING_DOWN
//
// MessageText:
//
// IKE service is shutting down.
//
#define ERROR_IPSEC_IKE_SHUTTING_DOWN    13891L

//
// MessageId: ERROR_IPSEC_IKE_CGA_AUTH_FAILED
//
// MessageText:
//
// Could not verify binding between CGA address and certificate.
//
#define ERROR_IPSEC_IKE_CGA_AUTH_FAILED  13892L

//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NATOA
//
// MessageText:
//
// Error processing NatOA payload.
//
#define ERROR_IPSEC_IKE_PROCESS_ERR_NATOA 13893L

//
// MessageId: ERROR_IPSEC_IKE_INVALID_MM_FOR_QM
//
// MessageText:
//
// Parameters of the main mode are invalid for this quick mode.
//
#define ERROR_IPSEC_IKE_INVALID_MM_FOR_QM 13894L

//
// MessageId: ERROR_IPSEC_IKE_QM_EXPIRED
//
// MessageText:
//
// Quick mode SA was expired by IPsec driver.
//
#define ERROR_IPSEC_IKE_QM_EXPIRED       13895L

//
// MessageId: ERROR_IPSEC_IKE_TOO_MANY_FILTERS
//
// MessageText:
//
// Too many dynamically added IKEEXT filters were detected.
//
#define ERROR_IPSEC_IKE_TOO_MANY_FILTERS 13896L

//
// MessageId: ERROR_IPSEC_IKE_NEG_STATUS_END
//
// MessageText:
//
//  ERROR_IPSEC_IKE_NEG_STATUS_END
//
#define ERROR_IPSEC_IKE_NEG_STATUS_END   13897L

//
// Following error codes are returned by IPsec kernel.
//
//
// MessageId: ERROR_IPSEC_BAD_SPI
//
// MessageText:
//
// The SPI in the packet does not match a valid IPsec SA.
//
#define ERROR_IPSEC_BAD_SPI              13910L

//
// MessageId: ERROR_IPSEC_SA_LIFETIME_EXPIRED
//
// MessageText:
//
// Packet was received on an IPsec SA whose lifetime has expired.
//
#define ERROR_IPSEC_SA_LIFETIME_EXPIRED  13911L

//
// MessageId: ERROR_IPSEC_WRONG_SA
//
// MessageText:
//
// Packet was received on an IPsec SA that doesn't match the packet characteristics.
//
#define ERROR_IPSEC_WRONG_SA             13912L

//
// MessageId: ERROR_IPSEC_REPLAY_CHECK_FAILED
//
// MessageText:
//
// Packet sequence number replay check failed.
//
#define ERROR_IPSEC_REPLAY_CHECK_FAILED  13913L

//
// MessageId: ERROR_IPSEC_INVALID_PACKET
//
// MessageText:
//
// IPsec header and/or trailer in the packet is invalid.
//
#define ERROR_IPSEC_INVALID_PACKET       13914L

//
// MessageId: ERROR_IPSEC_INTEGRITY_CHECK_FAILED
//
// MessageText:
//
// IPsec integrity check failed.
//
#define ERROR_IPSEC_INTEGRITY_CHECK_FAILED 13915L

//
// MessageId: ERROR_IPSEC_CLEAR_TEXT_DROP
//
// MessageText:
//
// IPsec dropped a clear text packet.
//
#define ERROR_IPSEC_CLEAR_TEXT_DROP      13916L


///////////////////////////////////////////////////
//                                               //
//           End of IPSec Error codes            //
//                                               //
//                 13000 to 13999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//         Start of Side By Side Error Codes     //
//                                               //
//                 14000 to 14999                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_SXS_SECTION_NOT_FOUND
//
// MessageText:
//
// The requested section was not present in the activation context.
//
#define ERROR_SXS_SECTION_NOT_FOUND      14000L

//
// MessageId: ERROR_SXS_CANT_GEN_ACTCTX
//
// MessageText:
//
// The application has failed to start because its side-by-side configuration is incorrect. Please see the application event log for more detail.
//
#define ERROR_SXS_CANT_GEN_ACTCTX        14001L

//
// MessageId: ERROR_SXS_INVALID_ACTCTXDATA_FORMAT
//
// MessageText:
//
// The application binding data format is invalid.
//
#define ERROR_SXS_INVALID_ACTCTXDATA_FORMAT 14002L

//
// MessageId: ERROR_SXS_ASSEMBLY_NOT_FOUND
//
// MessageText:
//
// The referenced assembly is not installed on your system.
//
#define ERROR_SXS_ASSEMBLY_NOT_FOUND     14003L

//
// MessageId: ERROR_SXS_MANIFEST_FORMAT_ERROR
//
// MessageText:
//
// The manifest file does not begin with the required tag and format information.
//
#define ERROR_SXS_MANIFEST_FORMAT_ERROR  14004L

//
// MessageId: ERROR_SXS_MANIFEST_PARSE_ERROR
//
// MessageText:
//
// The manifest file contains one or more syntax errors.
//
#define ERROR_SXS_MANIFEST_PARSE_ERROR   14005L

//
// MessageId: ERROR_SXS_ACTIVATION_CONTEXT_DISABLED
//
// MessageText:
//
// The application attempted to activate a disabled activation context.
//
#define ERROR_SXS_ACTIVATION_CONTEXT_DISABLED 14006L

//
// MessageId: ERROR_SXS_KEY_NOT_FOUND
//
// MessageText:
//
// The requested lookup key was not found in any active activation context.
//
#define ERROR_SXS_KEY_NOT_FOUND          14007L

//
// MessageId: ERROR_SXS_VERSION_CONFLICT
//
// MessageText:
//
// A component version required by the application conflicts with another component version already active.
//
#define ERROR_SXS_VERSION_CONFLICT       14008L

//
// MessageId: ERROR_SXS_WRONG_SECTION_TYPE
//
// MessageText:
//
// The type requested activation context section does not match the query API used.
//
#define ERROR_SXS_WRONG_SECTION_TYPE     14009L

//
// MessageId: ERROR_SXS_THREAD_QUERIES_DISABLED
//
// MessageText:
//
// Lack of system resources has required isolated activation to be disabled for the current thread of execution.
//
#define ERROR_SXS_THREAD_QUERIES_DISABLED 14010L

//
// MessageId: ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET
//
// MessageText:
//
// An attempt to set the process default activation context failed because the process default activation context was already set.
//
#define ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET 14011L

//
// MessageId: ERROR_SXS_UNKNOWN_ENCODING_GROUP
//
// MessageText:
//
// The encoding group identifier specified is not recognized.
//
#define ERROR_SXS_UNKNOWN_ENCODING_GROUP 14012L

//
// MessageId: ERROR_SXS_UNKNOWN_ENCODING
//
// MessageText:
//
// The encoding requested is not recognized.
//
#define ERROR_SXS_UNKNOWN_ENCODING       14013L

//
// MessageId: ERROR_SXS_INVALID_XML_NAMESPACE_URI
//
// MessageText:
//
// The manifest contains a reference to an invalid URI.
//
#define ERROR_SXS_INVALID_XML_NAMESPACE_URI 14014L

//
// MessageId: ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED
//
// MessageText:
//
// The application manifest contains a reference to a dependent assembly which is not installed
//
#define ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED 14015L

//
// MessageId: ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED
//
// MessageText:
//
// The manifest for an assembly used by the application has a reference to a dependent assembly which is not installed
//
#define ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED 14016L

//
// MessageId: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE
//
// MessageText:
//
// The manifest contains an attribute for the assembly identity which is not valid.
//
#define ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE 14017L

//
// MessageId: ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE
//
// MessageText:
//
// The manifest is missing the required default namespace specification on the assembly element.
//
#define ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE 14018L

//
// MessageId: ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE
//
// MessageText:
//
// The manifest has a default namespace specified on the assembly element but its value is not "urn:schemas-microsoft-com:asm.v1".
//
#define ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE 14019L

//
// MessageId: ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT
//
// MessageText:
//
// The private manifest probed has crossed reparse-point-associated path
//
#define ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT 14020L

//
// MessageId: ERROR_SXS_DUPLICATE_DLL_NAME
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have files by the same name.
//
#define ERROR_SXS_DUPLICATE_DLL_NAME     14021L

//
// MessageId: ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have window classes with the same name.
//
#define ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME 14022L

//
// MessageId: ERROR_SXS_DUPLICATE_CLSID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have the same COM server CLSIDs.
//
#define ERROR_SXS_DUPLICATE_CLSID        14023L

//
// MessageId: ERROR_SXS_DUPLICATE_IID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have proxies for the same COM interface IIDs.
//
#define ERROR_SXS_DUPLICATE_IID          14024L

//
// MessageId: ERROR_SXS_DUPLICATE_TLBID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have the same COM type library TLBIDs.
//
#define ERROR_SXS_DUPLICATE_TLBID        14025L

//
// MessageId: ERROR_SXS_DUPLICATE_PROGID
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest have the same COM ProgIDs.
//
#define ERROR_SXS_DUPLICATE_PROGID       14026L

//
// MessageId: ERROR_SXS_DUPLICATE_ASSEMBLY_NAME
//
// MessageText:
//
// Two or more components referenced directly or indirectly by the application manifest are different versions of the same component which is not permitted.
//
#define ERROR_SXS_DUPLICATE_ASSEMBLY_NAME 14027L

//
// MessageId: ERROR_SXS_FILE_HASH_MISMATCH
//
// MessageText:
//
// A component's file does not match the verification information present in the component manifest.
//
#define ERROR_SXS_FILE_HASH_MISMATCH     14028L

//
// MessageId: ERROR_SXS_POLICY_PARSE_ERROR
//
// MessageText:
//
// The policy manifest contains one or more syntax errors.
//
#define ERROR_SXS_POLICY_PARSE_ERROR     14029L

//
// MessageId: ERROR_SXS_XML_E_MISSINGQUOTE
//
// MessageText:
//
// Manifest Parse Error : A string literal was expected, but no opening quote character was found.
//
#define ERROR_SXS_XML_E_MISSINGQUOTE     14030L

//
// MessageId: ERROR_SXS_XML_E_COMMENTSYNTAX
//
// MessageText:
//
// Manifest Parse Error : Incorrect syntax was used in a comment.
//
#define ERROR_SXS_XML_E_COMMENTSYNTAX    14031L

//
// MessageId: ERROR_SXS_XML_E_BADSTARTNAMECHAR
//
// MessageText:
//
// Manifest Parse Error : A name was started with an invalid character.
//
#define ERROR_SXS_XML_E_BADSTARTNAMECHAR 14032L

//
// MessageId: ERROR_SXS_XML_E_BADNAMECHAR
//
// MessageText:
//
// Manifest Parse Error : A name contained an invalid character.
//
#define ERROR_SXS_XML_E_BADNAMECHAR      14033L

//
// MessageId: ERROR_SXS_XML_E_BADCHARINSTRING
//
// MessageText:
//
// Manifest Parse Error : A string literal contained an invalid character.
//
#define ERROR_SXS_XML_E_BADCHARINSTRING  14034L

//
// MessageId: ERROR_SXS_XML_E_XMLDECLSYNTAX
//
// MessageText:
//
// Manifest Parse Error : Invalid syntax for an xml declaration.
//
#define ERROR_SXS_XML_E_XMLDECLSYNTAX    14035L

//
// MessageId: ERROR_SXS_XML_E_BADCHARDATA
//
// MessageText:
//
// Manifest Parse Error : An Invalid character was found in text content.
//
#define ERROR_SXS_XML_E_BADCHARDATA      14036L

//
// MessageId: ERROR_SXS_XML_E_MISSINGWHITESPACE
//
// MessageText:
//
// Manifest Parse Error : Required white space was missing.
//
#define ERROR_SXS_XML_E_MISSINGWHITESPACE 14037L

//
// MessageId: ERROR_SXS_XML_E_EXPECTINGTAGEND
//
// MessageText:
//
// Manifest Parse Error : The character '>' was expected.
//
#define ERROR_SXS_XML_E_EXPECTINGTAGEND  14038L

//
// MessageId: ERROR_SXS_XML_E_MISSINGSEMICOLON
//
// MessageText:
//
// Manifest Parse Error : A semi colon character was expected.
//
#define ERROR_SXS_XML_E_MISSINGSEMICOLON 14039L

//
// MessageId: ERROR_SXS_XML_E_UNBALANCEDPAREN
//
// MessageText:
//
// Manifest Parse Error : Unbalanced parentheses.
//
#define ERROR_SXS_XML_E_UNBALANCEDPAREN  14040L

//
// MessageId: ERROR_SXS_XML_E_INTERNALERROR
//
// MessageText:
//
// Manifest Parse Error : Internal error.
//
#define ERROR_SXS_XML_E_INTERNALERROR    14041L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE
//
// MessageText:
//
// Manifest Parse Error : Whitespace is not allowed at this location.
//
#define ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE 14042L

//
// MessageId: ERROR_SXS_XML_E_INCOMPLETE_ENCODING
//
// MessageText:
//
// Manifest Parse Error : End of file reached in invalid state for current encoding.
//
#define ERROR_SXS_XML_E_INCOMPLETE_ENCODING 14043L

//
// MessageId: ERROR_SXS_XML_E_MISSING_PAREN
//
// MessageText:
//
// Manifest Parse Error : Missing parenthesis.
//
#define ERROR_SXS_XML_E_MISSING_PAREN    14044L

//
// MessageId: ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE
//
// MessageText:
//
// Manifest Parse Error : A single or double closing quote character (\' or \") is missing.
//
#define ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE 14045L

//
// MessageId: ERROR_SXS_XML_E_MULTIPLE_COLONS
//
// MessageText:
//
// Manifest Parse Error : Multiple colons are not allowed in a name.
//
#define ERROR_SXS_XML_E_MULTIPLE_COLONS  14046L

//
// MessageId: ERROR_SXS_XML_E_INVALID_DECIMAL
//
// MessageText:
//
// Manifest Parse Error : Invalid character for decimal digit.
//
#define ERROR_SXS_XML_E_INVALID_DECIMAL  14047L

//
// MessageId: ERROR_SXS_XML_E_INVALID_HEXIDECIMAL
//
// MessageText:
//
// Manifest Parse Error : Invalid character for hexidecimal digit.
//
#define ERROR_SXS_XML_E_INVALID_HEXIDECIMAL 14048L

//
// MessageId: ERROR_SXS_XML_E_INVALID_UNICODE
//
// MessageText:
//
// Manifest Parse Error : Invalid unicode character value for this platform.
//
#define ERROR_SXS_XML_E_INVALID_UNICODE  14049L

//
// MessageId: ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK
//
// MessageText:
//
// Manifest Parse Error : Expecting whitespace or '?'.
//
#define ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK 14050L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTEDENDTAG
//
// MessageText:
//
// Manifest Parse Error : End tag was not expected at this location.
//
#define ERROR_SXS_XML_E_UNEXPECTEDENDTAG 14051L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDTAG
//
// MessageText:
//
// Manifest Parse Error : The following tags were not closed: %1.
//
#define ERROR_SXS_XML_E_UNCLOSEDTAG      14052L

//
// MessageId: ERROR_SXS_XML_E_DUPLICATEATTRIBUTE
//
// MessageText:
//
// Manifest Parse Error : Duplicate attribute.
//
#define ERROR_SXS_XML_E_DUPLICATEATTRIBUTE 14053L

//
// MessageId: ERROR_SXS_XML_E_MULTIPLEROOTS
//
// MessageText:
//
// Manifest Parse Error : Only one top level element is allowed in an XML document.
//
#define ERROR_SXS_XML_E_MULTIPLEROOTS    14054L

//
// MessageId: ERROR_SXS_XML_E_INVALIDATROOTLEVEL
//
// MessageText:
//
// Manifest Parse Error : Invalid at the top level of the document.
//
#define ERROR_SXS_XML_E_INVALIDATROOTLEVEL 14055L

//
// MessageId: ERROR_SXS_XML_E_BADXMLDECL
//
// MessageText:
//
// Manifest Parse Error : Invalid xml declaration.
//
#define ERROR_SXS_XML_E_BADXMLDECL       14056L

//
// MessageId: ERROR_SXS_XML_E_MISSINGROOT
//
// MessageText:
//
// Manifest Parse Error : XML document must have a top level element.
//
#define ERROR_SXS_XML_E_MISSINGROOT      14057L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTEDEOF
//
// MessageText:
//
// Manifest Parse Error : Unexpected end of file.
//
#define ERROR_SXS_XML_E_UNEXPECTEDEOF    14058L

//
// MessageId: ERROR_SXS_XML_E_BADPEREFINSUBSET
//
// MessageText:
//
// Manifest Parse Error : Parameter entities cannot be used inside markup declarations in an internal subset.
//
#define ERROR_SXS_XML_E_BADPEREFINSUBSET 14059L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDSTARTTAG
//
// MessageText:
//
// Manifest Parse Error : Element was not closed.
//
#define ERROR_SXS_XML_E_UNCLOSEDSTARTTAG 14060L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDENDTAG
//
// MessageText:
//
// Manifest Parse Error : End element was missing the character '>'.
//
#define ERROR_SXS_XML_E_UNCLOSEDENDTAG   14061L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDSTRING
//
// MessageText:
//
// Manifest Parse Error : A string literal was not closed.
//
#define ERROR_SXS_XML_E_UNCLOSEDSTRING   14062L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDCOMMENT
//
// MessageText:
//
// Manifest Parse Error : A comment was not closed.
//
#define ERROR_SXS_XML_E_UNCLOSEDCOMMENT  14063L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDDECL
//
// MessageText:
//
// Manifest Parse Error : A declaration was not closed.
//
#define ERROR_SXS_XML_E_UNCLOSEDDECL     14064L

//
// MessageId: ERROR_SXS_XML_E_UNCLOSEDCDATA
//
// MessageText:
//
// Manifest Parse Error : A CDATA section was not closed.
//
#define ERROR_SXS_XML_E_UNCLOSEDCDATA    14065L

//
// MessageId: ERROR_SXS_XML_E_RESERVEDNAMESPACE
//
// MessageText:
//
// Manifest Parse Error : The namespace prefix is not allowed to start with the reserved string "xml".
//
#define ERROR_SXS_XML_E_RESERVEDNAMESPACE 14066L

//
// MessageId: ERROR_SXS_XML_E_INVALIDENCODING
//
// MessageText:
//
// Manifest Parse Error : System does not support the specified encoding.
//
#define ERROR_SXS_XML_E_INVALIDENCODING  14067L

//
// MessageId: ERROR_SXS_XML_E_INVALIDSWITCH
//
// MessageText:
//
// Manifest Parse Error : Switch from current encoding to specified encoding not supported.
//
#define ERROR_SXS_XML_E_INVALIDSWITCH    14068L

//
// MessageId: ERROR_SXS_XML_E_BADXMLCASE
//
// MessageText:
//
// Manifest Parse Error : The name 'xml' is reserved and must be lower case.
//
#define ERROR_SXS_XML_E_BADXMLCASE       14069L

//
// MessageId: ERROR_SXS_XML_E_INVALID_STANDALONE
//
// MessageText:
//
// Manifest Parse Error : The standalone attribute must have the value 'yes' or 'no'.
//
#define ERROR_SXS_XML_E_INVALID_STANDALONE 14070L

//
// MessageId: ERROR_SXS_XML_E_UNEXPECTED_STANDALONE
//
// MessageText:
//
// Manifest Parse Error : The standalone attribute cannot be used in external entities.
//
#define ERROR_SXS_XML_E_UNEXPECTED_STANDALONE 14071L

//
// MessageId: ERROR_SXS_XML_E_INVALID_VERSION
//
// MessageText:
//
// Manifest Parse Error : Invalid version number.
//
#define ERROR_SXS_XML_E_INVALID_VERSION  14072L

//
// MessageId: ERROR_SXS_XML_E_MISSINGEQUALS
//
// MessageText:
//
// Manifest Parse Error : Missing equals sign between attribute and attribute value.
//
#define ERROR_SXS_XML_E_MISSINGEQUALS    14073L

//
// MessageId: ERROR_SXS_PROTECTION_RECOVERY_FAILED
//
// MessageText:
//
// Assembly Protection Error : Unable to recover the specified assembly.
//
#define ERROR_SXS_PROTECTION_RECOVERY_FAILED 14074L

//
// MessageId: ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT
//
// MessageText:
//
// Assembly Protection Error : The public key for an assembly was too short to be allowed.
//
#define ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT 14075L

//
// MessageId: ERROR_SXS_PROTECTION_CATALOG_NOT_VALID
//
// MessageText:
//
// Assembly Protection Error : The catalog for an assembly is not valid, or does not match the assembly's manifest.
//
#define ERROR_SXS_PROTECTION_CATALOG_NOT_VALID 14076L

//
// MessageId: ERROR_SXS_UNTRANSLATABLE_HRESULT
//
// MessageText:
//
// An HRESULT could not be translated to a corresponding Win32 error code.
//
#define ERROR_SXS_UNTRANSLATABLE_HRESULT 14077L

//
// MessageId: ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING
//
// MessageText:
//
// Assembly Protection Error : The catalog for an assembly is missing.
//
#define ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING 14078L

//
// MessageId: ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE
//
// MessageText:
//
// The supplied assembly identity is missing one or more attributes which must be present in this context.
//
#define ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE 14079L

//
// MessageId: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME
//
// MessageText:
//
// The supplied assembly identity has one or more attribute names that contain characters not permitted in XML names.
//
#define ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME 14080L

//
// MessageId: ERROR_SXS_ASSEMBLY_MISSING
//
// MessageText:
//
// The referenced assembly could not be found.
//
#define ERROR_SXS_ASSEMBLY_MISSING       14081L

//
// MessageId: ERROR_SXS_CORRUPT_ACTIVATION_STACK
//
// MessageText:
//
// The activation context activation stack for the running thread of execution is corrupt.
//
#define ERROR_SXS_CORRUPT_ACTIVATION_STACK 14082L

//
// MessageId: ERROR_SXS_CORRUPTION
//
// MessageText:
//
// The application isolation metadata for this process or thread has become corrupt.
//
#define ERROR_SXS_CORRUPTION             14083L

//
// MessageId: ERROR_SXS_EARLY_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated is not the most recently activated one.
//
#define ERROR_SXS_EARLY_DEACTIVATION     14084L

//
// MessageId: ERROR_SXS_INVALID_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated is not active for the current thread of execution.
//
#define ERROR_SXS_INVALID_DEACTIVATION   14085L

//
// MessageId: ERROR_SXS_MULTIPLE_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated has already been deactivated.
//
#define ERROR_SXS_MULTIPLE_DEACTIVATION  14086L

//
// MessageId: ERROR_SXS_PROCESS_TERMINATION_REQUESTED
//
// MessageText:
//
// A component used by the isolation facility has requested to terminate the process.
//
#define ERROR_SXS_PROCESS_TERMINATION_REQUESTED 14087L

//
// MessageId: ERROR_SXS_RELEASE_ACTIVATION_CONTEXT
//
// MessageText:
//
// A kernel mode component is releasing a reference on an activation context.
//
#define ERROR_SXS_RELEASE_ACTIVATION_CONTEXT 14088L

//
// MessageId: ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY
//
// MessageText:
//
// The activation context of system default assembly could not be generated.
//
#define ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY 14089L

//
// MessageId: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE
//
// MessageText:
//
// The value of an attribute in an identity is not within the legal range.
//
#define ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE 14090L

//
// MessageId: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME
//
// MessageText:
//
// The name of an attribute in an identity is not within the legal range.
//
#define ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME 14091L

//
// MessageId: ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE
//
// MessageText:
//
// An identity contains two definitions for the same attribute.
//
#define ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE 14092L

//
// MessageId: ERROR_SXS_IDENTITY_PARSE_ERROR
//
// MessageText:
//
// The identity string is malformed. This may be due to a trailing comma, more than two unnamed attributes, missing attribute name or missing attribute value.
//
#define ERROR_SXS_IDENTITY_PARSE_ERROR   14093L

//
// MessageId: ERROR_MALFORMED_SUBSTITUTION_STRING
//
// MessageText:
//
// A string containing localized substitutable content was malformed. Either a dollar sign ($) was follwed by something other than a left parenthesis or another dollar sign or an substitution's right parenthesis was not found.
//
#define ERROR_MALFORMED_SUBSTITUTION_STRING 14094L

//
// MessageId: ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN
//
// MessageText:
//
// The public key token does not correspond to the public key specified.
//
#define ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN 14095L

//
// MessageId: ERROR_UNMAPPED_SUBSTITUTION_STRING
//
// MessageText:
//
// A substitution string had no mapping.
//
#define ERROR_UNMAPPED_SUBSTITUTION_STRING 14096L

//
// MessageId: ERROR_SXS_ASSEMBLY_NOT_LOCKED
//
// MessageText:
//
// The component must be locked before making the request.
//
#define ERROR_SXS_ASSEMBLY_NOT_LOCKED    14097L

//
// MessageId: ERROR_SXS_COMPONENT_STORE_CORRUPT
//
// MessageText:
//
// The component store has been corrupted.
//
#define ERROR_SXS_COMPONENT_STORE_CORRUPT 14098L

//
// MessageId: ERROR_ADVANCED_INSTALLER_FAILED
//
// MessageText:
//
// An advanced installer failed during setup or servicing.
//
#define ERROR_ADVANCED_INSTALLER_FAILED  14099L

//
// MessageId: ERROR_XML_ENCODING_MISMATCH
//
// MessageText:
//
// The character encoding in the XML declaration did not match the encoding used in the document.
//
#define ERROR_XML_ENCODING_MISMATCH      14100L

//
// MessageId: ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT
//
// MessageText:
//
// The identities of the manifests are identical but their contents are different.
//
#define ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT 14101L

//
// MessageId: ERROR_SXS_IDENTITIES_DIFFERENT
//
// MessageText:
//
// The component identities are different.
//
#define ERROR_SXS_IDENTITIES_DIFFERENT   14102L

//
// MessageId: ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT
//
// MessageText:
//
// The assembly is not a deployment.
//
#define ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT 14103L

//
// MessageId: ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY
//
// MessageText:
//
// The file is not a part of the assembly.
//
#define ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY 14104L

//
// MessageId: ERROR_SXS_MANIFEST_TOO_BIG
//
// MessageText:
//
// The size of the manifest exceeds the maximum allowed.
//
#define ERROR_SXS_MANIFEST_TOO_BIG       14105L

//
// MessageId: ERROR_SXS_SETTING_NOT_REGISTERED
//
// MessageText:
//
// The setting is not registered.
//
#define ERROR_SXS_SETTING_NOT_REGISTERED 14106L

//
// MessageId: ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE
//
// MessageText:
//
// One or more required members of the transaction are not present.
//
#define ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE 14107L

//
// MessageId: ERROR_SMI_PRIMITIVE_INSTALLER_FAILED
//
// MessageText:
//
// The SMI primitive installer failed during setup or servicing.
//
#define ERROR_SMI_PRIMITIVE_INSTALLER_FAILED 14108L

//
// MessageId: ERROR_GENERIC_COMMAND_FAILED
//
// MessageText:
//
// A generic command executable returned a result that indicates failure.
//
#define ERROR_GENERIC_COMMAND_FAILED     14109L

//
// MessageId: ERROR_SXS_FILE_HASH_MISSING
//
// MessageText:
//
// A component is missing file verification information in its manifest.
//
#define ERROR_SXS_FILE_HASH_MISSING      14110L


///////////////////////////////////////////////////
//                                               //
//           End of Side By Side Error Codes     //
//                                               //
//                 14000 to 14999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//           Start of WinEvt Error codes         //
//                                               //
//                 15000 to 15079                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_EVT_INVALID_CHANNEL_PATH
//
// MessageText:
//
// The specified channel path is invalid.
//
#define ERROR_EVT_INVALID_CHANNEL_PATH   15000L

//
// MessageId: ERROR_EVT_INVALID_QUERY
//
// MessageText:
//
// The specified query is invalid.
//
#define ERROR_EVT_INVALID_QUERY          15001L

//
// MessageId: ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND
//
// MessageText:
//
// The publisher metadata cannot be found in the resource.
//
#define ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND 15002L

//
// MessageId: ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND
//
// MessageText:
//
// The template for an event definition cannot be found in the resource (error = %1).
//
#define ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND 15003L

//
// MessageId: ERROR_EVT_INVALID_PUBLISHER_NAME
//
// MessageText:
//
// The specified publisher name is invalid.
//
#define ERROR_EVT_INVALID_PUBLISHER_NAME 15004L

//
// MessageId: ERROR_EVT_INVALID_EVENT_DATA
//
// MessageText:
//
// The event data raised by the publisher is not compatible with the event template definition in the publisher's manifest
//
#define ERROR_EVT_INVALID_EVENT_DATA     15005L

//
// MessageId: ERROR_EVT_CHANNEL_NOT_FOUND
//
// MessageText:
//
// The specified channel could not be found. Check channel configuration.
//
#define ERROR_EVT_CHANNEL_NOT_FOUND      15007L

//
// MessageId: ERROR_EVT_MALFORMED_XML_TEXT
//
// MessageText:
//
// The specified xml text was not well-formed. See Extended Error for more details.
//
#define ERROR_EVT_MALFORMED_XML_TEXT     15008L

//
// MessageId: ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL
//
// MessageText:
//
// The caller is trying to subscribe to a direct channel which is not allowed. The events for a direct channel go directly to a logfile and cannot be subscribed to.
//
#define ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL 15009L

//
// MessageId: ERROR_EVT_CONFIGURATION_ERROR
//
// MessageText:
//
// Configuration error.
//
#define ERROR_EVT_CONFIGURATION_ERROR    15010L

//
// MessageId: ERROR_EVT_QUERY_RESULT_STALE
//
// MessageText:
//
// The query result is stale / invalid. This may be due to the log being cleared or rolling over after the query result was created. Users should handle this code by releasing the query result object and reissuing the query.
//
#define ERROR_EVT_QUERY_RESULT_STALE     15011L

//
// MessageId: ERROR_EVT_QUERY_RESULT_INVALID_POSITION
//
// MessageText:
//
// Query result is currently at an invalid position.
//
#define ERROR_EVT_QUERY_RESULT_INVALID_POSITION 15012L

//
// MessageId: ERROR_EVT_NON_VALIDATING_MSXML
//
// MessageText:
//
// Registered MSXML doesn't support validation.
//
#define ERROR_EVT_NON_VALIDATING_MSXML   15013L

//
// MessageId: ERROR_EVT_FILTER_ALREADYSCOPED
//
// MessageText:
//
// An expression can only be followed by a change of scope operation if it itself evaluates to a node set and is not already part of some other change of scope operation.
//
#define ERROR_EVT_FILTER_ALREADYSCOPED   15014L

//
// MessageId: ERROR_EVT_FILTER_NOTELTSET
//
// MessageText:
//
// Can't perform a step operation from a term that does not represent an element set.
//
#define ERROR_EVT_FILTER_NOTELTSET       15015L

//
// MessageId: ERROR_EVT_FILTER_INVARG
//
// MessageText:
//
// Left hand side arguments to binary operators must be either attributes, nodes or variables and right hand side arguments must be constants.
//
#define ERROR_EVT_FILTER_INVARG          15016L

//
// MessageId: ERROR_EVT_FILTER_INVTEST
//
// MessageText:
//
// A step operation must involve either a node test or, in the case of a predicate, an algebraic expression against which to test each node in the node set identified by the preceeding node set can be evaluated.
//
#define ERROR_EVT_FILTER_INVTEST         15017L

//
// MessageId: ERROR_EVT_FILTER_INVTYPE
//
// MessageText:
//
// This data type is currently unsupported.
//
#define ERROR_EVT_FILTER_INVTYPE         15018L

//
// MessageId: ERROR_EVT_FILTER_PARSEERR
//
// MessageText:
//
// A syntax error occurred at position %1!d!
//
#define ERROR_EVT_FILTER_PARSEERR        15019L

//
// MessageId: ERROR_EVT_FILTER_UNSUPPORTEDOP
//
// MessageText:
//
// This operator is unsupported by this implementation of the filter.
//
#define ERROR_EVT_FILTER_UNSUPPORTEDOP   15020L

//
// MessageId: ERROR_EVT_FILTER_UNEXPECTEDTOKEN
//
// MessageText:
//
// The token encountered was unexpected.
//
#define ERROR_EVT_FILTER_UNEXPECTEDTOKEN 15021L

//
// MessageId: ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL
//
// MessageText:
//
// The requested operation cannot be performed over an enabled direct channel. The channel must first be disabled before performing the requested operation.
//
#define ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL 15022L

//
// MessageId: ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE
//
// MessageText:
//
// Channel property %1!s! contains invalid value. The value has invalid type, is outside of valid range, can't be updated or is not supported by this type of channel.
//
#define ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE 15023L

//
// MessageId: ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE
//
// MessageText:
//
// Publisher property %1!s! contains invalid value. The value has invalid type, is outside of valid range, can't be updated or is not supported by this type of publisher.
//
#define ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE 15024L

//
// MessageId: ERROR_EVT_CHANNEL_CANNOT_ACTIVATE
//
// MessageText:
//
// The channel fails to activate.
//
#define ERROR_EVT_CHANNEL_CANNOT_ACTIVATE 15025L

//
// MessageId: ERROR_EVT_FILTER_TOO_COMPLEX
//
// MessageText:
//
// The xpath expression exceeded supported complexity. Please symplify it or split it into two or more simple expressions.
//
#define ERROR_EVT_FILTER_TOO_COMPLEX     15026L

//
// MessageId: ERROR_EVT_MESSAGE_NOT_FOUND
//
// MessageText:
//
// the message resource is present but the message is not found in the string/message table
//
#define ERROR_EVT_MESSAGE_NOT_FOUND      15027L

//
// MessageId: ERROR_EVT_MESSAGE_ID_NOT_FOUND
//
// MessageText:
//
// The message id for the desired message could not be found.
//
#define ERROR_EVT_MESSAGE_ID_NOT_FOUND   15028L

//
// MessageId: ERROR_EVT_UNRESOLVED_VALUE_INSERT
//
// MessageText:
//
// The substitution string for insert index (%1) could not be found.
//
#define ERROR_EVT_UNRESOLVED_VALUE_INSERT 15029L

//
// MessageId: ERROR_EVT_UNRESOLVED_PARAMETER_INSERT
//
// MessageText:
//
// The description string for parameter reference (%1) could not be found.
//
#define ERROR_EVT_UNRESOLVED_PARAMETER_INSERT 15030L

//
// MessageId: ERROR_EVT_MAX_INSERTS_REACHED
//
// MessageText:
//
// The maximum number of replacements has been reached.
//
#define ERROR_EVT_MAX_INSERTS_REACHED    15031L

//
// MessageId: ERROR_EVT_EVENT_DEFINITION_NOT_FOUND
//
// MessageText:
//
// The event definition could not be found for event id (%1).
//
#define ERROR_EVT_EVENT_DEFINITION_NOT_FOUND 15032L

//
// MessageId: ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND
//
// MessageText:
//
// The locale specific resource for the desired message is not present.
//
#define ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND 15033L

//
// MessageId: ERROR_EVT_VERSION_TOO_OLD
//
// MessageText:
//
// The resource is too old to be compatible.
//
#define ERROR_EVT_VERSION_TOO_OLD        15034L

//
// MessageId: ERROR_EVT_VERSION_TOO_NEW
//
// MessageText:
//
// The resource is too new to be compatible.
//
#define ERROR_EVT_VERSION_TOO_NEW        15035L

//
// MessageId: ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY
//
// MessageText:
//
// The channel at index %1!d! of the query can't be opened.
//
#define ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY 15036L

//
// MessageId: ERROR_EVT_PUBLISHER_DISABLED
//
// MessageText:
//
// The publisher has been disabled and its resource is not avaiable.  This
// usually occurs when the publisher is in the process of being uninstalled
// or upgraded.
//
#define ERROR_EVT_PUBLISHER_DISABLED     15037L

//
// MessageId: ERROR_EVT_FILTER_OUT_OF_RANGE
//
// MessageText:
//
// Attempted to create a numeric type that is outside of its valid range.
//
#define ERROR_EVT_FILTER_OUT_OF_RANGE    15038L


///////////////////////////////////////////////////
//                                               //
//           Start of Wecsvc Error codes         //
//                                               //
//                 15080 to 15099                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE
//
// MessageText:
//
// The subscription fails to activate.
//
#define ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE 15080L

//
// MessageId: ERROR_EC_LOG_DISABLED
//
// MessageText:
//
// The log of the subscription is in disabled state, and can not be used to forward events to. The log must first be enabled before the subscription can be activated.
//
#define ERROR_EC_LOG_DISABLED            15081L

//
// MessageId: ERROR_EC_CIRCULAR_FORWARDING
//
// MessageText:
//
// When forwarding events from local machine to itself, the query of the subscription can't contain target log of the subscription.
//
#define ERROR_EC_CIRCULAR_FORWARDING     15082L

//
// MessageId: ERROR_EC_CREDSTORE_FULL
//
// MessageText:
//
// The credential store that is used to save credentials is full.
//
#define ERROR_EC_CREDSTORE_FULL          15083L

//
// MessageId: ERROR_EC_CRED_NOT_FOUND
//
// MessageText:
//
// The credential used by this subscription can't be found in credential store.
//
#define ERROR_EC_CRED_NOT_FOUND          15084L

//
// MessageId: ERROR_EC_NO_ACTIVE_CHANNEL
//
// MessageText:
//
// No active channel is found for the query.
//
#define ERROR_EC_NO_ACTIVE_CHANNEL       15085L


///////////////////////////////////////////////////
//                                               //
//           Start of MUI Error codes            //
//                                               //
//                 15100 to 15199                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_MUI_FILE_NOT_FOUND
//
// MessageText:
//
// The resource loader failed to find MUI file.
//
#define ERROR_MUI_FILE_NOT_FOUND         15100L    

//
// MessageId: ERROR_MUI_INVALID_FILE
//
// MessageText:
//
// The resource loader failed to load MUI file because the file fail to pass validation.
//
#define ERROR_MUI_INVALID_FILE           15101L    

//
// MessageId: ERROR_MUI_INVALID_RC_CONFIG
//
// MessageText:
//
// The RC Manifest is corrupted with garbage data or unsupported version or missing required item.
//
#define ERROR_MUI_INVALID_RC_CONFIG      15102L    

//
// MessageId: ERROR_MUI_INVALID_LOCALE_NAME
//
// MessageText:
//
// The RC Manifest has invalid culture name.
//
#define ERROR_MUI_INVALID_LOCALE_NAME    15103L    

//
// MessageId: ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME
//
// MessageText:
//
// The RC Manifest has invalid ultimatefallback name.
//
#define ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME 15104L    

//
// MessageId: ERROR_MUI_FILE_NOT_LOADED
//
// MessageText:
//
// The resource loader cache doesn't have loaded MUI entry.
//
#define ERROR_MUI_FILE_NOT_LOADED        15105L    

//
// MessageId: ERROR_RESOURCE_ENUM_USER_STOP
//
// MessageText:
//
// User stopped resource enumeration.
//
#define ERROR_RESOURCE_ENUM_USER_STOP    15106L

//
// MessageId: ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED
//
// MessageText:
//
// UI language installation failed.
//
#define ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED 15107L

//
// MessageId: ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME
//
// MessageText:
//
// Locale installation failed.
//
#define ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME 15108L


///////////////////////////////////////////////////
//                                               //
// Start of Monitor Configuration API error codes//
//                                               //
//                 15200 to 15249                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_MCA_INVALID_CAPABILITIES_STRING
//
// MessageText:
//
// The monitor returned a DDC/CI capabilities string that did not comply with the ACCESS.bus 3.0, DDC/CI 1.1 or MCCS 2 Revision 1 specification.
//
#define ERROR_MCA_INVALID_CAPABILITIES_STRING 15200L

//
// MessageId: ERROR_MCA_INVALID_VCP_VERSION
//
// MessageText:
//
// The monitor's VCP Version (0xDF) VCP code returned an invalid version value.
//
#define ERROR_MCA_INVALID_VCP_VERSION    15201L

//
// MessageId: ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION
//
// MessageText:
//
// The monitor does not comply with the MCCS specification it claims to support.
//
#define ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION 15202L

//
// MessageId: ERROR_MCA_MCCS_VERSION_MISMATCH
//
// MessageText:
//
// The MCCS version in a monitor's mccs_ver capability does not match the MCCS version the monitor reports when the VCP Version (0xDF) VCP code is used.
//
#define ERROR_MCA_MCCS_VERSION_MISMATCH  15203L

//
// MessageId: ERROR_MCA_UNSUPPORTED_MCCS_VERSION
//
// MessageText:
//
// The Monitor Configuration API only works with monitors that support the MCCS 1.0 specification, MCCS 2.0 specification or the MCCS 2.0 Revision 1 specification.
//
#define ERROR_MCA_UNSUPPORTED_MCCS_VERSION 15204L

//
// MessageId: ERROR_MCA_INTERNAL_ERROR
//
// MessageText:
//
// An internal Monitor Configuration API error occurred.
//
#define ERROR_MCA_INTERNAL_ERROR         15205L

//
// MessageId: ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED
//
// MessageText:
//
// The monitor returned an invalid monitor technology type. CRT, Plasma and LCD (TFT) are examples of monitor technology types. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
//
#define ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED 15206L

//
// MessageId: ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE
//
// MessageText:
//
// The caller of SetMonitorColorTemperature specified a color temperature that the current monitor did not support. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
//
#define ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE 15207L


//////////////////////////////////////////////////
//                                              //
// End of Monitor Configuration API error codes //
//                                              //
//                15200 to 15249                //
//                                              //
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//                                              //
//         Start of Syspart error codes         //
//                15250 - 15299                 //
//                                              //
//////////////////////////////////////////////////

//
// MessageId: ERROR_AMBIGUOUS_SYSTEM_DEVICE
//
// MessageText:
//
// The requested system device cannot be identified due to multiple indistinguishable devices potentially matching the identification criteria.
//
#define ERROR_AMBIGUOUS_SYSTEM_DEVICE    15250L

//
// MessageId: ERROR_SYSTEM_DEVICE_NOT_FOUND
//
// MessageText:
//
// The requested system device cannot be found.
//
#define ERROR_SYSTEM_DEVICE_NOT_FOUND    15299L

////////////////////////////////////
//                                //
//     COM Error Codes            //
//                                //
////////////////////////////////////


//
// The return value of COM functions and methods is an HRESULT.
// This is not a handle to anything, but is merely a 32-bit value
// with several fields encoded in the value. The parts of an
// HRESULT are shown below.
//
// Many of the macros and functions below were orginally defined to
// operate on SCODEs. SCODEs are no longer used. The macros are
// still present for compatibility and easy porting of Win16 code.
// Newly written code should use the HRESULT macros and functions.
//

//
//  HRESULTs are 32 bit values layed out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +-+-+-+-+-+---------------------+-------------------------------+
//  |S|R|C|N|r|    Facility         |               Code            |
//  +-+-+-+-+-+---------------------+-------------------------------+
//
//  where
//
//      S - Severity - indicates success/fail
//
//          0 - Success
//          1 - Fail (COERROR)
//
//      R - reserved portion of the facility code, corresponds to NT's
//              second severity bit.
//
//      C - reserved portion of the facility code, corresponds to NT's
//              C field.
//
//      N - reserved portion of the facility code. Used to indicate a
//              mapped NT status value.
//
//      r - reserved portion of the facility code. Reserved for internal
//              use. Used to indicate HRESULT values that are not status
//              values, but are instead message ids for display strings.
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//

//
// Severity values
//

#define SEVERITY_SUCCESS    0
#define SEVERITY_ERROR      1


//
// Generic test for success on any status value (non-negative numbers
// indicate success).
//

#define SUCCEEDED(hr) (((HRESULT)(hr)) >= 0)

//
// and the inverse
//

#define FAILED(hr) (((HRESULT)(hr)) < 0)


//
// Generic test for error on any status value.
//

#define IS_ERROR(Status) (((unsigned long)(Status)) >> 31 == SEVERITY_ERROR)

//
// Return the code
//

#define HRESULT_CODE(hr)    ((hr) & 0xFFFF)
#define SCODE_CODE(sc)      ((sc) & 0xFFFF)

//
//  Return the facility
//

#define HRESULT_FACILITY(hr)  (((hr) >> 16) & 0x1fff)
#define SCODE_FACILITY(sc)    (((sc) >> 16) & 0x1fff)

//
//  Return the severity
//

#define HRESULT_SEVERITY(hr)  (((hr) >> 31) & 0x1)
#define SCODE_SEVERITY(sc)    (((sc) >> 31) & 0x1)

//
// Create an HRESULT value from component pieces
//

#define MAKE_HRESULT(sev,fac,code) \
    ((HRESULT) (((unsigned long)(sev)<<31) | ((unsigned long)(fac)<<16) | ((unsigned long)(code))) )
#define MAKE_SCODE(sev,fac,code) \
    ((SCODE) (((unsigned long)(sev)<<31) | ((unsigned long)(fac)<<16) | ((unsigned long)(code))) )


//
// Map a WIN32 error value into a HRESULT
// Note: This assumes that WIN32 errors fall in the range -32k to 32k.
//
// Define bits here so macros are guaranteed to work

#define FACILITY_NT_BIT                 0x10000000

//
// HRESULT_FROM_WIN32(x) used to be a macro, however we now run it as an inline function
// to prevent double evaluation of 'x'. If you still need the macro, you can use __HRESULT_FROM_WIN32(x)
//
#define __HRESULT_FROM_WIN32(x) ((HRESULT)(x) <= 0 ? ((HRESULT)(x)) : ((HRESULT) (((x) & 0x0000FFFF) | (FACILITY_WIN32 << 16) | 0x80000000)))

#if !defined(_HRESULT_DEFINED) && !defined(__midl)
#define _HRESULT_DEFINED
typedef __success(return >= 0) long HRESULT;
#endif

#ifndef __midl
FORCEINLINE HRESULT HRESULT_FROM_WIN32(unsigned long x) { return (HRESULT)(x) <= 0 ? (HRESULT)(x) : (HRESULT) (((x) & 0x0000FFFF) | (FACILITY_WIN32 << 16) | 0x80000000);}
#else
#define HRESULT_FROM_WIN32(x) __HRESULT_FROM_WIN32(x)
#endif

//
// Map an NT status value into a HRESULT
//

#define HRESULT_FROM_NT(x)      ((HRESULT) ((x) | FACILITY_NT_BIT))


// ****** OBSOLETE functions

// HRESULT functions
// As noted above, these functions are obsolete and should not be used.


// Extract the SCODE from a HRESULT

#define GetScode(hr) ((SCODE) (hr))

// Convert an SCODE into an HRESULT.

#define ResultFromScode(sc) ((HRESULT) (sc))


// PropagateResult is a noop
#define PropagateResult(hrPrevious, scBase) ((HRESULT) scBase)


// ****** End of OBSOLETE functions.


// ---------------------- HRESULT value definitions -----------------
//
// HRESULT definitions
//

#ifdef RC_INVOKED
#define _HRESULT_TYPEDEF_(_sc) _sc
#else // RC_INVOKED
#define _HRESULT_TYPEDEF_(_sc) ((HRESULT)_sc)
#endif // RC_INVOKED

#define NOERROR             0

//
// Error definitions follow
//

//
// Codes 0x4000-0x40ff are reserved for OLE
//
//
// Error codes
//
//
// MessageId: E_UNEXPECTED
//
// MessageText:
//
// Catastrophic failure
//
#define E_UNEXPECTED                     _HRESULT_TYPEDEF_(0x8000FFFFL)

#if defined(_WIN32) && !defined(_MAC)
//
// MessageId: E_NOTIMPL
//
// MessageText:
//
// Not implemented
//
#define E_NOTIMPL                        _HRESULT_TYPEDEF_(0x80004001L)

//
// MessageId: E_OUTOFMEMORY
//
// MessageText:
//
// Ran out of memory
//
#define E_OUTOFMEMORY                    _HRESULT_TYPEDEF_(0x8007000EL)

//
// MessageId: E_INVALIDARG
//
// MessageText:
//
// One or more arguments are invalid
//
#define E_INVALIDARG                     _HRESULT_TYPEDEF_(0x80070057L)

//
// MessageId: E_NOINTERFACE
//
// MessageText:
//
// No such interface supported
//
#define E_NOINTERFACE                    _HRESULT_TYPEDEF_(0x80004002L)

//
// MessageId: E_POINTER
//
// MessageText:
//
// Invalid pointer
//
#define E_POINTER                        _HRESULT_TYPEDEF_(0x80004003L)

//
// MessageId: E_HANDLE
//
// MessageText:
//
// Invalid handle
//
#define E_HANDLE                         _HRESULT_TYPEDEF_(0x80070006L)

//
// MessageId: E_ABORT
//
// MessageText:
//
// Operation aborted
//
#define E_ABORT                          _HRESULT_TYPEDEF_(0x80004004L)

//
// MessageId: E_FAIL
//
// MessageText:
//
// Unspecified error
//
#define E_FAIL                           _HRESULT_TYPEDEF_(0x80004005L)

//
// MessageId: E_ACCESSDENIED
//
// MessageText:
//
// General access denied error
//
#define E_ACCESSDENIED                   _HRESULT_TYPEDEF_(0x80070005L)

#else
//
// MessageId: E_NOTIMPL
//
// MessageText:
//
// Not implemented
//
#define E_NOTIMPL                        _HRESULT_TYPEDEF_(0x80000001L)

//
// MessageId: E_OUTOFMEMORY
//
// MessageText:
//
// Ran out of memory
//
#define E_OUTOFMEMORY                    _HRESULT_TYPEDEF_(0x80000002L)

//
// MessageId: E_INVALIDARG
//
// MessageText:
//
// One or more arguments are invalid
//
#define E_INVALIDARG                     _HRESULT_TYPEDEF_(0x80000003L)

//
// MessageId: E_NOINTERFACE
//
// MessageText:
//
// No such interface supported
//
#define E_NOINTERFACE                    _HRESULT_TYPEDEF_(0x80000004L)

//
// MessageId: E_POINTER
//
// MessageText:
//
// Invalid pointer
//
#define E_POINTER                        _HRESULT_TYPEDEF_(0x80000005L)

//
// MessageId: E_HANDLE
//
// MessageText:
//
// Invalid handle
//
#define E_HANDLE                         _HRESULT_TYPEDEF_(0x80000006L)

//
// MessageId: E_ABORT
//
// MessageText:
//
// Operation aborted
//
#define E_ABORT                          _HRESULT_TYPEDEF_(0x80000007L)

//
// MessageId: E_FAIL
//
// MessageText:
//
// Unspecified error
//
#define E_FAIL                           _HRESULT_TYPEDEF_(0x80000008L)

//
// MessageId: E_ACCESSDENIED
//
// MessageText:
//
// General access denied error
//
#define E_ACCESSDENIED                   _HRESULT_TYPEDEF_(0x80000009L)

#endif //WIN32
//
// MessageId: E_PENDING
//
// MessageText:
//
// The data necessary to complete this operation is not yet available.
//
#define E_PENDING                        _HRESULT_TYPEDEF_(0x8000000AL)

//
// MessageId: CO_E_INIT_TLS
//
// MessageText:
//
// Thread local storage failure
//
#define CO_E_INIT_TLS                    _HRESULT_TYPEDEF_(0x80004006L)

//
// MessageId: CO_E_INIT_SHARED_ALLOCATOR
//
// MessageText:
//
// Get shared memory allocator failure
//
#define CO_E_INIT_SHARED_ALLOCATOR       _HRESULT_TYPEDEF_(0x80004007L)

//
// MessageId: CO_E_INIT_MEMORY_ALLOCATOR
//
// MessageText:
//
// Get memory allocator failure
//
#define CO_E_INIT_MEMORY_ALLOCATOR       _HRESULT_TYPEDEF_(0x80004008L)

//
// MessageId: CO_E_INIT_CLASS_CACHE
//
// MessageText:
//
// Unable to initialize class cache
//
#define CO_E_INIT_CLASS_CACHE            _HRESULT_TYPEDEF_(0x80004009L)

//
// MessageId: CO_E_INIT_RPC_CHANNEL
//
// MessageText:
//
// Unable to initialize RPC services
//
#define CO_E_INIT_RPC_CHANNEL            _HRESULT_TYPEDEF_(0x8000400AL)

//
// MessageId: CO_E_INIT_TLS_SET_CHANNEL_CONTROL
//
// MessageText:
//
// Cannot set thread local storage channel control
//
#define CO_E_INIT_TLS_SET_CHANNEL_CONTROL _HRESULT_TYPEDEF_(0x8000400BL)

//
// MessageId: CO_E_INIT_TLS_CHANNEL_CONTROL
//
// MessageText:
//
// Could not allocate thread local storage channel control
//
#define CO_E_INIT_TLS_CHANNEL_CONTROL    _HRESULT_TYPEDEF_(0x8000400CL)

//
// MessageId: CO_E_INIT_UNACCEPTED_USER_ALLOCATOR
//
// MessageText:
//
// The user supplied memory allocator is unacceptable
//
#define CO_E_INIT_UNACCEPTED_USER_ALLOCATOR _HRESULT_TYPEDEF_(0x8000400DL)

//
// MessageId: CO_E_INIT_SCM_MUTEX_EXISTS
//
// MessageText:
//
// The OLE service mutex already exists
//
#define CO_E_INIT_SCM_MUTEX_EXISTS       _HRESULT_TYPEDEF_(0x8000400EL)

//
// MessageId: CO_E_INIT_SCM_FILE_MAPPING_EXISTS
//
// MessageText:
//
// The OLE service file mapping already exists
//
#define CO_E_INIT_SCM_FILE_MAPPING_EXISTS _HRESULT_TYPEDEF_(0x8000400FL)

//
// MessageId: CO_E_INIT_SCM_MAP_VIEW_OF_FILE
//
// MessageText:
//
// Unable to map view of file for OLE service
//
#define CO_E_INIT_SCM_MAP_VIEW_OF_FILE   _HRESULT_TYPEDEF_(0x80004010L)

//
// MessageId: CO_E_INIT_SCM_EXEC_FAILURE
//
// MessageText:
//
// Failure attempting to launch OLE service
//
#define CO_E_INIT_SCM_EXEC_FAILURE       _HRESULT_TYPEDEF_(0x80004011L)

//
// MessageId: CO_E_INIT_ONLY_SINGLE_THREADED
//
// MessageText:
//
// There was an attempt to call CoInitialize a second time while single threaded
//
#define CO_E_INIT_ONLY_SINGLE_THREADED   _HRESULT_TYPEDEF_(0x80004012L)

//
// MessageId: CO_E_CANT_REMOTE
//
// MessageText:
//
// A Remote activation was necessary but was not allowed
//
#define CO_E_CANT_REMOTE                 _HRESULT_TYPEDEF_(0x80004013L)

//
// MessageId: CO_E_BAD_SERVER_NAME
//
// MessageText:
//
// A Remote activation was necessary but the server name provided was invalid
//
#define CO_E_BAD_SERVER_NAME             _HRESULT_TYPEDEF_(0x80004014L)

//
// MessageId: CO_E_WRONG_SERVER_IDENTITY
//
// MessageText:
//
// The class is configured to run as a security id different from the caller
//
#define CO_E_WRONG_SERVER_IDENTITY       _HRESULT_TYPEDEF_(0x80004015L)

//
// MessageId: CO_E_OLE1DDE_DISABLED
//
// MessageText:
//
// Use of Ole1 services requiring DDE windows is disabled
//
#define CO_E_OLE1DDE_DISABLED            _HRESULT_TYPEDEF_(0x80004016L)

//
// MessageId: CO_E_RUNAS_SYNTAX
//
// MessageText:
//
// A RunAs specification must be <domain name>\<user name> or simply <user name>
//
#define CO_E_RUNAS_SYNTAX                _HRESULT_TYPEDEF_(0x80004017L)

//
// MessageId: CO_E_CREATEPROCESS_FAILURE
//
// MessageText:
//
// The server process could not be started. The pathname may be incorrect.
//
#define CO_E_CREATEPROCESS_FAILURE       _HRESULT_TYPEDEF_(0x80004018L)

//
// MessageId: CO_E_RUNAS_CREATEPROCESS_FAILURE
//
// MessageText:
//
// The server process could not be started as the configured identity. The pathname may be incorrect or unavailable.
//
#define CO_E_RUNAS_CREATEPROCESS_FAILURE _HRESULT_TYPEDEF_(0x80004019L)

//
// MessageId: CO_E_RUNAS_LOGON_FAILURE
//
// MessageText:
//
// The server process could not be started because the configured identity is incorrect. Check the username and password.
//
#define CO_E_RUNAS_LOGON_FAILURE         _HRESULT_TYPEDEF_(0x8000401AL)

//
// MessageId: CO_E_LAUNCH_PERMSSION_DENIED
//
// MessageText:
//
// The client is not allowed to launch this server.
//
#define CO_E_LAUNCH_PERMSSION_DENIED     _HRESULT_TYPEDEF_(0x8000401BL)

//
// MessageId: CO_E_START_SERVICE_FAILURE
//
// MessageText:
//
// The service providing this server could not be started.
//
#define CO_E_START_SERVICE_FAILURE       _HRESULT_TYPEDEF_(0x8000401CL)

//
// MessageId: CO_E_REMOTE_COMMUNICATION_FAILURE
//
// MessageText:
//
// This computer was unable to communicate with the computer providing the server.
//
#define CO_E_REMOTE_COMMUNICATION_FAILURE _HRESULT_TYPEDEF_(0x8000401DL)

//
// MessageId: CO_E_SERVER_START_TIMEOUT
//
// MessageText:
//
// The server did not respond after being launched.
//
#define CO_E_SERVER_START_TIMEOUT        _HRESULT_TYPEDEF_(0x8000401EL)

//
// MessageId: CO_E_CLSREG_INCONSISTENT
//
// MessageText:
//
// The registration information for this server is inconsistent or incomplete.
//
#define CO_E_CLSREG_INCONSISTENT         _HRESULT_TYPEDEF_(0x8000401FL)

//
// MessageId: CO_E_IIDREG_INCONSISTENT
//
// MessageText:
//
// The registration information for this interface is inconsistent or incomplete.
//
#define CO_E_IIDREG_INCONSISTENT         _HRESULT_TYPEDEF_(0x80004020L)

//
// MessageId: CO_E_NOT_SUPPORTED
//
// MessageText:
//
// The operation attempted is not supported.
//
#define CO_E_NOT_SUPPORTED               _HRESULT_TYPEDEF_(0x80004021L)

//
// MessageId: CO_E_RELOAD_DLL
//
// MessageText:
//
// A dll must be loaded.
//
#define CO_E_RELOAD_DLL                  _HRESULT_TYPEDEF_(0x80004022L)

//
// MessageId: CO_E_MSI_ERROR
//
// MessageText:
//
// A Microsoft Software Installer error was encountered.
//
#define CO_E_MSI_ERROR                   _HRESULT_TYPEDEF_(0x80004023L)

//
// MessageId: CO_E_ATTEMPT_TO_CREATE_OUTSIDE_CLIENT_CONTEXT
//
// MessageText:
//
// The specified activation could not occur in the client context as specified.
//
#define CO_E_ATTEMPT_TO_CREATE_OUTSIDE_CLIENT_CONTEXT _HRESULT_TYPEDEF_(0x80004024L)

//
// MessageId: CO_E_SERVER_PAUSED
//
// MessageText:
//
// Activations on the server are paused.
//
#define CO_E_SERVER_PAUSED               _HRESULT_TYPEDEF_(0x80004025L)

//
// MessageId: CO_E_SERVER_NOT_PAUSED
//
// MessageText:
//
// Activations on the server are not paused.
//
#define CO_E_SERVER_NOT_PAUSED           _HRESULT_TYPEDEF_(0x80004026L)

//
// MessageId: CO_E_CLASS_DISABLED
//
// MessageText:
//
// The component or application containing the component has been disabled.
//
#define CO_E_CLASS_DISABLED              _HRESULT_TYPEDEF_(0x80004027L)

//
// MessageId: CO_E_CLRNOTAVAILABLE
//
// MessageText:
//
// The common language runtime is not available
//
#define CO_E_CLRNOTAVAILABLE             _HRESULT_TYPEDEF_(0x80004028L)

//
// MessageId: CO_E_ASYNC_WORK_REJECTED
//
// MessageText:
//
// The thread-pool rejected the submitted asynchronous work.
//
#define CO_E_ASYNC_WORK_REJECTED         _HRESULT_TYPEDEF_(0x80004029L)

//
// MessageId: CO_E_SERVER_INIT_TIMEOUT
//
// MessageText:
//
// The server started, but did not finish initializing in a timely fashion.
//
#define CO_E_SERVER_INIT_TIMEOUT         _HRESULT_TYPEDEF_(0x8000402AL)

//
// MessageId: CO_E_NO_SECCTX_IN_ACTIVATE
//
// MessageText:
//
// Unable to complete the call since there is no COM+ security context inside IObjectControl.Activate.
//
#define CO_E_NO_SECCTX_IN_ACTIVATE       _HRESULT_TYPEDEF_(0x8000402BL)

//
// MessageId: CO_E_TRACKER_CONFIG
//
// MessageText:
//
// The provided tracker configuration is invalid
//
#define CO_E_TRACKER_CONFIG              _HRESULT_TYPEDEF_(0x80004030L)

//
// MessageId: CO_E_THREADPOOL_CONFIG
//
// MessageText:
//
// The provided thread pool configuration is invalid
//
#define CO_E_THREADPOOL_CONFIG           _HRESULT_TYPEDEF_(0x80004031L)

//
// MessageId: CO_E_SXS_CONFIG
//
// MessageText:
//
// The provided side-by-side configuration is invalid
//
#define CO_E_SXS_CONFIG                  _HRESULT_TYPEDEF_(0x80004032L)

//
// MessageId: CO_E_MALFORMED_SPN
//
// MessageText:
//
// The server principal name (SPN) obtained during security negotiation is malformed.
//
#define CO_E_MALFORMED_SPN               _HRESULT_TYPEDEF_(0x80004033L)


//
// Success codes
//
#define S_OK                                   ((HRESULT)0L)
#define S_FALSE                                ((HRESULT)1L)

// ******************
// FACILITY_ITF
// ******************

//
// Codes 0x0-0x01ff are reserved for the OLE group of
// interfaces.
//


//
// Generic OLE errors that may be returned by many inerfaces
//

#define OLE_E_FIRST ((HRESULT)0x80040000L)
#define OLE_E_LAST  ((HRESULT)0x800400FFL)
#define OLE_S_FIRST ((HRESULT)0x00040000L)
#define OLE_S_LAST  ((HRESULT)0x000400FFL)

//
// Old OLE errors
//
//
// MessageId: OLE_E_OLEVERB
//
// MessageText:
//
// Invalid OLEVERB structure
//
#define OLE_E_OLEVERB                    _HRESULT_TYPEDEF_(0x80040000L)

//
// MessageId: OLE_E_ADVF
//
// MessageText:
//
// Invalid advise flags
//
#define OLE_E_ADVF                       _HRESULT_TYPEDEF_(0x80040001L)

//
// MessageId: OLE_E_ENUM_NOMORE
//
// MessageText:
//
// Can't enumerate any more, because the associated data is missing
//
#define OLE_E_ENUM_NOMORE                _HRESULT_TYPEDEF_(0x80040002L)

//
// MessageId: OLE_E_ADVISENOTSUPPORTED
//
// MessageText:
//
// This implementation doesn't take advises
//
#define OLE_E_ADVISENOTSUPPORTED         _HRESULT_TYPEDEF_(0x80040003L)

//
// MessageId: OLE_E_NOCONNECTION
//
// MessageText:
//
// There is no connection for this connection ID
//
#define OLE_E_NOCONNECTION               _HRESULT_TYPEDEF_(0x80040004L)

//
// MessageId: OLE_E_NOTRUNNING
//
// MessageText:
//
// Need to run the object to perform this operation
//
#define OLE_E_NOTRUNNING                 _HRESULT_TYPEDEF_(0x80040005L)

//
// MessageId: OLE_E_NOCACHE
//
// MessageText:
//
// There is no cache to operate on
//
#define OLE_E_NOCACHE                    _HRESULT_TYPEDEF_(0x80040006L)

//
// MessageId: OLE_E_BLANK
//
// MessageText:
//
// Uninitialized object
//
#define OLE_E_BLANK                      _HRESULT_TYPEDEF_(0x80040007L)

//
// MessageId: OLE_E_CLASSDIFF
//
// MessageText:
//
// Linked object's source class has changed
//
#define OLE_E_CLASSDIFF                  _HRESULT_TYPEDEF_(0x80040008L)

//
// MessageId: OLE_E_CANT_GETMONIKER
//
// MessageText:
//
// Not able to get the moniker of the object
//
#define OLE_E_CANT_GETMONIKER            _HRESULT_TYPEDEF_(0x80040009L)

//
// MessageId: OLE_E_CANT_BINDTOSOURCE
//
// MessageText:
//
// Not able to bind to the source
//
#define OLE_E_CANT_BINDTOSOURCE          _HRESULT_TYPEDEF_(0x8004000AL)

//
// MessageId: OLE_E_STATIC
//
// MessageText:
//
// Object is static; operation not allowed
//
#define OLE_E_STATIC                     _HRESULT_TYPEDEF_(0x8004000BL)

//
// MessageId: OLE_E_PROMPTSAVECANCELLED
//
// MessageText:
//
// User canceled out of save dialog
//
#define OLE_E_PROMPTSAVECANCELLED        _HRESULT_TYPEDEF_(0x8004000CL)

//
// MessageId: OLE_E_INVALIDRECT
//
// MessageText:
//
// Invalid rectangle
//
#define OLE_E_INVALIDRECT                _HRESULT_TYPEDEF_(0x8004000DL)

//
// MessageId: OLE_E_WRONGCOMPOBJ
//
// MessageText:
//
// compobj.dll is too old for the ole2.dll initialized
//
#define OLE_E_WRONGCOMPOBJ               _HRESULT_TYPEDEF_(0x8004000EL)

//
// MessageId: OLE_E_INVALIDHWND
//
// MessageText:
//
// Invalid window handle
//
#define OLE_E_INVALIDHWND                _HRESULT_TYPEDEF_(0x8004000FL)

//
// MessageId: OLE_E_NOT_INPLACEACTIVE
//
// MessageText:
//
// Object is not in any of the inplace active states
//
#define OLE_E_NOT_INPLACEACTIVE          _HRESULT_TYPEDEF_(0x80040010L)

//
// MessageId: OLE_E_CANTCONVERT
//
// MessageText:
//
// Not able to convert object
//
#define OLE_E_CANTCONVERT                _HRESULT_TYPEDEF_(0x80040011L)

//
// MessageId: OLE_E_NOSTORAGE
//
// MessageText:
//
// Not able to perform the operation because object is not given storage yet
//
#define OLE_E_NOSTORAGE                  _HRESULT_TYPEDEF_(0x80040012L)

//
// MessageId: DV_E_FORMATETC
//
// MessageText:
//
// Invalid FORMATETC structure
//
#define DV_E_FORMATETC                   _HRESULT_TYPEDEF_(0x80040064L)

//
// MessageId: DV_E_DVTARGETDEVICE
//
// MessageText:
//
// Invalid DVTARGETDEVICE structure
//
#define DV_E_DVTARGETDEVICE              _HRESULT_TYPEDEF_(0x80040065L)

//
// MessageId: DV_E_STGMEDIUM
//
// MessageText:
//
// Invalid STDGMEDIUM structure
//
#define DV_E_STGMEDIUM                   _HRESULT_TYPEDEF_(0x80040066L)

//
// MessageId: DV_E_STATDATA
//
// MessageText:
//
// Invalid STATDATA structure
//
#define DV_E_STATDATA                    _HRESULT_TYPEDEF_(0x80040067L)

//
// MessageId: DV_E_LINDEX
//
// MessageText:
//
// Invalid lindex
//
#define DV_E_LINDEX                      _HRESULT_TYPEDEF_(0x80040068L)

//
// MessageId: DV_E_TYMED
//
// MessageText:
//
// Invalid tymed
//
#define DV_E_TYMED                       _HRESULT_TYPEDEF_(0x80040069L)

//
// MessageId: DV_E_CLIPFORMAT
//
// MessageText:
//
// Invalid clipboard format
//
#define DV_E_CLIPFORMAT                  _HRESULT_TYPEDEF_(0x8004006AL)

//
// MessageId: DV_E_DVASPECT
//
// MessageText:
//
// Invalid aspect(s)
//
#define DV_E_DVASPECT                    _HRESULT_TYPEDEF_(0x8004006BL)

//
// MessageId: DV_E_DVTARGETDEVICE_SIZE
//
// MessageText:
//
// tdSize parameter of the DVTARGETDEVICE structure is invalid
//
#define DV_E_DVTARGETDEVICE_SIZE         _HRESULT_TYPEDEF_(0x8004006CL)

//
// MessageId: DV_E_NOIVIEWOBJECT
//
// MessageText:
//
// Object doesn't support IViewObject interface
//
#define DV_E_NOIVIEWOBJECT               _HRESULT_TYPEDEF_(0x8004006DL)

#define DRAGDROP_E_FIRST 0x80040100L
#define DRAGDROP_E_LAST  0x8004010FL
#define DRAGDROP_S_FIRST 0x00040100L
#define DRAGDROP_S_LAST  0x0004010FL
//
// MessageId: DRAGDROP_E_NOTREGISTERED
//
// MessageText:
//
// Trying to revoke a drop target that has not been registered
//
#define DRAGDROP_E_NOTREGISTERED         _HRESULT_TYPEDEF_(0x80040100L)

//
// MessageId: DRAGDROP_E_ALREADYREGISTERED
//
// MessageText:
//
// This window has already been registered as a drop target
//
#define DRAGDROP_E_ALREADYREGISTERED     _HRESULT_TYPEDEF_(0x80040101L)

//
// MessageId: DRAGDROP_E_INVALIDHWND
//
// MessageText:
//
// Invalid window handle
//
#define DRAGDROP_E_INVALIDHWND           _HRESULT_TYPEDEF_(0x80040102L)

#define CLASSFACTORY_E_FIRST  0x80040110L
#define CLASSFACTORY_E_LAST   0x8004011FL
#define CLASSFACTORY_S_FIRST  0x00040110L
#define CLASSFACTORY_S_LAST   0x0004011FL
//
// MessageId: CLASS_E_NOAGGREGATION
//
// MessageText:
//
// Class does not support aggregation (or class object is remote)
//
#define CLASS_E_NOAGGREGATION            _HRESULT_TYPEDEF_(0x80040110L)

//
// MessageId: CLASS_E_CLASSNOTAVAILABLE
//
// MessageText:
//
// ClassFactory cannot supply requested class
//
#define CLASS_E_CLASSNOTAVAILABLE        _HRESULT_TYPEDEF_(0x80040111L)

//
// MessageId: CLASS_E_NOTLICENSED
//
// MessageText:
//
// Class is not licensed for use
//
#define CLASS_E_NOTLICENSED              _HRESULT_TYPEDEF_(0x80040112L)

#define MARSHAL_E_FIRST  0x80040120L
#define MARSHAL_E_LAST   0x8004012FL
#define MARSHAL_S_FIRST  0x00040120L
#define MARSHAL_S_LAST   0x0004012FL
#define DATA_E_FIRST     0x80040130L
#define DATA_E_LAST      0x8004013FL
#define DATA_S_FIRST     0x00040130L
#define DATA_S_LAST      0x0004013FL
#define VIEW_E_FIRST     0x80040140L
#define VIEW_E_LAST      0x8004014FL
#define VIEW_S_FIRST     0x00040140L
#define VIEW_S_LAST      0x0004014FL
//
// MessageId: VIEW_E_DRAW
//
// MessageText:
//
// Error drawing view
//
#define VIEW_E_DRAW                      _HRESULT_TYPEDEF_(0x80040140L)

#define REGDB_E_FIRST     0x80040150L
#define REGDB_E_LAST      0x8004015FL
#define REGDB_S_FIRST     0x00040150L
#define REGDB_S_LAST      0x0004015FL
//
// MessageId: REGDB_E_READREGDB
//
// MessageText:
//
// Could not read key from registry
//
#define REGDB_E_READREGDB                _HRESULT_TYPEDEF_(0x80040150L)

//
// MessageId: REGDB_E_WRITEREGDB
//
// MessageText:
//
// Could not write key to registry
//
#define REGDB_E_WRITEREGDB               _HRESULT_TYPEDEF_(0x80040151L)

//
// MessageId: REGDB_E_KEYMISSING
//
// MessageText:
//
// Could not find the key in the registry
//
#define REGDB_E_KEYMISSING               _HRESULT_TYPEDEF_(0x80040152L)

//
// MessageId: REGDB_E_INVALIDVALUE
//
// MessageText:
//
// Invalid value for registry
//
#define REGDB_E_INVALIDVALUE             _HRESULT_TYPEDEF_(0x80040153L)

//
// MessageId: REGDB_E_CLASSNOTREG
//
// MessageText:
//
// Class not registered
//
#define REGDB_E_CLASSNOTREG              _HRESULT_TYPEDEF_(0x80040154L)

//
// MessageId: REGDB_E_IIDNOTREG
//
// MessageText:
//
// Interface not registered
//
#define REGDB_E_IIDNOTREG                _HRESULT_TYPEDEF_(0x80040155L)

//
// MessageId: REGDB_E_BADTHREADINGMODEL
//
// MessageText:
//
// Threading model entry is not valid
//
#define REGDB_E_BADTHREADINGMODEL        _HRESULT_TYPEDEF_(0x80040156L)

#define CAT_E_FIRST     0x80040160L
#define CAT_E_LAST      0x80040161L
//
// MessageId: CAT_E_CATIDNOEXIST
//
// MessageText:
//
// CATID does not exist
//
#define CAT_E_CATIDNOEXIST               _HRESULT_TYPEDEF_(0x80040160L)

//
// MessageId: CAT_E_NODESCRIPTION
//
// MessageText:
//
// Description not found
//
#define CAT_E_NODESCRIPTION              _HRESULT_TYPEDEF_(0x80040161L)

////////////////////////////////////
//                                //
//     Class Store Error Codes    //
//                                //
////////////////////////////////////
#define CS_E_FIRST     0x80040164L
#define CS_E_LAST      0x8004016FL
//
// MessageId: CS_E_PACKAGE_NOTFOUND
//
// MessageText:
//
// No package in the software installation data in the Active Directory meets this criteria.
//
#define CS_E_PACKAGE_NOTFOUND            _HRESULT_TYPEDEF_(0x80040164L)

//
// MessageId: CS_E_NOT_DELETABLE
//
// MessageText:
//
// Deleting this will break the referential integrity of the software installation data in the Active Directory.
//
#define CS_E_NOT_DELETABLE               _HRESULT_TYPEDEF_(0x80040165L)

//
// MessageId: CS_E_CLASS_NOTFOUND
//
// MessageText:
//
// The CLSID was not found in the software installation data in the Active Directory.
//
#define CS_E_CLASS_NOTFOUND              _HRESULT_TYPEDEF_(0x80040166L)

//
// MessageId: CS_E_INVALID_VERSION
//
// MessageText:
//
// The software installation data in the Active Directory is corrupt.
//
#define CS_E_INVALID_VERSION             _HRESULT_TYPEDEF_(0x80040167L)

//
// MessageId: CS_E_NO_CLASSSTORE
//
// MessageText:
//
// There is no software installation data in the Active Directory.
//
#define CS_E_NO_CLASSSTORE               _HRESULT_TYPEDEF_(0x80040168L)

//
// MessageId: CS_E_OBJECT_NOTFOUND
//
// MessageText:
//
// There is no software installation data object in the Active Directory.
//
#define CS_E_OBJECT_NOTFOUND             _HRESULT_TYPEDEF_(0x80040169L)

//
// MessageId: CS_E_OBJECT_ALREADY_EXISTS
//
// MessageText:
//
// The software installation data object in the Active Directory already exists.
//
#define CS_E_OBJECT_ALREADY_EXISTS       _HRESULT_TYPEDEF_(0x8004016AL)

//
// MessageId: CS_E_INVALID_PATH
//
// MessageText:
//
// The path to the software installation data in the Active Directory is not correct.
//
#define CS_E_INVALID_PATH                _HRESULT_TYPEDEF_(0x8004016BL)

//
// MessageId: CS_E_NETWORK_ERROR
//
// MessageText:
//
// A network error interrupted the operation.
//
#define CS_E_NETWORK_ERROR               _HRESULT_TYPEDEF_(0x8004016CL)

//
// MessageId: CS_E_ADMIN_LIMIT_EXCEEDED
//
// MessageText:
//
// The size of this object exceeds the maximum size set by the Administrator.
//
#define CS_E_ADMIN_LIMIT_EXCEEDED        _HRESULT_TYPEDEF_(0x8004016DL)

//
// MessageId: CS_E_SCHEMA_MISMATCH
//
// MessageText:
//
// The schema for the software installation data in the Active Directory does not match the required schema.
//
#define CS_E_SCHEMA_MISMATCH             _HRESULT_TYPEDEF_(0x8004016EL)

//
// MessageId: CS_E_INTERNAL_ERROR
//
// MessageText:
//
// An error occurred in the software installation data in the Active Directory.
//
#define CS_E_INTERNAL_ERROR              _HRESULT_TYPEDEF_(0x8004016FL)

#define CACHE_E_FIRST     0x80040170L
#define CACHE_E_LAST      0x8004017FL
#define CACHE_S_FIRST     0x00040170L
#define CACHE_S_LAST      0x0004017FL
//
// MessageId: CACHE_E_NOCACHE_UPDATED
//
// MessageText:
//
// Cache not updated
//
#define CACHE_E_NOCACHE_UPDATED          _HRESULT_TYPEDEF_(0x80040170L)

#define OLEOBJ_E_FIRST     0x80040180L
#define OLEOBJ_E_LAST      0x8004018FL
#define OLEOBJ_S_FIRST     0x00040180L
#define OLEOBJ_S_LAST      0x0004018FL
//
// MessageId: OLEOBJ_E_NOVERBS
//
// MessageText:
//
// No verbs for OLE object
//
#define OLEOBJ_E_NOVERBS                 _HRESULT_TYPEDEF_(0x80040180L)

//
// MessageId: OLEOBJ_E_INVALIDVERB
//
// MessageText:
//
// Invalid verb for OLE object
//
#define OLEOBJ_E_INVALIDVERB             _HRESULT_TYPEDEF_(0x80040181L)

#define CLIENTSITE_E_FIRST     0x80040190L
#define CLIENTSITE_E_LAST      0x8004019FL
#define CLIENTSITE_S_FIRST     0x00040190L
#define CLIENTSITE_S_LAST      0x0004019FL
//
// MessageId: INPLACE_E_NOTUNDOABLE
//
// MessageText:
//
// Undo is not available
//
#define INPLACE_E_NOTUNDOABLE            _HRESULT_TYPEDEF_(0x800401A0L)

//
// MessageId: INPLACE_E_NOTOOLSPACE
//
// MessageText:
//
// Space for tools is not available
//
#define INPLACE_E_NOTOOLSPACE            _HRESULT_TYPEDEF_(0x800401A1L)

#define INPLACE_E_FIRST     0x800401A0L
#define INPLACE_E_LAST      0x800401AFL
#define INPLACE_S_FIRST     0x000401A0L
#define INPLACE_S_LAST      0x000401AFL
#define ENUM_E_FIRST        0x800401B0L
#define ENUM_E_LAST         0x800401BFL
#define ENUM_S_FIRST        0x000401B0L
#define ENUM_S_LAST         0x000401BFL
#define CONVERT10_E_FIRST        0x800401C0L
#define CONVERT10_E_LAST         0x800401CFL
#define CONVERT10_S_FIRST        0x000401C0L
#define CONVERT10_S_LAST         0x000401CFL
//
// MessageId: CONVERT10_E_OLESTREAM_GET
//
// MessageText:
//
// OLESTREAM Get method failed
//
#define CONVERT10_E_OLESTREAM_GET        _HRESULT_TYPEDEF_(0x800401C0L)

//
// MessageId: CONVERT10_E_OLESTREAM_PUT
//
// MessageText:
//
// OLESTREAM Put method failed
//
#define CONVERT10_E_OLESTREAM_PUT        _HRESULT_TYPEDEF_(0x800401C1L)

//
// MessageId: CONVERT10_E_OLESTREAM_FMT
//
// MessageText:
//
// Contents of the OLESTREAM not in correct format
//
#define CONVERT10_E_OLESTREAM_FMT        _HRESULT_TYPEDEF_(0x800401C2L)

//
// MessageId: CONVERT10_E_OLESTREAM_BITMAP_TO_DIB
//
// MessageText:
//
// There was an error in a Windows GDI call while converting the bitmap to a DIB
//
#define CONVERT10_E_OLESTREAM_BITMAP_TO_DIB _HRESULT_TYPEDEF_(0x800401C3L)

//
// MessageId: CONVERT10_E_STG_FMT
//
// MessageText:
//
// Contents of the IStorage not in correct format
//
#define CONVERT10_E_STG_FMT              _HRESULT_TYPEDEF_(0x800401C4L)

//
// MessageId: CONVERT10_E_STG_NO_STD_STREAM
//
// MessageText:
//
// Contents of IStorage is missing one of the standard streams
//
#define CONVERT10_E_STG_NO_STD_STREAM    _HRESULT_TYPEDEF_(0x800401C5L)

//
// MessageId: CONVERT10_E_STG_DIB_TO_BITMAP
//
// MessageText:
//
// There was an error in a Windows GDI call while converting the DIB to a bitmap.
// 
//
#define CONVERT10_E_STG_DIB_TO_BITMAP    _HRESULT_TYPEDEF_(0x800401C6L)

#define CLIPBRD_E_FIRST        0x800401D0L
#define CLIPBRD_E_LAST         0x800401DFL
#define CLIPBRD_S_FIRST        0x000401D0L
#define CLIPBRD_S_LAST         0x000401DFL
//
// MessageId: CLIPBRD_E_CANT_OPEN
//
// MessageText:
//
// OpenClipboard Failed
//
#define CLIPBRD_E_CANT_OPEN              _HRESULT_TYPEDEF_(0x800401D0L)

//
// MessageId: CLIPBRD_E_CANT_EMPTY
//
// MessageText:
//
// EmptyClipboard Failed
//
#define CLIPBRD_E_CANT_EMPTY             _HRESULT_TYPEDEF_(0x800401D1L)

//
// MessageId: CLIPBRD_E_CANT_SET
//
// MessageText:
//
// SetClipboard Failed
//
#define CLIPBRD_E_CANT_SET               _HRESULT_TYPEDEF_(0x800401D2L)

//
// MessageId: CLIPBRD_E_BAD_DATA
//
// MessageText:
//
// Data on clipboard is invalid
//
#define CLIPBRD_E_BAD_DATA               _HRESULT_TYPEDEF_(0x800401D3L)

//
// MessageId: CLIPBRD_E_CANT_CLOSE
//
// MessageText:
//
// CloseClipboard Failed
//
#define CLIPBRD_E_CANT_CLOSE             _HRESULT_TYPEDEF_(0x800401D4L)

#define MK_E_FIRST        0x800401E0L
#define MK_E_LAST         0x800401EFL
#define MK_S_FIRST        0x000401E0L
#define MK_S_LAST         0x000401EFL
//
// MessageId: MK_E_CONNECTMANUALLY
//
// MessageText:
//
// Moniker needs to be connected manually
//
#define MK_E_CONNECTMANUALLY             _HRESULT_TYPEDEF_(0x800401E0L)

//
// MessageId: MK_E_EXCEEDEDDEADLINE
//
// MessageText:
//
// Operation exceeded deadline
//
#define MK_E_EXCEEDEDDEADLINE            _HRESULT_TYPEDEF_(0x800401E1L)

//
// MessageId: MK_E_NEEDGENERIC
//
// MessageText:
//
// Moniker needs to be generic
//
#define MK_E_NEEDGENERIC                 _HRESULT_TYPEDEF_(0x800401E2L)

//
// MessageId: MK_E_UNAVAILABLE
//
// MessageText:
//
// Operation unavailable
//
#define MK_E_UNAVAILABLE                 _HRESULT_TYPEDEF_(0x800401E3L)

//
// MessageId: MK_E_SYNTAX
//
// MessageText:
//
// Invalid syntax
//
#define MK_E_SYNTAX                      _HRESULT_TYPEDEF_(0x800401E4L)

//
// MessageId: MK_E_NOOBJECT
//
// MessageText:
//
// No object for moniker
//
#define MK_E_NOOBJECT                    _HRESULT_TYPEDEF_(0x800401E5L)

//
// MessageId: MK_E_INVALIDEXTENSION
//
// MessageText:
//
// Bad extension for file
//
#define MK_E_INVALIDEXTENSION            _HRESULT_TYPEDEF_(0x800401E6L)

//
// MessageId: MK_E_INTERMEDIATEINTERFACENOTSUPPORTED
//
// MessageText:
//
// Intermediate operation failed
//
#define MK_E_INTERMEDIATEINTERFACENOTSUPPORTED _HRESULT_TYPEDEF_(0x800401E7L)

//
// MessageId: MK_E_NOTBINDABLE
//
// MessageText:
//
// Moniker is not bindable
//
#define MK_E_NOTBINDABLE                 _HRESULT_TYPEDEF_(0x800401E8L)

//
// MessageId: MK_E_NOTBOUND
//
// MessageText:
//
// Moniker is not bound
//
#define MK_E_NOTBOUND                    _HRESULT_TYPEDEF_(0x800401E9L)

//
// MessageId: MK_E_CANTOPENFILE
//
// MessageText:
//
// Moniker cannot open file
//
#define MK_E_CANTOPENFILE                _HRESULT_TYPEDEF_(0x800401EAL)

//
// MessageId: MK_E_MUSTBOTHERUSER
//
// MessageText:
//
// User input required for operation to succeed
//
#define MK_E_MUSTBOTHERUSER              _HRESULT_TYPEDEF_(0x800401EBL)

//
// MessageId: MK_E_NOINVERSE
//
// MessageText:
//
// Moniker class has no inverse
//
#define MK_E_NOINVERSE                   _HRESULT_TYPEDEF_(0x800401ECL)

//
// MessageId: MK_E_NOSTORAGE
//
// MessageText:
//
// Moniker does not refer to storage
//
#define MK_E_NOSTORAGE                   _HRESULT_TYPEDEF_(0x800401EDL)

//
// MessageId: MK_E_NOPREFIX
//
// MessageText:
//
// No common prefix
//
#define MK_E_NOPREFIX                    _HRESULT_TYPEDEF_(0x800401EEL)

//
// MessageId: MK_E_ENUMERATION_FAILED
//
// MessageText:
//
// Moniker could not be enumerated
//
#define MK_E_ENUMERATION_FAILED          _HRESULT_TYPEDEF_(0x800401EFL)

#define CO_E_FIRST        0x800401F0L
#define CO_E_LAST         0x800401FFL
#define CO_S_FIRST        0x000401F0L
#define CO_S_LAST         0x000401FFL
//
// MessageId: CO_E_NOTINITIALIZED
//
// MessageText:
//
// CoInitialize has not been called.
//
#define CO_E_NOTINITIALIZED              _HRESULT_TYPEDEF_(0x800401F0L)

//
// MessageId: CO_E_ALREADYINITIALIZED
//
// MessageText:
//
// CoInitialize has already been called.
//
#define CO_E_ALREADYINITIALIZED          _HRESULT_TYPEDEF_(0x800401F1L)

//
// MessageId: CO_E_CANTDETERMINECLASS
//
// MessageText:
//
// Class of object cannot be determined
//
#define CO_E_CANTDETERMINECLASS          _HRESULT_TYPEDEF_(0x800401F2L)

//
// MessageId: CO_E_CLASSSTRING
//
// MessageText:
//
// Invalid class string
//
#define CO_E_CLASSSTRING                 _HRESULT_TYPEDEF_(0x800401F3L)

//
// MessageId: CO_E_IIDSTRING
//
// MessageText:
//
// Invalid interface string
//
#define CO_E_IIDSTRING                   _HRESULT_TYPEDEF_(0x800401F4L)

//
// MessageId: CO_E_APPNOTFOUND
//
// MessageText:
//
// Application not found
//
#define CO_E_APPNOTFOUND                 _HRESULT_TYPEDEF_(0x800401F5L)

//
// MessageId: CO_E_APPSINGLEUSE
//
// MessageText:
//
// Application cannot be run more than once
//
#define CO_E_APPSINGLEUSE                _HRESULT_TYPEDEF_(0x800401F6L)

//
// MessageId: CO_E_ERRORINAPP
//
// MessageText:
//
// Some error in application program
//
#define CO_E_ERRORINAPP                  _HRESULT_TYPEDEF_(0x800401F7L)

//
// MessageId: CO_E_DLLNOTFOUND
//
// MessageText:
//
// DLL for class not found
//
#define CO_E_DLLNOTFOUND                 _HRESULT_TYPEDEF_(0x800401F8L)

//
// MessageId: CO_E_ERRORINDLL
//
// MessageText:
//
// Error in the DLL
//
#define CO_E_ERRORINDLL                  _HRESULT_TYPEDEF_(0x800401F9L)

//
// MessageId: CO_E_WRONGOSFORAPP
//
// MessageText:
//
// Wrong OS or OS version for application
//
#define CO_E_WRONGOSFORAPP               _HRESULT_TYPEDEF_(0x800401FAL)

//
// MessageId: CO_E_OBJNOTREG
//
// MessageText:
//
// Object is not registered
//
#define CO_E_OBJNOTREG                   _HRESULT_TYPEDEF_(0x800401FBL)

//
// MessageId: CO_E_OBJISREG
//
// MessageText:
//
// Object is already registered
//
#define CO_E_OBJISREG                    _HRESULT_TYPEDEF_(0x800401FCL)

//
// MessageId: CO_E_OBJNOTCONNECTED
//
// MessageText:
//
// Object is not connected to server
//
#define CO_E_OBJNOTCONNECTED             _HRESULT_TYPEDEF_(0x800401FDL)

//
// MessageId: CO_E_APPDIDNTREG
//
// MessageText:
//
// Application was launched but it didn't register a class factory
//
#define CO_E_APPDIDNTREG                 _HRESULT_TYPEDEF_(0x800401FEL)

//
// MessageId: CO_E_RELEASED
//
// MessageText:
//
// Object has been released
//
#define CO_E_RELEASED                    _HRESULT_TYPEDEF_(0x800401FFL)

#define EVENT_E_FIRST        0x80040200L
#define EVENT_E_LAST         0x8004021FL
#define EVENT_S_FIRST        0x00040200L
#define EVENT_S_LAST         0x0004021FL
//
// MessageId: EVENT_S_SOME_SUBSCRIBERS_FAILED
//
// MessageText:
//
// An event was able to invoke some but not all of the subscribers
//
#define EVENT_S_SOME_SUBSCRIBERS_FAILED  _HRESULT_TYPEDEF_(0x00040200L)

//
// MessageId: EVENT_E_ALL_SUBSCRIBERS_FAILED
//
// MessageText:
//
// An event was unable to invoke any of the subscribers
//
#define EVENT_E_ALL_SUBSCRIBERS_FAILED   _HRESULT_TYPEDEF_(0x80040201L)

//
// MessageId: EVENT_S_NOSUBSCRIBERS
//
// MessageText:
//
// An event was delivered but there were no subscribers
//
#define EVENT_S_NOSUBSCRIBERS            _HRESULT_TYPEDEF_(0x00040202L)

//
// MessageId: EVENT_E_QUERYSYNTAX
//
// MessageText:
//
// A syntax error occurred trying to evaluate a query string
//
#define EVENT_E_QUERYSYNTAX              _HRESULT_TYPEDEF_(0x80040203L)

//
// MessageId: EVENT_E_QUERYFIELD
//
// MessageText:
//
// An invalid field name was used in a query string
//
#define EVENT_E_QUERYFIELD               _HRESULT_TYPEDEF_(0x80040204L)

//
// MessageId: EVENT_E_INTERNALEXCEPTION
//
// MessageText:
//
// An unexpected exception was raised
//
#define EVENT_E_INTERNALEXCEPTION        _HRESULT_TYPEDEF_(0x80040205L)

//
// MessageId: EVENT_E_INTERNALERROR
//
// MessageText:
//
// An unexpected internal error was detected
//
#define EVENT_E_INTERNALERROR            _HRESULT_TYPEDEF_(0x80040206L)

//
// MessageId: EVENT_E_INVALID_PER_USER_SID
//
// MessageText:
//
// The owner SID on a per-user subscription doesn't exist
//
#define EVENT_E_INVALID_PER_USER_SID     _HRESULT_TYPEDEF_(0x80040207L)

//
// MessageId: EVENT_E_USER_EXCEPTION
//
// MessageText:
//
// A user-supplied component or subscriber raised an exception
//
#define EVENT_E_USER_EXCEPTION           _HRESULT_TYPEDEF_(0x80040208L)

//
// MessageId: EVENT_E_TOO_MANY_METHODS
//
// MessageText:
//
// An interface has too many methods to fire events from
//
#define EVENT_E_TOO_MANY_METHODS         _HRESULT_TYPEDEF_(0x80040209L)

//
// MessageId: EVENT_E_MISSING_EVENTCLASS
//
// MessageText:
//
// A subscription cannot be stored unless its event class already exists
//
#define EVENT_E_MISSING_EVENTCLASS       _HRESULT_TYPEDEF_(0x8004020AL)

//
// MessageId: EVENT_E_NOT_ALL_REMOVED
//
// MessageText:
//
// Not all the objects requested could be removed
//
#define EVENT_E_NOT_ALL_REMOVED          _HRESULT_TYPEDEF_(0x8004020BL)

//
// MessageId: EVENT_E_COMPLUS_NOT_INSTALLED
//
// MessageText:
//
// COM+ is required for this operation, but is not installed
//
#define EVENT_E_COMPLUS_NOT_INSTALLED    _HRESULT_TYPEDEF_(0x8004020CL)

//
// MessageId: EVENT_E_CANT_MODIFY_OR_DELETE_UNCONFIGURED_OBJECT
//
// MessageText:
//
// Cannot modify or delete an object that was not added using the COM+ Admin SDK
//
#define EVENT_E_CANT_MODIFY_OR_DELETE_UNCONFIGURED_OBJECT _HRESULT_TYPEDEF_(0x8004020DL)

//
// MessageId: EVENT_E_CANT_MODIFY_OR_DELETE_CONFIGURED_OBJECT
//
// MessageText:
//
// Cannot modify or delete an object that was added using the COM+ Admin SDK
//
#define EVENT_E_CANT_MODIFY_OR_DELETE_CONFIGURED_OBJECT _HRESULT_TYPEDEF_(0x8004020EL)

//
// MessageId: EVENT_E_INVALID_EVENT_CLASS_PARTITION
//
// MessageText:
//
// The event class for this subscription is in an invalid partition
//
#define EVENT_E_INVALID_EVENT_CLASS_PARTITION _HRESULT_TYPEDEF_(0x8004020FL)

//
// MessageId: EVENT_E_PER_USER_SID_NOT_LOGGED_ON
//
// MessageText:
//
// The owner of the PerUser subscription is not logged on to the system specified
//
#define EVENT_E_PER_USER_SID_NOT_LOGGED_ON _HRESULT_TYPEDEF_(0x80040210L)

#define XACT_E_FIRST   0x8004D000
#define XACT_E_LAST    0x8004D029
#define XACT_S_FIRST   0x0004D000
#define XACT_S_LAST    0x0004D010
//
// MessageId: XACT_E_ALREADYOTHERSINGLEPHASE
//
// MessageText:
//
// Another single phase resource manager has already been enlisted in this transaction.
//
#define XACT_E_ALREADYOTHERSINGLEPHASE   _HRESULT_TYPEDEF_(0x8004D000L)

//
// MessageId: XACT_E_CANTRETAIN
//
// MessageText:
//
// A retaining commit or abort is not supported
//
#define XACT_E_CANTRETAIN                _HRESULT_TYPEDEF_(0x8004D001L)

//
// MessageId: XACT_E_COMMITFAILED
//
// MessageText:
//
// The transaction failed to commit for an unknown reason. The transaction was aborted.
//
#define XACT_E_COMMITFAILED              _HRESULT_TYPEDEF_(0x8004D002L)

//
// MessageId: XACT_E_COMMITPREVENTED
//
// MessageText:
//
// Cannot call commit on this transaction object because the calling application did not initiate the transaction.
//
#define XACT_E_COMMITPREVENTED           _HRESULT_TYPEDEF_(0x8004D003L)

//
// MessageId: XACT_E_HEURISTICABORT
//
// MessageText:
//
// Instead of committing, the resource heuristically aborted.
//
#define XACT_E_HEURISTICABORT            _HRESULT_TYPEDEF_(0x8004D004L)

//
// MessageId: XACT_E_HEURISTICCOMMIT
//
// MessageText:
//
// Instead of aborting, the resource heuristically committed.
//
#define XACT_E_HEURISTICCOMMIT           _HRESULT_TYPEDEF_(0x8004D005L)

//
// MessageId: XACT_E_HEURISTICDAMAGE
//
// MessageText:
//
// Some of the states of the resource were committed while others were aborted, likely because of heuristic decisions.
//
#define XACT_E_HEURISTICDAMAGE           _HRESULT_TYPEDEF_(0x8004D006L)

//
// MessageId: XACT_E_HEURISTICDANGER
//
// MessageText:
//
// Some of the states of the resource may have been committed while others may have been aborted, likely because of heuristic decisions.
//
#define XACT_E_HEURISTICDANGER           _HRESULT_TYPEDEF_(0x8004D007L)

//
// MessageId: XACT_E_ISOLATIONLEVEL
//
// MessageText:
//
// The requested isolation level is not valid or supported.
//
#define XACT_E_ISOLATIONLEVEL            _HRESULT_TYPEDEF_(0x8004D008L)

//
// MessageId: XACT_E_NOASYNC
//
// MessageText:
//
// The transaction manager doesn't support an asynchronous operation for this method.
//
#define XACT_E_NOASYNC                   _HRESULT_TYPEDEF_(0x8004D009L)

//
// MessageId: XACT_E_NOENLIST
//
// MessageText:
//
// Unable to enlist in the transaction.
//
#define XACT_E_NOENLIST                  _HRESULT_TYPEDEF_(0x8004D00AL)

//
// MessageId: XACT_E_NOISORETAIN
//
// MessageText:
//
// The requested semantics of retention of isolation across retaining commit and abort boundaries cannot be supported by this transaction implementation, or isoFlags was not equal to zero.
//
#define XACT_E_NOISORETAIN               _HRESULT_TYPEDEF_(0x8004D00BL)

//
// MessageId: XACT_E_NORESOURCE
//
// MessageText:
//
// There is no resource presently associated with this enlistment
//
#define XACT_E_NORESOURCE                _HRESULT_TYPEDEF_(0x8004D00CL)

//
// MessageId: XACT_E_NOTCURRENT
//
// MessageText:
//
// The transaction failed to commit due to the failure of optimistic concurrency control in at least one of the resource managers.
//
#define XACT_E_NOTCURRENT                _HRESULT_TYPEDEF_(0x8004D00DL)

//
// MessageId: XACT_E_NOTRANSACTION
//
// MessageText:
//
// The transaction has already been implicitly or explicitly committed or aborted
//
#define XACT_E_NOTRANSACTION             _HRESULT_TYPEDEF_(0x8004D00EL)

//
// MessageId: XACT_E_NOTSUPPORTED
//
// MessageText:
//
// An invalid combination of flags was specified
//
#define XACT_E_NOTSUPPORTED              _HRESULT_TYPEDEF_(0x8004D00FL)

//
// MessageId: XACT_E_UNKNOWNRMGRID
//
// MessageText:
//
// The resource manager id is not associated with this transaction or the transaction manager.
//
#define XACT_E_UNKNOWNRMGRID             _HRESULT_TYPEDEF_(0x8004D010L)

//
// MessageId: XACT_E_WRONGSTATE
//
// MessageText:
//
// This method was called in the wrong state
//
#define XACT_E_WRONGSTATE                _HRESULT_TYPEDEF_(0x8004D011L)

//
// MessageId: XACT_E_WRONGUOW
//
// MessageText:
//
// The indicated unit of work does not match the unit of work expected by the resource manager.
//
#define XACT_E_WRONGUOW                  _HRESULT_TYPEDEF_(0x8004D012L)

//
// MessageId: XACT_E_XTIONEXISTS
//
// MessageText:
//
// An enlistment in a transaction already exists.
//
#define XACT_E_XTIONEXISTS               _HRESULT_TYPEDEF_(0x8004D013L)

//
// MessageId: XACT_E_NOIMPORTOBJECT
//
// MessageText:
//
// An import object for the transaction could not be found.
//
#define XACT_E_NOIMPORTOBJECT            _HRESULT_TYPEDEF_(0x8004D014L)

//
// MessageId: XACT_E_INVALIDCOOKIE
//
// MessageText:
//
// The transaction cookie is invalid.
//
#define XACT_E_INVALIDCOOKIE             _HRESULT_TYPEDEF_(0x8004D015L)

//
// MessageId: XACT_E_INDOUBT
//
// MessageText:
//
// The transaction status is in doubt. A communication failure occurred, or a transaction manager or resource manager has failed
//
#define XACT_E_INDOUBT                   _HRESULT_TYPEDEF_(0x8004D016L)

//
// MessageId: XACT_E_NOTIMEOUT
//
// MessageText:
//
// A time-out was specified, but time-outs are not supported.
//
#define XACT_E_NOTIMEOUT                 _HRESULT_TYPEDEF_(0x8004D017L)

//
// MessageId: XACT_E_ALREADYINPROGRESS
//
// MessageText:
//
// The requested operation is already in progress for the transaction.
//
#define XACT_E_ALREADYINPROGRESS         _HRESULT_TYPEDEF_(0x8004D018L)

//
// MessageId: XACT_E_ABORTED
//
// MessageText:
//
// The transaction has already been aborted.
//
#define XACT_E_ABORTED                   _HRESULT_TYPEDEF_(0x8004D019L)

//
// MessageId: XACT_E_LOGFULL
//
// MessageText:
//
// The Transaction Manager returned a log full error.
//
#define XACT_E_LOGFULL                   _HRESULT_TYPEDEF_(0x8004D01AL)

//
// MessageId: XACT_E_TMNOTAVAILABLE
//
// MessageText:
//
// The Transaction Manager is not available.
//
#define XACT_E_TMNOTAVAILABLE            _HRESULT_TYPEDEF_(0x8004D01BL)

//
// MessageId: XACT_E_CONNECTION_DOWN
//
// MessageText:
//
// A connection with the transaction manager was lost.
//
#define XACT_E_CONNECTION_DOWN           _HRESULT_TYPEDEF_(0x8004D01CL)

//
// MessageId: XACT_E_CONNECTION_DENIED
//
// MessageText:
//
// A request to establish a connection with the transaction manager was denied.
//
#define XACT_E_CONNECTION_DENIED         _HRESULT_TYPEDEF_(0x8004D01DL)

//
// MessageId: XACT_E_REENLISTTIMEOUT
//
// MessageText:
//
// Resource manager reenlistment to determine transaction status timed out.
//
#define XACT_E_REENLISTTIMEOUT           _HRESULT_TYPEDEF_(0x8004D01EL)

//
// MessageId: XACT_E_TIP_CONNECT_FAILED
//
// MessageText:
//
// This transaction manager failed to establish a connection with another TIP transaction manager.
//
#define XACT_E_TIP_CONNECT_FAILED        _HRESULT_TYPEDEF_(0x8004D01FL)

//
// MessageId: XACT_E_TIP_PROTOCOL_ERROR
//
// MessageText:
//
// This transaction manager encountered a protocol error with another TIP transaction manager.
//
#define XACT_E_TIP_PROTOCOL_ERROR        _HRESULT_TYPEDEF_(0x8004D020L)

//
// MessageId: XACT_E_TIP_PULL_FAILED
//
// MessageText:
//
// This transaction manager could not propagate a transaction from another TIP transaction manager.
//
#define XACT_E_TIP_PULL_FAILED           _HRESULT_TYPEDEF_(0x8004D021L)

//
// MessageId: XACT_E_DEST_TMNOTAVAILABLE
//
// MessageText:
//
// The Transaction Manager on the destination machine is not available.
//
#define XACT_E_DEST_TMNOTAVAILABLE       _HRESULT_TYPEDEF_(0x8004D022L)

//
// MessageId: XACT_E_TIP_DISABLED
//
// MessageText:
//
// The Transaction Manager has disabled its support for TIP.
//
#define XACT_E_TIP_DISABLED              _HRESULT_TYPEDEF_(0x8004D023L)

//
// MessageId: XACT_E_NETWORK_TX_DISABLED
//
// MessageText:
//
// The transaction manager has disabled its support for remote/network transactions.
//
#define XACT_E_NETWORK_TX_DISABLED       _HRESULT_TYPEDEF_(0x8004D024L)

//
// MessageId: XACT_E_PARTNER_NETWORK_TX_DISABLED
//
// MessageText:
//
// The partner transaction manager has disabled its support for remote/network transactions.
//
#define XACT_E_PARTNER_NETWORK_TX_DISABLED _HRESULT_TYPEDEF_(0x8004D025L)

//
// MessageId: XACT_E_XA_TX_DISABLED
//
// MessageText:
//
// The transaction manager has disabled its support for XA transactions.
//
#define XACT_E_XA_TX_DISABLED            _HRESULT_TYPEDEF_(0x8004D026L)

//
// MessageId: XACT_E_UNABLE_TO_READ_DTC_CONFIG
//
// MessageText:
//
// MSDTC was unable to read its configuration information.
//
#define XACT_E_UNABLE_TO_READ_DTC_CONFIG _HRESULT_TYPEDEF_(0x8004D027L)

//
// MessageId: XACT_E_UNABLE_TO_LOAD_DTC_PROXY
//
// MessageText:
//
// MSDTC was unable to load the dtc proxy dll.
//
#define XACT_E_UNABLE_TO_LOAD_DTC_PROXY  _HRESULT_TYPEDEF_(0x8004D028L)

//
// MessageId: XACT_E_ABORTING
//
// MessageText:
//
// The local transaction has aborted.
//
#define XACT_E_ABORTING                  _HRESULT_TYPEDEF_(0x8004D029L)

//
// TXF & CRM errors start 4d080.
//
// MessageId: XACT_E_CLERKNOTFOUND
//
// MessageText:
//
//  XACT_E_CLERKNOTFOUND
//
#define XACT_E_CLERKNOTFOUND             _HRESULT_TYPEDEF_(0x8004D080L)

//
// MessageId: XACT_E_CLERKEXISTS
//
// MessageText:
//
//  XACT_E_CLERKEXISTS
//
#define XACT_E_CLERKEXISTS               _HRESULT_TYPEDEF_(0x8004D081L)

//
// MessageId: XACT_E_RECOVERYINPROGRESS
//
// MessageText:
//
//  XACT_E_RECOVERYINPROGRESS
//
#define XACT_E_RECOVERYINPROGRESS        _HRESULT_TYPEDEF_(0x8004D082L)

//
// MessageId: XACT_E_TRANSACTIONCLOSED
//
// MessageText:
//
//  XACT_E_TRANSACTIONCLOSED
//
#define XACT_E_TRANSACTIONCLOSED         _HRESULT_TYPEDEF_(0x8004D083L)

//
// MessageId: XACT_E_INVALIDLSN
//
// MessageText:
//
//  XACT_E_INVALIDLSN
//
#define XACT_E_INVALIDLSN                _HRESULT_TYPEDEF_(0x8004D084L)

//
// MessageId: XACT_E_REPLAYREQUEST
//
// MessageText:
//
//  XACT_E_REPLAYREQUEST
//
#define XACT_E_REPLAYREQUEST             _HRESULT_TYPEDEF_(0x8004D085L)

// Begin XACT_DTC_CONSTANTS enumerated values defined in txdtc.h

// SymbolicName=XACT_E_CONNECTION_REQUEST_DENIED
//
// MessageId: 0x8004D100L (No symbolic name defined)
//
// MessageText:
//
// The request to connect to the specified transaction coordinator was denied.
//


// SymbolicName=XACT_E_TOOMANY_ENLISTMENTS
//
// MessageId: 0x8004D101L (No symbolic name defined)
//
// MessageText:
//
// The maximum number of enlistments for the specified transaction has been reached.
//


// SymbolicName=XACT_E_DUPLICATE_GUID
//
// MessageId: 0x8004D102L (No symbolic name defined)
//
// MessageText:
//
// A resource manager with the same identifier is already registered with the specified transaction coordinator.
//


// SymbolicName=XACT_E_NOTSINGLEPHASE
//
// MessageId: 0x8004D103L (No symbolic name defined)
//
// MessageText:
//
// The prepare request given was not eligible for single phase optimizations.
//


// SymbolicName=XACT_E_RECOVERYALREADYDONE
//
// MessageId: 0x8004D104L (No symbolic name defined)
//
// MessageText:
//
// RecoveryComplete has already been called for the given resource manager.
//


// SymbolicName=XACT_E_PROTOCOL
//
// MessageId: 0x8004D105L (No symbolic name defined)
//
// MessageText:
//
// The interface call made was incorrect for the current state of the protocol.
//


// SymbolicName=XACT_E_RM_FAILURE
//
// MessageId: 0x8004D106L (No symbolic name defined)
//
// MessageText:
//
// xa_open call failed for the XA resource.
//


// SymbolicName=XACT_E_RECOVERY_FAILED
//
// MessageId: 0x8004D107L (No symbolic name defined)
//
// MessageText:
//
// xa_recover call failed for the XA resource.
//


// SymbolicName=XACT_E_LU_NOT_FOUND
//
// MessageId: 0x8004D108L (No symbolic name defined)
//
// MessageText:
//
// The Logical Unit of Work specified cannot be found.
//


// SymbolicName=XACT_E_DUPLICATE_LU
//
// MessageId: 0x8004D109L (No symbolic name defined)
//
// MessageText:
//
// The specified Logical Unit of Work already exists.
//


// SymbolicName=XACT_E_LU_NOT_CONNECTED
//
// MessageId: 0x8004D10AL (No symbolic name defined)
//
// MessageText:
//
// Subordinate creation failed. The specified Logical Unit of Work was not connected.
//


// SymbolicName=XACT_E_DUPLICATE_TRANSID
//
// MessageId: 0x8004D10BL (No symbolic name defined)
//
// MessageText:
//
// A transaction with the given identifier already exists.
//


// SymbolicName=XACT_E_LU_BUSY
//
// MessageId: 0x8004D10CL (No symbolic name defined)
//
// MessageText:
//
// The resource is in use.
//


// SymbolicName=XACT_E_LU_NO_RECOVERY_PROCESS
//
// MessageId: 0x8004D10DL (No symbolic name defined)
//
// MessageText:
//
// The LU Recovery process is down.
//


// SymbolicName=XACT_E_LU_DOWN
//
// MessageId: 0x8004D10EL (No symbolic name defined)
//
// MessageText:
//
// The remote session was lost.
//


// SymbolicName=XACT_E_LU_RECOVERING
//
// MessageId: 0x8004D10FL (No symbolic name defined)
//
// MessageText:
//
// The resource is currently recovering.
//


// SymbolicName=XACT_E_LU_RECOVERY_MISMATCH
//
// MessageId: 0x8004D110L (No symbolic name defined)
//
// MessageText:
//
// There was a mismatch in driving recovery.
//


// SymbolicName=XACT_E_RM_UNAVAILABLE
//
// MessageId: 0x8004D111L (No symbolic name defined)
//
// MessageText:
//
// An error occurred with the XA resource.
//


// End XACT_DTC_CONSTANTS enumerated values defined in txdtc.h

//
// OleTx Success codes.
//
//
// MessageId: XACT_S_ASYNC
//
// MessageText:
//
// An asynchronous operation was specified. The operation has begun, but its outcome is not known yet.
//
#define XACT_S_ASYNC                     _HRESULT_TYPEDEF_(0x0004D000L)

//
// MessageId: XACT_S_DEFECT
//
// MessageText:
//
//  XACT_S_DEFECT
//
#define XACT_S_DEFECT                    _HRESULT_TYPEDEF_(0x0004D001L)

//
// MessageId: XACT_S_READONLY
//
// MessageText:
//
// The method call succeeded because the transaction was read-only.
//
#define XACT_S_READONLY                  _HRESULT_TYPEDEF_(0x0004D002L)

//
// MessageId: XACT_S_SOMENORETAIN
//
// MessageText:
//
// The transaction was successfully aborted. However, this is a coordinated transaction, and some number of enlisted resources were aborted outright because they could not support abort-retaining semantics
//
#define XACT_S_SOMENORETAIN              _HRESULT_TYPEDEF_(0x0004D003L)

//
// MessageId: XACT_S_OKINFORM
//
// MessageText:
//
// No changes were made during this call, but the sink wants another chance to look if any other sinks make further changes.
//
#define XACT_S_OKINFORM                  _HRESULT_TYPEDEF_(0x0004D004L)

//
// MessageId: XACT_S_MADECHANGESCONTENT
//
// MessageText:
//
// The sink is content and wishes the transaction to proceed. Changes were made to one or more resources during this call.
//
#define XACT_S_MADECHANGESCONTENT        _HRESULT_TYPEDEF_(0x0004D005L)

//
// MessageId: XACT_S_MADECHANGESINFORM
//
// MessageText:
//
// The sink is for the moment and wishes the transaction to proceed, but if other changes are made following this return by other event sinks then this sink wants another chance to look
//
#define XACT_S_MADECHANGESINFORM         _HRESULT_TYPEDEF_(0x0004D006L)

//
// MessageId: XACT_S_ALLNORETAIN
//
// MessageText:
//
// The transaction was successfully aborted. However, the abort was non-retaining.
//
#define XACT_S_ALLNORETAIN               _HRESULT_TYPEDEF_(0x0004D007L)

//
// MessageId: XACT_S_ABORTING
//
// MessageText:
//
// An abort operation was already in progress.
//
#define XACT_S_ABORTING                  _HRESULT_TYPEDEF_(0x0004D008L)

//
// MessageId: XACT_S_SINGLEPHASE
//
// MessageText:
//
// The resource manager has performed a single-phase commit of the transaction.
//
#define XACT_S_SINGLEPHASE               _HRESULT_TYPEDEF_(0x0004D009L)

//
// MessageId: XACT_S_LOCALLY_OK
//
// MessageText:
//
// The local transaction has not aborted.
//
#define XACT_S_LOCALLY_OK                _HRESULT_TYPEDEF_(0x0004D00AL)

//
// MessageId: XACT_S_LASTRESOURCEMANAGER
//
// MessageText:
//
// The resource manager has requested to be the coordinator (last resource manager) for the transaction.
//
#define XACT_S_LASTRESOURCEMANAGER       _HRESULT_TYPEDEF_(0x0004D010L)

#define CONTEXT_E_FIRST        0x8004E000L
#define CONTEXT_E_LAST         0x8004E02FL
#define CONTEXT_S_FIRST        0x0004E000L
#define CONTEXT_S_LAST         0x0004E02FL
//
// MessageId: CONTEXT_E_ABORTED
//
// MessageText:
//
// The root transaction wanted to commit, but transaction aborted
//
#define CONTEXT_E_ABORTED                _HRESULT_TYPEDEF_(0x8004E002L)

//
// MessageId: CONTEXT_E_ABORTING
//
// MessageText:
//
// You made a method call on a COM+ component that has a transaction that has already aborted or in the process of aborting.
//
#define CONTEXT_E_ABORTING               _HRESULT_TYPEDEF_(0x8004E003L)

//
// MessageId: CONTEXT_E_NOCONTEXT
//
// MessageText:
//
// There is no MTS object context
//
#define CONTEXT_E_NOCONTEXT              _HRESULT_TYPEDEF_(0x8004E004L)

//
// MessageId: CONTEXT_E_WOULD_DEADLOCK
//
// MessageText:
//
// The component is configured to use synchronization and this method call would cause a deadlock to occur.
//
#define CONTEXT_E_WOULD_DEADLOCK         _HRESULT_TYPEDEF_(0x8004E005L)

//
// MessageId: CONTEXT_E_SYNCH_TIMEOUT
//
// MessageText:
//
// The component is configured to use synchronization and a thread has timed out waiting to enter the context.
//
#define CONTEXT_E_SYNCH_TIMEOUT          _HRESULT_TYPEDEF_(0x8004E006L)

//
// MessageId: CONTEXT_E_OLDREF
//
// MessageText:
//
// You made a method call on a COM+ component that has a transaction that has already committed or aborted.
//
#define CONTEXT_E_OLDREF                 _HRESULT_TYPEDEF_(0x8004E007L)

//
// MessageId: CONTEXT_E_ROLENOTFOUND
//
// MessageText:
//
// The specified role was not configured for the application
//
#define CONTEXT_E_ROLENOTFOUND           _HRESULT_TYPEDEF_(0x8004E00CL)

//
// MessageId: CONTEXT_E_TMNOTAVAILABLE
//
// MessageText:
//
// COM+ was unable to talk to the Microsoft Distributed Transaction Coordinator
//
#define CONTEXT_E_TMNOTAVAILABLE         _HRESULT_TYPEDEF_(0x8004E00FL)

//
// MessageId: CO_E_ACTIVATIONFAILED
//
// MessageText:
//
// An unexpected error occurred during COM+ Activation.
//
#define CO_E_ACTIVATIONFAILED            _HRESULT_TYPEDEF_(0x8004E021L)

//
// MessageId: CO_E_ACTIVATIONFAILED_EVENTLOGGED
//
// MessageText:
//
// COM+ Activation failed. Check the event log for more information
//
#define CO_E_ACTIVATIONFAILED_EVENTLOGGED _HRESULT_TYPEDEF_(0x8004E022L)

//
// MessageId: CO_E_ACTIVATIONFAILED_CATALOGERROR
//
// MessageText:
//
// COM+ Activation failed due to a catalog or configuration error.
//
#define CO_E_ACTIVATIONFAILED_CATALOGERROR _HRESULT_TYPEDEF_(0x8004E023L)

//
// MessageId: CO_E_ACTIVATIONFAILED_TIMEOUT
//
// MessageText:
//
// COM+ activation failed because the activation could not be completed in the specified amount of time.
//
#define CO_E_ACTIVATIONFAILED_TIMEOUT    _HRESULT_TYPEDEF_(0x8004E024L)

//
// MessageId: CO_E_INITIALIZATIONFAILED
//
// MessageText:
//
// COM+ Activation failed because an initialization function failed. Check the event log for more information.
//
#define CO_E_INITIALIZATIONFAILED        _HRESULT_TYPEDEF_(0x8004E025L)

//
// MessageId: CONTEXT_E_NOJIT
//
// MessageText:
//
// The requested operation requires that JIT be in the current context and it is not
//
#define CONTEXT_E_NOJIT                  _HRESULT_TYPEDEF_(0x8004E026L)

//
// MessageId: CONTEXT_E_NOTRANSACTION
//
// MessageText:
//
// The requested operation requires that the current context have a Transaction, and it does not
//
#define CONTEXT_E_NOTRANSACTION          _HRESULT_TYPEDEF_(0x8004E027L)

//
// MessageId: CO_E_THREADINGMODEL_CHANGED
//
// MessageText:
//
// The components threading model has changed after install into a COM+ Application. Please re-install component.
//
#define CO_E_THREADINGMODEL_CHANGED      _HRESULT_TYPEDEF_(0x8004E028L)

//
// MessageId: CO_E_NOIISINTRINSICS
//
// MessageText:
//
// IIS intrinsics not available. Start your work with IIS.
//
#define CO_E_NOIISINTRINSICS             _HRESULT_TYPEDEF_(0x8004E029L)

//
// MessageId: CO_E_NOCOOKIES
//
// MessageText:
//
// An attempt to write a cookie failed.
//
#define CO_E_NOCOOKIES                   _HRESULT_TYPEDEF_(0x8004E02AL)

//
// MessageId: CO_E_DBERROR
//
// MessageText:
//
// An attempt to use a database generated a database specific error.
//
#define CO_E_DBERROR                     _HRESULT_TYPEDEF_(0x8004E02BL)

//
// MessageId: CO_E_NOTPOOLED
//
// MessageText:
//
// The COM+ component you created must use object pooling to work.
//
#define CO_E_NOTPOOLED                   _HRESULT_TYPEDEF_(0x8004E02CL)

//
// MessageId: CO_E_NOTCONSTRUCTED
//
// MessageText:
//
// The COM+ component you created must use object construction to work correctly.
//
#define CO_E_NOTCONSTRUCTED              _HRESULT_TYPEDEF_(0x8004E02DL)

//
// MessageId: CO_E_NOSYNCHRONIZATION
//
// MessageText:
//
// The COM+ component requires synchronization, and it is not configured for it.
//
#define CO_E_NOSYNCHRONIZATION           _HRESULT_TYPEDEF_(0x8004E02EL)

//
// MessageId: CO_E_ISOLEVELMISMATCH
//
// MessageText:
//
// The TxIsolation Level property for the COM+ component being created is stronger than the TxIsolationLevel for the "root" component for the transaction. The creation failed.
//
#define CO_E_ISOLEVELMISMATCH            _HRESULT_TYPEDEF_(0x8004E02FL)

//
// MessageId: CO_E_CALL_OUT_OF_TX_SCOPE_NOT_ALLOWED
//
// MessageText:
//
// The component attempted to make a cross-context call between invocations of EnterTransactionScopeand ExitTransactionScope. This is not allowed. Cross-context calls cannot be made while inside of a transaction scope.
//
#define CO_E_CALL_OUT_OF_TX_SCOPE_NOT_ALLOWED _HRESULT_TYPEDEF_(0x8004E030L)

//
// MessageId: CO_E_EXIT_TRANSACTION_SCOPE_NOT_CALLED
//
// MessageText:
//
// The component made a call to EnterTransactionScope, but did not make a corresponding call to ExitTransactionScope before returning.
//
#define CO_E_EXIT_TRANSACTION_SCOPE_NOT_CALLED _HRESULT_TYPEDEF_(0x8004E031L)

//
// Old OLE Success Codes
//
//
// MessageId: OLE_S_USEREG
//
// MessageText:
//
// Use the registry database to provide the requested information
//
#define OLE_S_USEREG                     _HRESULT_TYPEDEF_(0x00040000L)

//
// MessageId: OLE_S_STATIC
//
// MessageText:
//
// Success, but static
//
#define OLE_S_STATIC                     _HRESULT_TYPEDEF_(0x00040001L)

//
// MessageId: OLE_S_MAC_CLIPFORMAT
//
// MessageText:
//
// Macintosh clipboard format
//
#define OLE_S_MAC_CLIPFORMAT             _HRESULT_TYPEDEF_(0x00040002L)

//
// MessageId: DRAGDROP_S_DROP
//
// MessageText:
//
// Successful drop took place
//
#define DRAGDROP_S_DROP                  _HRESULT_TYPEDEF_(0x00040100L)

//
// MessageId: DRAGDROP_S_CANCEL
//
// MessageText:
//
// Drag-drop operation canceled
//
#define DRAGDROP_S_CANCEL                _HRESULT_TYPEDEF_(0x00040101L)

//
// MessageId: DRAGDROP_S_USEDEFAULTCURSORS
//
// MessageText:
//
// Use the default cursor
//
#define DRAGDROP_S_USEDEFAULTCURSORS     _HRESULT_TYPEDEF_(0x00040102L)

//
// MessageId: DATA_S_SAMEFORMATETC
//
// MessageText:
//
// Data has same FORMATETC
//
#define DATA_S_SAMEFORMATETC             _HRESULT_TYPEDEF_(0x00040130L)

//
// MessageId: VIEW_S_ALREADY_FROZEN
//
// MessageText:
//
// View is already frozen
//
#define VIEW_S_ALREADY_FROZEN            _HRESULT_TYPEDEF_(0x00040140L)

//
// MessageId: CACHE_S_FORMATETC_NOTSUPPORTED
//
// MessageText:
//
// FORMATETC not supported
//
#define CACHE_S_FORMATETC_NOTSUPPORTED   _HRESULT_TYPEDEF_(0x00040170L)

//
// MessageId: CACHE_S_SAMECACHE
//
// MessageText:
//
// Same cache
//
#define CACHE_S_SAMECACHE                _HRESULT_TYPEDEF_(0x00040171L)

//
// MessageId: CACHE_S_SOMECACHES_NOTUPDATED
//
// MessageText:
//
// Some cache(s) not updated
//
#define CACHE_S_SOMECACHES_NOTUPDATED    _HRESULT_TYPEDEF_(0x00040172L)

//
// MessageId: OLEOBJ_S_INVALIDVERB
//
// MessageText:
//
// Invalid verb for OLE object
//
#define OLEOBJ_S_INVALIDVERB             _HRESULT_TYPEDEF_(0x00040180L)

//
// MessageId: OLEOBJ_S_CANNOT_DOVERB_NOW
//
// MessageText:
//
// Verb number is valid but verb cannot be done now
//
#define OLEOBJ_S_CANNOT_DOVERB_NOW       _HRESULT_TYPEDEF_(0x00040181L)

//
// MessageId: OLEOBJ_S_INVALIDHWND
//
// MessageText:
//
// Invalid window handle passed
//
#define OLEOBJ_S_INVALIDHWND             _HRESULT_TYPEDEF_(0x00040182L)

//
// MessageId: INPLACE_S_TRUNCATED
//
// MessageText:
//
// Message is too long; some of it had to be truncated before displaying
//
#define INPLACE_S_TRUNCATED              _HRESULT_TYPEDEF_(0x000401A0L)

//
// MessageId: CONVERT10_S_NO_PRESENTATION
//
// MessageText:
//
// Unable to convert OLESTREAM to IStorage
//
#define CONVERT10_S_NO_PRESENTATION      _HRESULT_TYPEDEF_(0x000401C0L)

//
// MessageId: MK_S_REDUCED_TO_SELF
//
// MessageText:
//
// Moniker reduced to itself
//
#define MK_S_REDUCED_TO_SELF             _HRESULT_TYPEDEF_(0x000401E2L)

//
// MessageId: MK_S_ME
//
// MessageText:
//
// Common prefix is this moniker
//
#define MK_S_ME                          _HRESULT_TYPEDEF_(0x000401E4L)

//
// MessageId: MK_S_HIM
//
// MessageText:
//
// Common prefix is input moniker
//
#define MK_S_HIM                         _HRESULT_TYPEDEF_(0x000401E5L)

//
// MessageId: MK_S_US
//
// MessageText:
//
// Common prefix is both monikers
//
#define MK_S_US                          _HRESULT_TYPEDEF_(0x000401E6L)

//
// MessageId: MK_S_MONIKERALREADYREGISTERED
//
// MessageText:
//
// Moniker is already registered in running object table
//
#define MK_S_MONIKERALREADYREGISTERED    _HRESULT_TYPEDEF_(0x000401E7L)

//
// Task Scheduler errors
//
//
// MessageId: SCHED_S_TASK_READY
//
// MessageText:
//
// The task is ready to run at its next scheduled time.
//
#define SCHED_S_TASK_READY               _HRESULT_TYPEDEF_(0x00041300L)

//
// MessageId: SCHED_S_TASK_RUNNING
//
// MessageText:
//
// The task is currently running.
//
#define SCHED_S_TASK_RUNNING             _HRESULT_TYPEDEF_(0x00041301L)

//
// MessageId: SCHED_S_TASK_DISABLED
//
// MessageText:
//
// The task will not run at the scheduled times because it has been disabled.
//
#define SCHED_S_TASK_DISABLED            _HRESULT_TYPEDEF_(0x00041302L)

//
// MessageId: SCHED_S_TASK_HAS_NOT_RUN
//
// MessageText:
//
// The task has not yet run.
//
#define SCHED_S_TASK_HAS_NOT_RUN         _HRESULT_TYPEDEF_(0x00041303L)

//
// MessageId: SCHED_S_TASK_NO_MORE_RUNS
//
// MessageText:
//
// There are no more runs scheduled for this task.
//
#define SCHED_S_TASK_NO_MORE_RUNS        _HRESULT_TYPEDEF_(0x00041304L)

//
// MessageId: SCHED_S_TASK_NOT_SCHEDULED
//
// MessageText:
//
// One or more of the properties that are needed to run this task on a schedule have not been set.
//
#define SCHED_S_TASK_NOT_SCHEDULED       _HRESULT_TYPEDEF_(0x00041305L)

//
// MessageId: SCHED_S_TASK_TERMINATED
//
// MessageText:
//
// The last run of the task was terminated by the user.
//
#define SCHED_S_TASK_TERMINATED          _HRESULT_TYPEDEF_(0x00041306L)

//
// MessageId: SCHED_S_TASK_NO_VALID_TRIGGERS
//
// MessageText:
//
// Either the task has no triggers or the existing triggers are disabled or not set.
//
#define SCHED_S_TASK_NO_VALID_TRIGGERS   _HRESULT_TYPEDEF_(0x00041307L)

//
// MessageId: SCHED_S_EVENT_TRIGGER
//
// MessageText:
//
// Event triggers don't have set run times.
//
#define SCHED_S_EVENT_TRIGGER            _HRESULT_TYPEDEF_(0x00041308L)

//
// MessageId: SCHED_E_TRIGGER_NOT_FOUND
//
// MessageText:
//
// Trigger not found.
//
#define SCHED_E_TRIGGER_NOT_FOUND        _HRESULT_TYPEDEF_(0x80041309L)

//
// MessageId: SCHED_E_TASK_NOT_READY
//
// MessageText:
//
// One or more of the properties that are needed to run this task have not been set.
//
#define SCHED_E_TASK_NOT_READY           _HRESULT_TYPEDEF_(0x8004130AL)

//
// MessageId: SCHED_E_TASK_NOT_RUNNING
//
// MessageText:
//
// There is no running instance of the task.
//
#define SCHED_E_TASK_NOT_RUNNING         _HRESULT_TYPEDEF_(0x8004130BL)

//
// MessageId: SCHED_E_SERVICE_NOT_INSTALLED
//
// MessageText:
//
// The Task Scheduler Service is not installed on this computer.
//
#define SCHED_E_SERVICE_NOT_INSTALLED    _HRESULT_TYPEDEF_(0x8004130CL)

//
// MessageId: SCHED_E_CANNOT_OPEN_TASK
//
// MessageText:
//
// The task object could not be opened.
//
#define SCHED_E_CANNOT_OPEN_TASK         _HRESULT_TYPEDEF_(0x8004130DL)

//
// MessageId: SCHED_E_INVALID_TASK
//
// MessageText:
//
// The object is either an invalid task object or is not a task object.
//
#define SCHED_E_INVALID_TASK             _HRESULT_TYPEDEF_(0x8004130EL)

//
// MessageId: SCHED_E_ACCOUNT_INFORMATION_NOT_SET
//
// MessageText:
//
// No account information could be found in the Task Scheduler security database for the task indicated.
//
#define SCHED_E_ACCOUNT_INFORMATION_NOT_SET _HRESULT_TYPEDEF_(0x8004130FL)

//
// MessageId: SCHED_E_ACCOUNT_NAME_NOT_FOUND
//
// MessageText:
//
// Unable to establish existence of the account specified.
//
#define SCHED_E_ACCOUNT_NAME_NOT_FOUND   _HRESULT_TYPEDEF_(0x80041310L)

//
// MessageId: SCHED_E_ACCOUNT_DBASE_CORRUPT
//
// MessageText:
//
// Corruption was detected in the Task Scheduler security database; the database has been reset.
//
#define SCHED_E_ACCOUNT_DBASE_CORRUPT    _HRESULT_TYPEDEF_(0x80041311L)

//
// MessageId: SCHED_E_NO_SECURITY_SERVICES
//
// MessageText:
//
// Task Scheduler security services are available only on Windows NT.
//
#define SCHED_E_NO_SECURITY_SERVICES     _HRESULT_TYPEDEF_(0x80041312L)

//
// MessageId: SCHED_E_UNKNOWN_OBJECT_VERSION
//
// MessageText:
//
// The task object version is either unsupported or invalid.
//
#define SCHED_E_UNKNOWN_OBJECT_VERSION   _HRESULT_TYPEDEF_(0x80041313L)

//
// MessageId: SCHED_E_UNSUPPORTED_ACCOUNT_OPTION
//
// MessageText:
//
// The task has been configured with an unsupported combination of account settings and run time options.
//
#define SCHED_E_UNSUPPORTED_ACCOUNT_OPTION _HRESULT_TYPEDEF_(0x80041314L)

//
// MessageId: SCHED_E_SERVICE_NOT_RUNNING
//
// MessageText:
//
// The Task Scheduler Service is not running.
//
#define SCHED_E_SERVICE_NOT_RUNNING      _HRESULT_TYPEDEF_(0x80041315L)

//
// MessageId: SCHED_E_UNEXPECTEDNODE
//
// MessageText:
//
// The task XML contains an unexpected node.
//
#define SCHED_E_UNEXPECTEDNODE           _HRESULT_TYPEDEF_(0x80041316L)

//
// MessageId: SCHED_E_NAMESPACE
//
// MessageText:
//
// The task XML contains an element or attribute from an unexpected namespace.
//
#define SCHED_E_NAMESPACE                _HRESULT_TYPEDEF_(0x80041317L)

//
// MessageId: SCHED_E_INVALIDVALUE
//
// MessageText:
//
// The task XML contains a value which is incorrectly formatted or out of range.
//
#define SCHED_E_INVALIDVALUE             _HRESULT_TYPEDEF_(0x80041318L)

//
// MessageId: SCHED_E_MISSINGNODE
//
// MessageText:
//
// The task XML is missing a required element or attribute.
//
#define SCHED_E_MISSINGNODE              _HRESULT_TYPEDEF_(0x80041319L)

//
// MessageId: SCHED_E_MALFORMEDXML
//
// MessageText:
//
// The task XML is malformed.
//
#define SCHED_E_MALFORMEDXML             _HRESULT_TYPEDEF_(0x8004131AL)

//
// MessageId: SCHED_S_SOME_TRIGGERS_FAILED
//
// MessageText:
//
// The task is registered, but not all specified triggers will start the task.
//
#define SCHED_S_SOME_TRIGGERS_FAILED     _HRESULT_TYPEDEF_(0x0004131BL)

//
// MessageId: SCHED_S_BATCH_LOGON_PROBLEM
//
// MessageText:
//
// The task is registered, but may fail to start. Batch logon privilege needs to be enabled for the task principal.
//
#define SCHED_S_BATCH_LOGON_PROBLEM      _HRESULT_TYPEDEF_(0x0004131CL)

//
// MessageId: SCHED_E_TOO_MANY_NODES
//
// MessageText:
//
// The task XML contains too many nodes of the same type.
//
#define SCHED_E_TOO_MANY_NODES           _HRESULT_TYPEDEF_(0x8004131DL)

//
// MessageId: SCHED_E_PAST_END_BOUNDARY
//
// MessageText:
//
// The task cannot be started after the trigger's end boundary.
//
#define SCHED_E_PAST_END_BOUNDARY        _HRESULT_TYPEDEF_(0x8004131EL)

//
// MessageId: SCHED_E_ALREADY_RUNNING
//
// MessageText:
//
// An instance of this task is already running.
//
#define SCHED_E_ALREADY_RUNNING          _HRESULT_TYPEDEF_(0x8004131FL)

//
// MessageId: SCHED_E_USER_NOT_LOGGED_ON
//
// MessageText:
//
// The task will not run because the user is not logged on.
//
#define SCHED_E_USER_NOT_LOGGED_ON       _HRESULT_TYPEDEF_(0x80041320L)

//
// MessageId: SCHED_E_INVALID_TASK_HASH
//
// MessageText:
//
// The task image is corrupt or has been tampered with.
//
#define SCHED_E_INVALID_TASK_HASH        _HRESULT_TYPEDEF_(0x80041321L)

//
// MessageId: SCHED_E_SERVICE_NOT_AVAILABLE
//
// MessageText:
//
// The Task Scheduler service is not available.
//
#define SCHED_E_SERVICE_NOT_AVAILABLE    _HRESULT_TYPEDEF_(0x80041322L)

//
// MessageId: SCHED_E_SERVICE_TOO_BUSY
//
// MessageText:
//
// The Task Scheduler service is too busy to handle your request. Please try again later.
//
#define SCHED_E_SERVICE_TOO_BUSY         _HRESULT_TYPEDEF_(0x80041323L)

//
// MessageId: SCHED_E_TASK_ATTEMPTED
//
// MessageText:
//
// The Task Scheduler service attempted to run the task, but the task did not run due to one of the constraints in the task definition.
//
#define SCHED_E_TASK_ATTEMPTED           _HRESULT_TYPEDEF_(0x80041324L)

//
// MessageId: SCHED_S_TASK_QUEUED
//
// MessageText:
//
// The Task Scheduler service has asked the task to run.
//
#define SCHED_S_TASK_QUEUED              _HRESULT_TYPEDEF_(0x00041325L)

//
// MessageId: SCHED_E_TASK_DISABLED
//
// MessageText:
//
// The task is disabled.
//
#define SCHED_E_TASK_DISABLED            _HRESULT_TYPEDEF_(0x80041326L)

//
// MessageId: SCHED_E_TASK_NOT_V1_COMPAT
//
// MessageText:
//
// The task has properties that are not compatible with previous versions of Windows.
//
#define SCHED_E_TASK_NOT_V1_COMPAT       _HRESULT_TYPEDEF_(0x80041327L)

//
// MessageId: SCHED_E_START_ON_DEMAND
//
// MessageText:
//
// The task settings do not allow the task to start on demand.
//
#define SCHED_E_START_ON_DEMAND          _HRESULT_TYPEDEF_(0x80041328L)

// ******************
// FACILITY_WINDOWS
// ******************
//
// Codes 0x0-0x01ff are reserved for the OLE group of
// interfaces.
//
//
// MessageId: CO_E_CLASS_CREATE_FAILED
//
// MessageText:
//
// Attempt to create a class object failed
//
#define CO_E_CLASS_CREATE_FAILED         _HRESULT_TYPEDEF_(0x80080001L)

//
// MessageId: CO_E_SCM_ERROR
//
// MessageText:
//
// OLE service could not bind object
//
#define CO_E_SCM_ERROR                   _HRESULT_TYPEDEF_(0x80080002L)

//
// MessageId: CO_E_SCM_RPC_FAILURE
//
// MessageText:
//
// RPC communication failed with OLE service
//
#define CO_E_SCM_RPC_FAILURE             _HRESULT_TYPEDEF_(0x80080003L)

//
// MessageId: CO_E_BAD_PATH
//
// MessageText:
//
// Bad path to object
//
#define CO_E_BAD_PATH                    _HRESULT_TYPEDEF_(0x80080004L)

//
// MessageId: CO_E_SERVER_EXEC_FAILURE
//
// MessageText:
//
// Server execution failed
//
#define CO_E_SERVER_EXEC_FAILURE         _HRESULT_TYPEDEF_(0x80080005L)

//
// MessageId: CO_E_OBJSRV_RPC_FAILURE
//
// MessageText:
//
// OLE service could not communicate with the object server
//
#define CO_E_OBJSRV_RPC_FAILURE          _HRESULT_TYPEDEF_(0x80080006L)

//
// MessageId: MK_E_NO_NORMALIZED
//
// MessageText:
//
// Moniker path could not be normalized
//
#define MK_E_NO_NORMALIZED               _HRESULT_TYPEDEF_(0x80080007L)

//
// MessageId: CO_E_SERVER_STOPPING
//
// MessageText:
//
// Object server is stopping when OLE service contacts it
//
#define CO_E_SERVER_STOPPING             _HRESULT_TYPEDEF_(0x80080008L)

//
// MessageId: MEM_E_INVALID_ROOT
//
// MessageText:
//
// An invalid root block pointer was specified
//
#define MEM_E_INVALID_ROOT               _HRESULT_TYPEDEF_(0x80080009L)

//
// MessageId: MEM_E_INVALID_LINK
//
// MessageText:
//
// An allocation chain contained an invalid link pointer
//
#define MEM_E_INVALID_LINK               _HRESULT_TYPEDEF_(0x80080010L)

//
// MessageId: MEM_E_INVALID_SIZE
//
// MessageText:
//
// The requested allocation size was too large
//
#define MEM_E_INVALID_SIZE               _HRESULT_TYPEDEF_(0x80080011L)

//
// MessageId: CO_S_NOTALLINTERFACES
//
// MessageText:
//
// Not all the requested interfaces were available
//
#define CO_S_NOTALLINTERFACES            _HRESULT_TYPEDEF_(0x00080012L)

//
// MessageId: CO_S_MACHINENAMENOTFOUND
//
// MessageText:
//
// The specified machine name was not found in the cache.
//
#define CO_S_MACHINENAMENOTFOUND         _HRESULT_TYPEDEF_(0x00080013L)

//
// MessageId: CO_E_MISSING_DISPLAYNAME
//
// MessageText:
//
// The activation requires a display name to be present under the CLSID key.
//
#define CO_E_MISSING_DISPLAYNAME         _HRESULT_TYPEDEF_(0x80080015L)

//
// MessageId: CO_E_RUNAS_VALUE_MUST_BE_AAA
//
// MessageText:
//
// The activation requires that the RunAs value for the application is Activate As Activator.
//
#define CO_E_RUNAS_VALUE_MUST_BE_AAA     _HRESULT_TYPEDEF_(0x80080016L)

//
// MessageId: CO_E_ELEVATION_DISABLED
//
// MessageText:
//
// The class is not configured to support Elevated activation.
//
#define CO_E_ELEVATION_DISABLED          _HRESULT_TYPEDEF_(0x80080017L)

// ******************
// FACILITY_DISPATCH
// ******************
//
// MessageId: DISP_E_UNKNOWNINTERFACE
//
// MessageText:
//
// Unknown interface.
//
#define DISP_E_UNKNOWNINTERFACE          _HRESULT_TYPEDEF_(0x80020001L)

//
// MessageId: DISP_E_MEMBERNOTFOUND
//
// MessageText:
//
// Member not found.
//
#define DISP_E_MEMBERNOTFOUND            _HRESULT_TYPEDEF_(0x80020003L)

//
// MessageId: DISP_E_PARAMNOTFOUND
//
// MessageText:
//
// Parameter not found.
//
#define DISP_E_PARAMNOTFOUND             _HRESULT_TYPEDEF_(0x80020004L)

//
// MessageId: DISP_E_TYPEMISMATCH
//
// MessageText:
//
// Type mismatch.
//
#define DISP_E_TYPEMISMATCH              _HRESULT_TYPEDEF_(0x80020005L)

//
// MessageId: DISP_E_UNKNOWNNAME
//
// MessageText:
//
// Unknown name.
//
#define DISP_E_UNKNOWNNAME               _HRESULT_TYPEDEF_(0x80020006L)

//
// MessageId: DISP_E_NONAMEDARGS
//
// MessageText:
//
// No named arguments.
//
#define DISP_E_NONAMEDARGS               _HRESULT_TYPEDEF_(0x80020007L)

//
// MessageId: DISP_E_BADVARTYPE
//
// MessageText:
//
// Bad variable type.
//
#define DISP_E_BADVARTYPE                _HRESULT_TYPEDEF_(0x80020008L)

//
// MessageId: DISP_E_EXCEPTION
//
// MessageText:
//
// Exception occurred.
//
#define DISP_E_EXCEPTION                 _HRESULT_TYPEDEF_(0x80020009L)

//
// MessageId: DISP_E_OVERFLOW
//
// MessageText:
//
// Out of present range.
//
#define DISP_E_OVERFLOW                  _HRESULT_TYPEDEF_(0x8002000AL)

//
// MessageId: DISP_E_BADINDEX
//
// MessageText:
//
// Invalid index.
//
#define DISP_E_BADINDEX                  _HRESULT_TYPEDEF_(0x8002000BL)

//
// MessageId: DISP_E_UNKNOWNLCID
//
// MessageText:
//
// Unknown language.
//
#define DISP_E_UNKNOWNLCID               _HRESULT_TYPEDEF_(0x8002000CL)

//
// MessageId: DISP_E_ARRAYISLOCKED
//
// MessageText:
//
// Memory is locked.
//
#define DISP_E_ARRAYISLOCKED             _HRESULT_TYPEDEF_(0x8002000DL)

//
// MessageId: DISP_E_BADPARAMCOUNT
//
// MessageText:
//
// Invalid number of parameters.
//
#define DISP_E_BADPARAMCOUNT             _HRESULT_TYPEDEF_(0x8002000EL)

//
// MessageId: DISP_E_PARAMNOTOPTIONAL
//
// MessageText:
//
// Parameter not optional.
//
#define DISP_E_PARAMNOTOPTIONAL          _HRESULT_TYPEDEF_(0x8002000FL)

//
// MessageId: DISP_E_BADCALLEE
//
// MessageText:
//
// Invalid callee.
//
#define DISP_E_BADCALLEE                 _HRESULT_TYPEDEF_(0x80020010L)

//
// MessageId: DISP_E_NOTACOLLECTION
//
// MessageText:
//
// Does not support a collection.
//
#define DISP_E_NOTACOLLECTION            _HRESULT_TYPEDEF_(0x80020011L)

//
// MessageId: DISP_E_DIVBYZERO
//
// MessageText:
//
// Division by zero.
//
#define DISP_E_DIVBYZERO                 _HRESULT_TYPEDEF_(0x80020012L)

//
// MessageId: DISP_E_BUFFERTOOSMALL
//
// MessageText:
//
// Buffer too small
//
#define DISP_E_BUFFERTOOSMALL            _HRESULT_TYPEDEF_(0x80020013L)

//
// MessageId: TYPE_E_BUFFERTOOSMALL
//
// MessageText:
//
// Buffer too small.
//
#define TYPE_E_BUFFERTOOSMALL            _HRESULT_TYPEDEF_(0x80028016L)

//
// MessageId: TYPE_E_FIELDNOTFOUND
//
// MessageText:
//
// Field name not defined in the record.
//
#define TYPE_E_FIELDNOTFOUND             _HRESULT_TYPEDEF_(0x80028017L)

//
// MessageId: TYPE_E_INVDATAREAD
//
// MessageText:
//
// Old format or invalid type library.
//
#define TYPE_E_INVDATAREAD               _HRESULT_TYPEDEF_(0x80028018L)

//
// MessageId: TYPE_E_UNSUPFORMAT
//
// MessageText:
//
// Old format or invalid type library.
//
#define TYPE_E_UNSUPFORMAT               _HRESULT_TYPEDEF_(0x80028019L)

//
// MessageId: TYPE_E_REGISTRYACCESS
//
// MessageText:
//
// Error accessing the OLE registry.
//
#define TYPE_E_REGISTRYACCESS            _HRESULT_TYPEDEF_(0x8002801CL)

//
// MessageId: TYPE_E_LIBNOTREGISTERED
//
// MessageText:
//
// Library not registered.
//
#define TYPE_E_LIBNOTREGISTERED          _HRESULT_TYPEDEF_(0x8002801DL)

//
// MessageId: TYPE_E_UNDEFINEDTYPE
//
// MessageText:
//
// Bound to unknown type.
//
#define TYPE_E_UNDEFINEDTYPE             _HRESULT_TYPEDEF_(0x80028027L)

//
// MessageId: TYPE_E_QUALIFIEDNAMEDISALLOWED
//
// MessageText:
//
// Qualified name disallowed.
//
#define TYPE_E_QUALIFIEDNAMEDISALLOWED   _HRESULT_TYPEDEF_(0x80028028L)

//
// MessageId: TYPE_E_INVALIDSTATE
//
// MessageText:
//
// Invalid forward reference, or reference to uncompiled type.
//
#define TYPE_E_INVALIDSTATE              _HRESULT_TYPEDEF_(0x80028029L)

//
// MessageId: TYPE_E_WRONGTYPEKIND
//
// MessageText:
//
// Type mismatch.
//
#define TYPE_E_WRONGTYPEKIND             _HRESULT_TYPEDEF_(0x8002802AL)

//
// MessageId: TYPE_E_ELEMENTNOTFOUND
//
// MessageText:
//
// Element not found.
//
#define TYPE_E_ELEMENTNOTFOUND           _HRESULT_TYPEDEF_(0x8002802BL)

//
// MessageId: TYPE_E_AMBIGUOUSNAME
//
// MessageText:
//
// Ambiguous name.
//
#define TYPE_E_AMBIGUOUSNAME             _HRESULT_TYPEDEF_(0x8002802CL)

//
// MessageId: TYPE_E_NAMECONFLICT
//
// MessageText:
//
// Name already exists in the library.
//
#define TYPE_E_NAMECONFLICT              _HRESULT_TYPEDEF_(0x8002802DL)

//
// MessageId: TYPE_E_UNKNOWNLCID
//
// MessageText:
//
// Unknown LCID.
//
#define TYPE_E_UNKNOWNLCID               _HRESULT_TYPEDEF_(0x8002802EL)

//
// MessageId: TYPE_E_DLLFUNCTIONNOTFOUND
//
// MessageText:
//
// Function not defined in specified DLL.
//
#define TYPE_E_DLLFUNCTIONNOTFOUND       _HRESULT_TYPEDEF_(0x8002802FL)

//
// MessageId: TYPE_E_BADMODULEKIND
//
// MessageText:
//
// Wrong module kind for the operation.
//
#define TYPE_E_BADMODULEKIND             _HRESULT_TYPEDEF_(0x800288BDL)

//
// MessageId: TYPE_E_SIZETOOBIG
//
// MessageText:
//
// Size may not exceed 64K.
//
#define TYPE_E_SIZETOOBIG                _HRESULT_TYPEDEF_(0x800288C5L)

//
// MessageId: TYPE_E_DUPLICATEID
//
// MessageText:
//
// Duplicate ID in inheritance hierarchy.
//
#define TYPE_E_DUPLICATEID               _HRESULT_TYPEDEF_(0x800288C6L)

//
// MessageId: TYPE_E_INVALIDID
//
// MessageText:
//
// Incorrect inheritance depth in standard OLE hmember.
//
#define TYPE_E_INVALIDID                 _HRESULT_TYPEDEF_(0x800288CFL)

//
// MessageId: TYPE_E_TYPEMISMATCH
//
// MessageText:
//
// Type mismatch.
//
#define TYPE_E_TYPEMISMATCH              _HRESULT_TYPEDEF_(0x80028CA0L)

//
// MessageId: TYPE_E_OUTOFBOUNDS
//
// MessageText:
//
// Invalid number of arguments.
//
#define TYPE_E_OUTOFBOUNDS               _HRESULT_TYPEDEF_(0x80028CA1L)

//
// MessageId: TYPE_E_IOERROR
//
// MessageText:
//
// I/O Error.
//
#define TYPE_E_IOERROR                   _HRESULT_TYPEDEF_(0x80028CA2L)

//
// MessageId: TYPE_E_CANTCREATETMPFILE
//
// MessageText:
//
// Error creating unique tmp file.
//
#define TYPE_E_CANTCREATETMPFILE         _HRESULT_TYPEDEF_(0x80028CA3L)

//
// MessageId: TYPE_E_CANTLOADLIBRARY
//
// MessageText:
//
// Error loading type library/DLL.
//
#define TYPE_E_CANTLOADLIBRARY           _HRESULT_TYPEDEF_(0x80029C4AL)

//
// MessageId: TYPE_E_INCONSISTENTPROPFUNCS
//
// MessageText:
//
// Inconsistent property functions.
//
#define TYPE_E_INCONSISTENTPROPFUNCS     _HRESULT_TYPEDEF_(0x80029C83L)

//
// MessageId: TYPE_E_CIRCULARTYPE
//
// MessageText:
//
// Circular dependency between types/modules.
//
#define TYPE_E_CIRCULARTYPE              _HRESULT_TYPEDEF_(0x80029C84L)

// ******************
// FACILITY_STORAGE
// ******************
//
// MessageId: STG_E_INVALIDFUNCTION
//
// MessageText:
//
// Unable to perform requested operation.
//
#define STG_E_INVALIDFUNCTION            _HRESULT_TYPEDEF_(0x80030001L)

//
// MessageId: STG_E_FILENOTFOUND
//
// MessageText:
//
// %1 could not be found.
//
#define STG_E_FILENOTFOUND               _HRESULT_TYPEDEF_(0x80030002L)

//
// MessageId: STG_E_PATHNOTFOUND
//
// MessageText:
//
// The path %1 could not be found.
//
#define STG_E_PATHNOTFOUND               _HRESULT_TYPEDEF_(0x80030003L)

//
// MessageId: STG_E_TOOMANYOPENFILES
//
// MessageText:
//
// There are insufficient resources to open another file.
//
#define STG_E_TOOMANYOPENFILES           _HRESULT_TYPEDEF_(0x80030004L)

//
// MessageId: STG_E_ACCESSDENIED
//
// MessageText:
//
// Access Denied.
//
#define STG_E_ACCESSDENIED               _HRESULT_TYPEDEF_(0x80030005L)

//
// MessageId: STG_E_INVALIDHANDLE
//
// MessageText:
//
// Attempted an operation on an invalid object.
//
#define STG_E_INVALIDHANDLE              _HRESULT_TYPEDEF_(0x80030006L)

//
// MessageId: STG_E_INSUFFICIENTMEMORY
//
// MessageText:
//
// There is insufficient memory available to complete operation.
//
#define STG_E_INSUFFICIENTMEMORY         _HRESULT_TYPEDEF_(0x80030008L)

//
// MessageId: STG_E_INVALIDPOINTER
//
// MessageText:
//
// Invalid pointer error.
//
#define STG_E_INVALIDPOINTER             _HRESULT_TYPEDEF_(0x80030009L)

//
// MessageId: STG_E_NOMOREFILES
//
// MessageText:
//
// There are no more entries to return.
//
#define STG_E_NOMOREFILES                _HRESULT_TYPEDEF_(0x80030012L)

//
// MessageId: STG_E_DISKISWRITEPROTECTED
//
// MessageText:
//
// Disk is write-protected.
//
#define STG_E_DISKISWRITEPROTECTED       _HRESULT_TYPEDEF_(0x80030013L)

//
// MessageId: STG_E_SEEKERROR
//
// MessageText:
//
// An error occurred during a seek operation.
//
#define STG_E_SEEKERROR                  _HRESULT_TYPEDEF_(0x80030019L)

//
// MessageId: STG_E_WRITEFAULT
//
// MessageText:
//
// A disk error occurred during a write operation.
//
#define STG_E_WRITEFAULT                 _HRESULT_TYPEDEF_(0x8003001DL)

//
// MessageId: STG_E_READFAULT
//
// MessageText:
//
// A disk error occurred during a read operation.
//
#define STG_E_READFAULT                  _HRESULT_TYPEDEF_(0x8003001EL)

//
// MessageId: STG_E_SHAREVIOLATION
//
// MessageText:
//
// A share violation has occurred.
//
#define STG_E_SHAREVIOLATION             _HRESULT_TYPEDEF_(0x80030020L)

//
// MessageId: STG_E_LOCKVIOLATION
//
// MessageText:
//
// A lock violation has occurred.
//
#define STG_E_LOCKVIOLATION              _HRESULT_TYPEDEF_(0x80030021L)

//
// MessageId: STG_E_FILEALREADYEXISTS
//
// MessageText:
//
// %1 already exists.
//
#define STG_E_FILEALREADYEXISTS          _HRESULT_TYPEDEF_(0x80030050L)

//
// MessageId: STG_E_INVALIDPARAMETER
//
// MessageText:
//
// Invalid parameter error.
//
#define STG_E_INVALIDPARAMETER           _HRESULT_TYPEDEF_(0x80030057L)

//
// MessageId: STG_E_MEDIUMFULL
//
// MessageText:
//
// There is insufficient disk space to complete operation.
//
#define STG_E_MEDIUMFULL                 _HRESULT_TYPEDEF_(0x80030070L)

//
// MessageId: STG_E_PROPSETMISMATCHED
//
// MessageText:
//
// Illegal write of non-simple property to simple property set.
//
#define STG_E_PROPSETMISMATCHED          _HRESULT_TYPEDEF_(0x800300F0L)

//
// MessageId: STG_E_ABNORMALAPIEXIT
//
// MessageText:
//
// An API call exited abnormally.
//
#define STG_E_ABNORMALAPIEXIT            _HRESULT_TYPEDEF_(0x800300FAL)

//
// MessageId: STG_E_INVALIDHEADER
//
// MessageText:
//
// The file %1 is not a valid compound file.
//
#define STG_E_INVALIDHEADER              _HRESULT_TYPEDEF_(0x800300FBL)

//
// MessageId: STG_E_INVALIDNAME
//
// MessageText:
//
// The name %1 is not valid.
//
#define STG_E_INVALIDNAME                _HRESULT_TYPEDEF_(0x800300FCL)

//
// MessageId: STG_E_UNKNOWN
//
// MessageText:
//
// An unexpected error occurred.
//
#define STG_E_UNKNOWN                    _HRESULT_TYPEDEF_(0x800300FDL)

//
// MessageId: STG_E_UNIMPLEMENTEDFUNCTION
//
// MessageText:
//
// That function is not implemented.
//
#define STG_E_UNIMPLEMENTEDFUNCTION      _HRESULT_TYPEDEF_(0x800300FEL)

//
// MessageId: STG_E_INVALIDFLAG
//
// MessageText:
//
// Invalid flag error.
//
#define STG_E_INVALIDFLAG                _HRESULT_TYPEDEF_(0x800300FFL)

//
// MessageId: STG_E_INUSE
//
// MessageText:
//
// Attempted to use an object that is busy.
//
#define STG_E_INUSE                      _HRESULT_TYPEDEF_(0x80030100L)

//
// MessageId: STG_E_NOTCURRENT
//
// MessageText:
//
// The storage has been changed since the last commit.
//
#define STG_E_NOTCURRENT                 _HRESULT_TYPEDEF_(0x80030101L)

//
// MessageId: STG_E_REVERTED
//
// MessageText:
//
// Attempted to use an object that has ceased to exist.
//
#define STG_E_REVERTED                   _HRESULT_TYPEDEF_(0x80030102L)

//
// MessageId: STG_E_CANTSAVE
//
// MessageText:
//
// Can't save.
//
#define STG_E_CANTSAVE                   _HRESULT_TYPEDEF_(0x80030103L)

//
// MessageId: STG_E_OLDFORMAT
//
// MessageText:
//
// The compound file %1 was produced with an incompatible version of storage.
//
#define STG_E_OLDFORMAT                  _HRESULT_TYPEDEF_(0x80030104L)

//
// MessageId: STG_E_OLDDLL
//
// MessageText:
//
// The compound file %1 was produced with a newer version of storage.
//
#define STG_E_OLDDLL                     _HRESULT_TYPEDEF_(0x80030105L)

//
// MessageId: STG_E_SHAREREQUIRED
//
// MessageText:
//
// Share.exe or equivalent is required for operation.
//
#define STG_E_SHAREREQUIRED              _HRESULT_TYPEDEF_(0x80030106L)

//
// MessageId: STG_E_NOTFILEBASEDSTORAGE
//
// MessageText:
//
// Illegal operation called on non-file based storage.
//
#define STG_E_NOTFILEBASEDSTORAGE        _HRESULT_TYPEDEF_(0x80030107L)

//
// MessageId: STG_E_EXTANTMARSHALLINGS
//
// MessageText:
//
// Illegal operation called on object with extant marshallings.
//
#define STG_E_EXTANTMARSHALLINGS         _HRESULT_TYPEDEF_(0x80030108L)

//
// MessageId: STG_E_DOCFILECORRUPT
//
// MessageText:
//
// The docfile has been corrupted.
//
#define STG_E_DOCFILECORRUPT             _HRESULT_TYPEDEF_(0x80030109L)

//
// MessageId: STG_E_BADBASEADDRESS
//
// MessageText:
//
// OLE32.DLL has been loaded at the wrong address.
//
#define STG_E_BADBASEADDRESS             _HRESULT_TYPEDEF_(0x80030110L)

//
// MessageId: STG_E_DOCFILETOOLARGE
//
// MessageText:
//
// The compound file is too large for the current implementation
//
#define STG_E_DOCFILETOOLARGE            _HRESULT_TYPEDEF_(0x80030111L)

//
// MessageId: STG_E_NOTSIMPLEFORMAT
//
// MessageText:
//
// The compound file was not created with the STGM_SIMPLE flag
//
#define STG_E_NOTSIMPLEFORMAT            _HRESULT_TYPEDEF_(0x80030112L)

//
// MessageId: STG_E_INCOMPLETE
//
// MessageText:
//
// The file download was aborted abnormally. The file is incomplete.
//
#define STG_E_INCOMPLETE                 _HRESULT_TYPEDEF_(0x80030201L)

//
// MessageId: STG_E_TERMINATED
//
// MessageText:
//
// The file download has been terminated.
//
#define STG_E_TERMINATED                 _HRESULT_TYPEDEF_(0x80030202L)

//
// MessageId: STG_S_CONVERTED
//
// MessageText:
//
// The underlying file was converted to compound file format.
//
#define STG_S_CONVERTED                  _HRESULT_TYPEDEF_(0x00030200L)

//
// MessageId: STG_S_BLOCK
//
// MessageText:
//
// The storage operation should block until more data is available.
//
#define STG_S_BLOCK                      _HRESULT_TYPEDEF_(0x00030201L)

//
// MessageId: STG_S_RETRYNOW
//
// MessageText:
//
// The storage operation should retry immediately.
//
#define STG_S_RETRYNOW                   _HRESULT_TYPEDEF_(0x00030202L)

//
// MessageId: STG_S_MONITORING
//
// MessageText:
//
// The notified event sink will not influence the storage operation.
//
#define STG_S_MONITORING                 _HRESULT_TYPEDEF_(0x00030203L)

//
// MessageId: STG_S_MULTIPLEOPENS
//
// MessageText:
//
// Multiple opens prevent consolidated. (commit succeeded).
//
#define STG_S_MULTIPLEOPENS              _HRESULT_TYPEDEF_(0x00030204L)

//
// MessageId: STG_S_CONSOLIDATIONFAILED
//
// MessageText:
//
// Consolidation of the storage file failed. (commit succeeded).
//
#define STG_S_CONSOLIDATIONFAILED        _HRESULT_TYPEDEF_(0x00030205L)

//
// MessageId: STG_S_CANNOTCONSOLIDATE
//
// MessageText:
//
// Consolidation of the storage file is inappropriate. (commit succeeded).
//
#define STG_S_CANNOTCONSOLIDATE          _HRESULT_TYPEDEF_(0x00030206L)

/*++

 MessageId's 0x0305 - 0x031f (inclusive) are reserved for **STORAGE**
 copy protection errors.

--*/
//
// MessageId: STG_E_STATUS_COPY_PROTECTION_FAILURE
//
// MessageText:
//
// Generic Copy Protection Error.
//
#define STG_E_STATUS_COPY_PROTECTION_FAILURE _HRESULT_TYPEDEF_(0x80030305L)

//
// MessageId: STG_E_CSS_AUTHENTICATION_FAILURE
//
// MessageText:
//
// Copy Protection Error - DVD CSS Authentication failed.
//
#define STG_E_CSS_AUTHENTICATION_FAILURE _HRESULT_TYPEDEF_(0x80030306L)

//
// MessageId: STG_E_CSS_KEY_NOT_PRESENT
//
// MessageText:
//
// Copy Protection Error - The given sector does not have a valid CSS key.
//
#define STG_E_CSS_KEY_NOT_PRESENT        _HRESULT_TYPEDEF_(0x80030307L)

//
// MessageId: STG_E_CSS_KEY_NOT_ESTABLISHED
//
// MessageText:
//
// Copy Protection Error - DVD session key not established.
//
#define STG_E_CSS_KEY_NOT_ESTABLISHED    _HRESULT_TYPEDEF_(0x80030308L)

//
// MessageId: STG_E_CSS_SCRAMBLED_SECTOR
//
// MessageText:
//
// Copy Protection Error - The read failed because the sector is encrypted.
//
#define STG_E_CSS_SCRAMBLED_SECTOR       _HRESULT_TYPEDEF_(0x80030309L)

//
// MessageId: STG_E_CSS_REGION_MISMATCH
//
// MessageText:
//
// Copy Protection Error - The current DVD's region does not correspond to the region setting of the drive.
//
#define STG_E_CSS_REGION_MISMATCH        _HRESULT_TYPEDEF_(0x8003030AL)

//
// MessageId: STG_E_RESETS_EXHAUSTED
//
// MessageText:
//
// Copy Protection Error - The drive's region setting may be permanent or the number of user resets has been exhausted.
//
#define STG_E_RESETS_EXHAUSTED           _HRESULT_TYPEDEF_(0x8003030BL)

/*++

 MessageId's 0x0305 - 0x031f (inclusive) are reserved for **STORAGE**
 copy protection errors.

--*/
// ******************
// FACILITY_RPC
// ******************
//
// Codes 0x0-0x11 are propagated from 16 bit OLE.
//
//
// MessageId: RPC_E_CALL_REJECTED
//
// MessageText:
//
// Call was rejected by callee.
//
#define RPC_E_CALL_REJECTED              _HRESULT_TYPEDEF_(0x80010001L)

//
// MessageId: RPC_E_CALL_CANCELED
//
// MessageText:
//
// Call was canceled by the message filter.
//
#define RPC_E_CALL_CANCELED              _HRESULT_TYPEDEF_(0x80010002L)

//
// MessageId: RPC_E_CANTPOST_INSENDCALL
//
// MessageText:
//
// The caller is dispatching an intertask SendMessage call and cannot call out via PostMessage.
//
#define RPC_E_CANTPOST_INSENDCALL        _HRESULT_TYPEDEF_(0x80010003L)

//
// MessageId: RPC_E_CANTCALLOUT_INASYNCCALL
//
// MessageText:
//
// The caller is dispatching an asynchronous call and cannot make an outgoing call on behalf of this call.
//
#define RPC_E_CANTCALLOUT_INASYNCCALL    _HRESULT_TYPEDEF_(0x80010004L)

//
// MessageId: RPC_E_CANTCALLOUT_INEXTERNALCALL
//
// MessageText:
//
// It is illegal to call out while inside message filter.
//
#define RPC_E_CANTCALLOUT_INEXTERNALCALL _HRESULT_TYPEDEF_(0x80010005L)

//
// MessageId: RPC_E_CONNECTION_TERMINATED
//
// MessageText:
//
// The connection terminated or is in a bogus state and cannot be used any more. Other connections are still valid.
//
#define RPC_E_CONNECTION_TERMINATED      _HRESULT_TYPEDEF_(0x80010006L)

//
// MessageId: RPC_E_SERVER_DIED
//
// MessageText:
//
// The callee (server [not server application]) is not available and disappeared; all connections are invalid. The call may have executed.
//
#define RPC_E_SERVER_DIED                _HRESULT_TYPEDEF_(0x80010007L)

//
// MessageId: RPC_E_CLIENT_DIED
//
// MessageText:
//
// The caller (client) disappeared while the callee (server) was processing a call.
//
#define RPC_E_CLIENT_DIED                _HRESULT_TYPEDEF_(0x80010008L)

//
// MessageId: RPC_E_INVALID_DATAPACKET
//
// MessageText:
//
// The data packet with the marshalled parameter data is incorrect.
//
#define RPC_E_INVALID_DATAPACKET         _HRESULT_TYPEDEF_(0x80010009L)

//
// MessageId: RPC_E_CANTTRANSMIT_CALL
//
// MessageText:
//
// The call was not transmitted properly; the message queue was full and was not emptied after yielding.
//
#define RPC_E_CANTTRANSMIT_CALL          _HRESULT_TYPEDEF_(0x8001000AL)

//
// MessageId: RPC_E_CLIENT_CANTMARSHAL_DATA
//
// MessageText:
//
// The client (caller) cannot marshall the parameter data - low memory, etc.
//
#define RPC_E_CLIENT_CANTMARSHAL_DATA    _HRESULT_TYPEDEF_(0x8001000BL)

//
// MessageId: RPC_E_CLIENT_CANTUNMARSHAL_DATA
//
// MessageText:
//
// The client (caller) cannot unmarshall the return data - low memory, etc.
//
#define RPC_E_CLIENT_CANTUNMARSHAL_DATA  _HRESULT_TYPEDEF_(0x8001000CL)

//
// MessageId: RPC_E_SERVER_CANTMARSHAL_DATA
//
// MessageText:
//
// The server (callee) cannot marshall the return data - low memory, etc.
//
#define RPC_E_SERVER_CANTMARSHAL_DATA    _HRESULT_TYPEDEF_(0x8001000DL)

//
// MessageId: RPC_E_SERVER_CANTUNMARSHAL_DATA
//
// MessageText:
//
// The server (callee) cannot unmarshall the parameter data - low memory, etc.
//
#define RPC_E_SERVER_CANTUNMARSHAL_DATA  _HRESULT_TYPEDEF_(0x8001000EL)

//
// MessageId: RPC_E_INVALID_DATA
//
// MessageText:
//
// Received data is invalid; could be server or client data.
//
#define RPC_E_INVALID_DATA               _HRESULT_TYPEDEF_(0x8001000FL)

//
// MessageId: RPC_E_INVALID_PARAMETER
//
// MessageText:
//
// A particular parameter is invalid and cannot be (un)marshalled.
//
#define RPC_E_INVALID_PARAMETER          _HRESULT_TYPEDEF_(0x80010010L)

//
// MessageId: RPC_E_CANTCALLOUT_AGAIN
//
// MessageText:
//
// There is no second outgoing call on same channel in DDE conversation.
//
#define RPC_E_CANTCALLOUT_AGAIN          _HRESULT_TYPEDEF_(0x80010011L)

//
// MessageId: RPC_E_SERVER_DIED_DNE
//
// MessageText:
//
// The callee (server [not server application]) is not available and disappeared; all connections are invalid. The call did not execute.
//
#define RPC_E_SERVER_DIED_DNE            _HRESULT_TYPEDEF_(0x80010012L)

//
// MessageId: RPC_E_SYS_CALL_FAILED
//
// MessageText:
//
// System call failed.
//
#define RPC_E_SYS_CALL_FAILED            _HRESULT_TYPEDEF_(0x80010100L)

//
// MessageId: RPC_E_OUT_OF_RESOURCES
//
// MessageText:
//
// Could not allocate some required resource (memory, events, ...)
//
#define RPC_E_OUT_OF_RESOURCES           _HRESULT_TYPEDEF_(0x80010101L)

//
// MessageId: RPC_E_ATTEMPTED_MULTITHREAD
//
// MessageText:
//
// Attempted to make calls on more than one thread in single threaded mode.
//
#define RPC_E_ATTEMPTED_MULTITHREAD      _HRESULT_TYPEDEF_(0x80010102L)

//
// MessageId: RPC_E_NOT_REGISTERED
//
// MessageText:
//
// The requested interface is not registered on the server object.
//
#define RPC_E_NOT_REGISTERED             _HRESULT_TYPEDEF_(0x80010103L)

//
// MessageId: RPC_E_FAULT
//
// MessageText:
//
// RPC could not call the server or could not return the results of calling the server.
//
#define RPC_E_FAULT                      _HRESULT_TYPEDEF_(0x80010104L)

//
// MessageId: RPC_E_SERVERFAULT
//
// MessageText:
//
// The server threw an exception.
//
#define RPC_E_SERVERFAULT                _HRESULT_TYPEDEF_(0x80010105L)

//
// MessageId: RPC_E_CHANGED_MODE
//
// MessageText:
//
// Cannot change thread mode after it is set.
//
#define RPC_E_CHANGED_MODE               _HRESULT_TYPEDEF_(0x80010106L)

//
// MessageId: RPC_E_INVALIDMETHOD
//
// MessageText:
//
// The method called does not exist on the server.
//
#define RPC_E_INVALIDMETHOD              _HRESULT_TYPEDEF_(0x80010107L)

//
// MessageId: RPC_E_DISCONNECTED
//
// MessageText:
//
// The object invoked has disconnected from its clients.
//
#define RPC_E_DISCONNECTED               _HRESULT_TYPEDEF_(0x80010108L)

//
// MessageId: RPC_E_RETRY
//
// MessageText:
//
// The object invoked chose not to process the call now. Try again later.
//
#define RPC_E_RETRY                      _HRESULT_TYPEDEF_(0x80010109L)

//
// MessageId: RPC_E_SERVERCALL_RETRYLATER
//
// MessageText:
//
// The message filter indicated that the application is busy.
//
#define RPC_E_SERVERCALL_RETRYLATER      _HRESULT_TYPEDEF_(0x8001010AL)

//
// MessageId: RPC_E_SERVERCALL_REJECTED
//
// MessageText:
//
// The message filter rejected the call.
//
#define RPC_E_SERVERCALL_REJECTED        _HRESULT_TYPEDEF_(0x8001010BL)

//
// MessageId: RPC_E_INVALID_CALLDATA
//
// MessageText:
//
// A call control interfaces was called with invalid data.
//
#define RPC_E_INVALID_CALLDATA           _HRESULT_TYPEDEF_(0x8001010CL)

//
// MessageId: RPC_E_CANTCALLOUT_ININPUTSYNCCALL
//
// MessageText:
//
// An outgoing call cannot be made since the application is dispatching an input-synchronous call.
//
#define RPC_E_CANTCALLOUT_ININPUTSYNCCALL _HRESULT_TYPEDEF_(0x8001010DL)

//
// MessageId: RPC_E_WRONG_THREAD
//
// MessageText:
//
// The application called an interface that was marshalled for a different thread.
//
#define RPC_E_WRONG_THREAD               _HRESULT_TYPEDEF_(0x8001010EL)

//
// MessageId: RPC_E_THREAD_NOT_INIT
//
// MessageText:
//
// CoInitialize has not been called on the current thread.
//
#define RPC_E_THREAD_NOT_INIT            _HRESULT_TYPEDEF_(0x8001010FL)

//
// MessageId: RPC_E_VERSION_MISMATCH
//
// MessageText:
//
// The version of OLE on the client and server machines does not match.
//
#define RPC_E_VERSION_MISMATCH           _HRESULT_TYPEDEF_(0x80010110L)

//
// MessageId: RPC_E_INVALID_HEADER
//
// MessageText:
//
// OLE received a packet with an invalid header.
//
#define RPC_E_INVALID_HEADER             _HRESULT_TYPEDEF_(0x80010111L)

//
// MessageId: RPC_E_INVALID_EXTENSION
//
// MessageText:
//
// OLE received a packet with an invalid extension.
//
#define RPC_E_INVALID_EXTENSION          _HRESULT_TYPEDEF_(0x80010112L)

//
// MessageId: RPC_E_INVALID_IPID
//
// MessageText:
//
// The requested object or interface does not exist.
//
#define RPC_E_INVALID_IPID               _HRESULT_TYPEDEF_(0x80010113L)

//
// MessageId: RPC_E_INVALID_OBJECT
//
// MessageText:
//
// The requested object does not exist.
//
#define RPC_E_INVALID_OBJECT             _HRESULT_TYPEDEF_(0x80010114L)

//
// MessageId: RPC_S_CALLPENDING
//
// MessageText:
//
// OLE has sent a request and is waiting for a reply.
//
#define RPC_S_CALLPENDING                _HRESULT_TYPEDEF_(0x80010115L)

//
// MessageId: RPC_S_WAITONTIMER
//
// MessageText:
//
// OLE is waiting before retrying a request.
//
#define RPC_S_WAITONTIMER                _HRESULT_TYPEDEF_(0x80010116L)

//
// MessageId: RPC_E_CALL_COMPLETE
//
// MessageText:
//
// Call context cannot be accessed after call completed.
//
#define RPC_E_CALL_COMPLETE              _HRESULT_TYPEDEF_(0x80010117L)

//
// MessageId: RPC_E_UNSECURE_CALL
//
// MessageText:
//
// Impersonate on unsecure calls is not supported.
//
#define RPC_E_UNSECURE_CALL              _HRESULT_TYPEDEF_(0x80010118L)

//
// MessageId: RPC_E_TOO_LATE
//
// MessageText:
//
// Security must be initialized before any interfaces are marshalled or unmarshalled. It cannot be changed once initialized.
//
#define RPC_E_TOO_LATE                   _HRESULT_TYPEDEF_(0x80010119L)

//
// MessageId: RPC_E_NO_GOOD_SECURITY_PACKAGES
//
// MessageText:
//
// No security packages are installed on this machine or the user is not logged on or there are no compatible security packages between the client and server.
//
#define RPC_E_NO_GOOD_SECURITY_PACKAGES  _HRESULT_TYPEDEF_(0x8001011AL)

//
// MessageId: RPC_E_ACCESS_DENIED
//
// MessageText:
//
// Access is denied.
//
#define RPC_E_ACCESS_DENIED              _HRESULT_TYPEDEF_(0x8001011BL)

//
// MessageId: RPC_E_REMOTE_DISABLED
//
// MessageText:
//
// Remote calls are not allowed for this process.
//
#define RPC_E_REMOTE_DISABLED            _HRESULT_TYPEDEF_(0x8001011CL)

//
// MessageId: RPC_E_INVALID_OBJREF
//
// MessageText:
//
// The marshaled interface data packet (OBJREF) has an invalid or unknown format.
//
#define RPC_E_INVALID_OBJREF             _HRESULT_TYPEDEF_(0x8001011DL)

//
// MessageId: RPC_E_NO_CONTEXT
//
// MessageText:
//
// No context is associated with this call. This happens for some custom marshalled calls and on the client side of the call.
//
#define RPC_E_NO_CONTEXT                 _HRESULT_TYPEDEF_(0x8001011EL)

//
// MessageId: RPC_E_TIMEOUT
//
// MessageText:
//
// This operation returned because the timeout period expired.
//
#define RPC_E_TIMEOUT                    _HRESULT_TYPEDEF_(0x8001011FL)

//
// MessageId: RPC_E_NO_SYNC
//
// MessageText:
//
// There are no synchronize objects to wait on.
//
#define RPC_E_NO_SYNC                    _HRESULT_TYPEDEF_(0x80010120L)

//
// MessageId: RPC_E_FULLSIC_REQUIRED
//
// MessageText:
//
// Full subject issuer chain SSL principal name expected from the server.
//
#define RPC_E_FULLSIC_REQUIRED           _HRESULT_TYPEDEF_(0x80010121L)

//
// MessageId: RPC_E_INVALID_STD_NAME
//
// MessageText:
//
// Principal name is not a valid MSSTD name.
//
#define RPC_E_INVALID_STD_NAME           _HRESULT_TYPEDEF_(0x80010122L)

//
// MessageId: CO_E_FAILEDTOIMPERSONATE
//
// MessageText:
//
// Unable to impersonate DCOM client
//
#define CO_E_FAILEDTOIMPERSONATE         _HRESULT_TYPEDEF_(0x80010123L)

//
// MessageId: CO_E_FAILEDTOGETSECCTX
//
// MessageText:
//
// Unable to obtain server's security context
//
#define CO_E_FAILEDTOGETSECCTX           _HRESULT_TYPEDEF_(0x80010124L)

//
// MessageId: CO_E_FAILEDTOOPENTHREADTOKEN
//
// MessageText:
//
// Unable to open the access token of the current thread
//
#define CO_E_FAILEDTOOPENTHREADTOKEN     _HRESULT_TYPEDEF_(0x80010125L)

//
// MessageId: CO_E_FAILEDTOGETTOKENINFO
//
// MessageText:
//
// Unable to obtain user info from an access token
//
#define CO_E_FAILEDTOGETTOKENINFO        _HRESULT_TYPEDEF_(0x80010126L)

//
// MessageId: CO_E_TRUSTEEDOESNTMATCHCLIENT
//
// MessageText:
//
// The client who called IAccessControl::IsAccessPermitted was not the trustee provided to the method
//
#define CO_E_TRUSTEEDOESNTMATCHCLIENT    _HRESULT_TYPEDEF_(0x80010127L)

//
// MessageId: CO_E_FAILEDTOQUERYCLIENTBLANKET
//
// MessageText:
//
// Unable to obtain the client's security blanket
//
#define CO_E_FAILEDTOQUERYCLIENTBLANKET  _HRESULT_TYPEDEF_(0x80010128L)

//
// MessageId: CO_E_FAILEDTOSETDACL
//
// MessageText:
//
// Unable to set a discretionary ACL into a security descriptor
//
#define CO_E_FAILEDTOSETDACL             _HRESULT_TYPEDEF_(0x80010129L)

//
// MessageId: CO_E_ACCESSCHECKFAILED
//
// MessageText:
//
// The system function, AccessCheck, returned false
//
#define CO_E_ACCESSCHECKFAILED           _HRESULT_TYPEDEF_(0x8001012AL)

//
// MessageId: CO_E_NETACCESSAPIFAILED
//
// MessageText:
//
// Either NetAccessDel or NetAccessAdd returned an error code.
//
#define CO_E_NETACCESSAPIFAILED          _HRESULT_TYPEDEF_(0x8001012BL)

//
// MessageId: CO_E_WRONGTRUSTEENAMESYNTAX
//
// MessageText:
//
// One of the trustee strings provided by the user did not conform to the <Domain>\<Name> syntax and it was not the "*" string
//
#define CO_E_WRONGTRUSTEENAMESYNTAX      _HRESULT_TYPEDEF_(0x8001012CL)

//
// MessageId: CO_E_INVALIDSID
//
// MessageText:
//
// One of the security identifiers provided by the user was invalid
//
#define CO_E_INVALIDSID                  _HRESULT_TYPEDEF_(0x8001012DL)

//
// MessageId: CO_E_CONVERSIONFAILED
//
// MessageText:
//
// Unable to convert a wide character trustee string to a multibyte trustee string
//
#define CO_E_CONVERSIONFAILED            _HRESULT_TYPEDEF_(0x8001012EL)

//
// MessageId: CO_E_NOMATCHINGSIDFOUND
//
// MessageText:
//
// Unable to find a security identifier that corresponds to a trustee string provided by the user
//
#define CO_E_NOMATCHINGSIDFOUND          _HRESULT_TYPEDEF_(0x8001012FL)

//
// MessageId: CO_E_LOOKUPACCSIDFAILED
//
// MessageText:
//
// The system function, LookupAccountSID, failed
//
#define CO_E_LOOKUPACCSIDFAILED          _HRESULT_TYPEDEF_(0x80010130L)

//
// MessageId: CO_E_NOMATCHINGNAMEFOUND
//
// MessageText:
//
// Unable to find a trustee name that corresponds to a security identifier provided by the user
//
#define CO_E_NOMATCHINGNAMEFOUND         _HRESULT_TYPEDEF_(0x80010131L)

//
// MessageId: CO_E_LOOKUPACCNAMEFAILED
//
// MessageText:
//
// The system function, LookupAccountName, failed
//
#define CO_E_LOOKUPACCNAMEFAILED         _HRESULT_TYPEDEF_(0x80010132L)

//
// MessageId: CO_E_SETSERLHNDLFAILED
//
// MessageText:
//
// Unable to set or reset a serialization handle
//
#define CO_E_SETSERLHNDLFAILED           _HRESULT_TYPEDEF_(0x80010133L)

//
// MessageId: CO_E_FAILEDTOGETWINDIR
//
// MessageText:
//
// Unable to obtain the Windows directory
//
#define CO_E_FAILEDTOGETWINDIR           _HRESULT_TYPEDEF_(0x80010134L)

//
// MessageId: CO_E_PATHTOOLONG
//
// MessageText:
//
// Path too long
//
#define CO_E_PATHTOOLONG                 _HRESULT_TYPEDEF_(0x80010135L)

//
// MessageId: CO_E_FAILEDTOGENUUID
//
// MessageText:
//
// Unable to generate a uuid.
//
#define CO_E_FAILEDTOGENUUID             _HRESULT_TYPEDEF_(0x80010136L)

//
// MessageId: CO_E_FAILEDTOCREATEFILE
//
// MessageText:
//
// Unable to create file
//
#define CO_E_FAILEDTOCREATEFILE          _HRESULT_TYPEDEF_(0x80010137L)

//
// MessageId: CO_E_FAILEDTOCLOSEHANDLE
//
// MessageText:
//
// Unable to close a serialization handle or a file handle.
//
#define CO_E_FAILEDTOCLOSEHANDLE         _HRESULT_TYPEDEF_(0x80010138L)

//
// MessageId: CO_E_EXCEEDSYSACLLIMIT
//
// MessageText:
//
// The number of ACEs in an ACL exceeds the system limit.
//
#define CO_E_EXCEEDSYSACLLIMIT           _HRESULT_TYPEDEF_(0x80010139L)

//
// MessageId: CO_E_ACESINWRONGORDER
//
// MessageText:
//
// Not all the DENY_ACCESS ACEs are arranged in front of the GRANT_ACCESS ACEs in the stream.
//
#define CO_E_ACESINWRONGORDER            _HRESULT_TYPEDEF_(0x8001013AL)

//
// MessageId: CO_E_INCOMPATIBLESTREAMVERSION
//
// MessageText:
//
// The version of ACL format in the stream is not supported by this implementation of IAccessControl
//
#define CO_E_INCOMPATIBLESTREAMVERSION   _HRESULT_TYPEDEF_(0x8001013BL)

//
// MessageId: CO_E_FAILEDTOOPENPROCESSTOKEN
//
// MessageText:
//
// Unable to open the access token of the server process
//
#define CO_E_FAILEDTOOPENPROCESSTOKEN    _HRESULT_TYPEDEF_(0x8001013CL)

//
// MessageId: CO_E_DECODEFAILED
//
// MessageText:
//
// Unable to decode the ACL in the stream provided by the user
//
#define CO_E_DECODEFAILED                _HRESULT_TYPEDEF_(0x8001013DL)

//
// MessageId: CO_E_ACNOTINITIALIZED
//
// MessageText:
//
// The COM IAccessControl object is not initialized
//
#define CO_E_ACNOTINITIALIZED            _HRESULT_TYPEDEF_(0x8001013FL)

//
// MessageId: CO_E_CANCEL_DISABLED
//
// MessageText:
//
// Call Cancellation is disabled
//
#define CO_E_CANCEL_DISABLED             _HRESULT_TYPEDEF_(0x80010140L)

//
// MessageId: RPC_E_UNEXPECTED
//
// MessageText:
//
// An internal error occurred.
//
#define RPC_E_UNEXPECTED                 _HRESULT_TYPEDEF_(0x8001FFFFL)



//////////////////////////////////////
//                                  //
// Additional Security Status Codes //
//                                  //
// Facility=Security                //
//                                  //
//////////////////////////////////////


//
// MessageId: ERROR_AUDITING_DISABLED
//
// MessageText:
//
// The specified event is currently not being audited.
//
#define ERROR_AUDITING_DISABLED          _HRESULT_TYPEDEF_(0xC0090001L)

//
// MessageId: ERROR_ALL_SIDS_FILTERED
//
// MessageText:
//
// The SID filtering operation removed all SIDs.
//
#define ERROR_ALL_SIDS_FILTERED          _HRESULT_TYPEDEF_(0xC0090002L)

//
// MessageId: ERROR_BIZRULES_NOT_ENABLED
//
// MessageText:
//
// Business rule scripts are disabled for the calling application.
//
#define ERROR_BIZRULES_NOT_ENABLED       _HRESULT_TYPEDEF_(0xC0090003L)



/////////////////////////////////////////////
//                                         //
// end of Additional Security Status Codes //
//                                         //
/////////////////////////////////////////////



 /////////////////
 //
 //  FACILITY_SSPI
 //
 /////////////////

//
// MessageId: NTE_BAD_UID
//
// MessageText:
//
// Bad UID.
//
#define NTE_BAD_UID                      _HRESULT_TYPEDEF_(0x80090001L)

//
// MessageId: NTE_BAD_HASH
//
// MessageText:
//
// Bad Hash.
//
#define NTE_BAD_HASH                     _HRESULT_TYPEDEF_(0x80090002L)

//
// MessageId: NTE_BAD_KEY
//
// MessageText:
//
// Bad Key.
//
#define NTE_BAD_KEY                      _HRESULT_TYPEDEF_(0x80090003L)

//
// MessageId: NTE_BAD_LEN
//
// MessageText:
//
// Bad Length.
//
#define NTE_BAD_LEN                      _HRESULT_TYPEDEF_(0x80090004L)

//
// MessageId: NTE_BAD_DATA
//
// MessageText:
//
// Bad Data.
//
#define NTE_BAD_DATA                     _HRESULT_TYPEDEF_(0x80090005L)

//
// MessageId: NTE_BAD_SIGNATURE
//
// MessageText:
//
// Invalid Signature.
//
#define NTE_BAD_SIGNATURE                _HRESULT_TYPEDEF_(0x80090006L)

//
// MessageId: NTE_BAD_VER
//
// MessageText:
//
// Bad Version of provider.
//
#define NTE_BAD_VER                      _HRESULT_TYPEDEF_(0x80090007L)

//
// MessageId: NTE_BAD_ALGID
//
// MessageText:
//
// Invalid algorithm specified.
//
#define NTE_BAD_ALGID                    _HRESULT_TYPEDEF_(0x80090008L)

//
// MessageId: NTE_BAD_FLAGS
//
// MessageText:
//
// Invalid flags specified.
//
#define NTE_BAD_FLAGS                    _HRESULT_TYPEDEF_(0x80090009L)

//
// MessageId: NTE_BAD_TYPE
//
// MessageText:
//
// Invalid type specified.
//
#define NTE_BAD_TYPE                     _HRESULT_TYPEDEF_(0x8009000AL)

//
// MessageId: NTE_BAD_KEY_STATE
//
// MessageText:
//
// Key not valid for use in specified state.
//
#define NTE_BAD_KEY_STATE                _HRESULT_TYPEDEF_(0x8009000BL)

//
// MessageId: NTE_BAD_HASH_STATE
//
// MessageText:
//
// Hash not valid for use in specified state.
//
#define NTE_BAD_HASH_STATE               _HRESULT_TYPEDEF_(0x8009000CL)

//
// MessageId: NTE_NO_KEY
//
// MessageText:
//
// Key does not exist.
//
#define NTE_NO_KEY                       _HRESULT_TYPEDEF_(0x8009000DL)

//
// MessageId: NTE_NO_MEMORY
//
// MessageText:
//
// Insufficient memory available for the operation.
//
#define NTE_NO_MEMORY                    _HRESULT_TYPEDEF_(0x8009000EL)

//
// MessageId: NTE_EXISTS
//
// MessageText:
//
// Object already exists.
//
#define NTE_EXISTS                       _HRESULT_TYPEDEF_(0x8009000FL)

//
// MessageId: NTE_PERM
//
// MessageText:
//
// Access denied.
//
#define NTE_PERM                         _HRESULT_TYPEDEF_(0x80090010L)

//
// MessageId: NTE_NOT_FOUND
//
// MessageText:
//
// Object was not found.
//
#define NTE_NOT_FOUND                    _HRESULT_TYPEDEF_(0x80090011L)

//
// MessageId: NTE_DOUBLE_ENCRYPT
//
// MessageText:
//
// Data already encrypted.
//
#define NTE_DOUBLE_ENCRYPT               _HRESULT_TYPEDEF_(0x80090012L)

//
// MessageId: NTE_BAD_PROVIDER
//
// MessageText:
//
// Invalid provider specified.
//
#define NTE_BAD_PROVIDER                 _HRESULT_TYPEDEF_(0x80090013L)

//
// MessageId: NTE_BAD_PROV_TYPE
//
// MessageText:
//
// Invalid provider type specified.
//
#define NTE_BAD_PROV_TYPE                _HRESULT_TYPEDEF_(0x80090014L)

//
// MessageId: NTE_BAD_PUBLIC_KEY
//
// MessageText:
//
// Provider's public key is invalid.
//
#define NTE_BAD_PUBLIC_KEY               _HRESULT_TYPEDEF_(0x80090015L)

//
// MessageId: NTE_BAD_KEYSET
//
// MessageText:
//
// Keyset does not exist
//
#define NTE_BAD_KEYSET                   _HRESULT_TYPEDEF_(0x80090016L)

//
// MessageId: NTE_PROV_TYPE_NOT_DEF
//
// MessageText:
//
// Provider type not defined.
//
#define NTE_PROV_TYPE_NOT_DEF            _HRESULT_TYPEDEF_(0x80090017L)

//
// MessageId: NTE_PROV_TYPE_ENTRY_BAD
//
// MessageText:
//
// Provider type as registered is invalid.
//
#define NTE_PROV_TYPE_ENTRY_BAD          _HRESULT_TYPEDEF_(0x80090018L)

//
// MessageId: NTE_KEYSET_NOT_DEF
//
// MessageText:
//
// The keyset is not defined.
//
#define NTE_KEYSET_NOT_DEF               _HRESULT_TYPEDEF_(0x80090019L)

//
// MessageId: NTE_KEYSET_ENTRY_BAD
//
// MessageText:
//
// Keyset as registered is invalid.
//
#define NTE_KEYSET_ENTRY_BAD             _HRESULT_TYPEDEF_(0x8009001AL)

//
// MessageId: NTE_PROV_TYPE_NO_MATCH
//
// MessageText:
//
// Provider type does not match registered value.
//
#define NTE_PROV_TYPE_NO_MATCH           _HRESULT_TYPEDEF_(0x8009001BL)

//
// MessageId: NTE_SIGNATURE_FILE_BAD
//
// MessageText:
//
// The digital signature file is corrupt.
//
#define NTE_SIGNATURE_FILE_BAD           _HRESULT_TYPEDEF_(0x8009001CL)

//
// MessageId: NTE_PROVIDER_DLL_FAIL
//
// MessageText:
//
// Provider DLL failed to initialize correctly.
//
#define NTE_PROVIDER_DLL_FAIL            _HRESULT_TYPEDEF_(0x8009001DL)

//
// MessageId: NTE_PROV_DLL_NOT_FOUND
//
// MessageText:
//
// Provider DLL could not be found.
//
#define NTE_PROV_DLL_NOT_FOUND           _HRESULT_TYPEDEF_(0x8009001EL)

//
// MessageId: NTE_BAD_KEYSET_PARAM
//
// MessageText:
//
// The Keyset parameter is invalid.
//
#define NTE_BAD_KEYSET_PARAM             _HRESULT_TYPEDEF_(0x8009001FL)

//
// MessageId: NTE_FAIL
//
// MessageText:
//
// An internal error occurred.
//
#define NTE_FAIL                         _HRESULT_TYPEDEF_(0x80090020L)

//
// MessageId: NTE_SYS_ERR
//
// MessageText:
//
// A base error occurred.
//
#define NTE_SYS_ERR                      _HRESULT_TYPEDEF_(0x80090021L)

//
// MessageId: NTE_SILENT_CONTEXT
//
// MessageText:
//
// Provider could not perform the action since the context was acquired as silent.
//
#define NTE_SILENT_CONTEXT               _HRESULT_TYPEDEF_(0x80090022L)

//
// MessageId: NTE_TOKEN_KEYSET_STORAGE_FULL
//
// MessageText:
//
// The security token does not have storage space available for an additional container.
//
#define NTE_TOKEN_KEYSET_STORAGE_FULL    _HRESULT_TYPEDEF_(0x80090023L)

//
// MessageId: NTE_TEMPORARY_PROFILE
//
// MessageText:
//
// The profile for the user is a temporary profile.
//
#define NTE_TEMPORARY_PROFILE            _HRESULT_TYPEDEF_(0x80090024L)

//
// MessageId: NTE_FIXEDPARAMETER
//
// MessageText:
//
// The key parameters could not be set because the CSP uses fixed parameters.
//
#define NTE_FIXEDPARAMETER               _HRESULT_TYPEDEF_(0x80090025L)

//
// MessageId: NTE_INVALID_HANDLE
//
// MessageText:
//
// The supplied handle is invalid.
//
#define NTE_INVALID_HANDLE               _HRESULT_TYPEDEF_(0x80090026L)

//
// MessageId: NTE_INVALID_PARAMETER
//
// MessageText:
//
// The parameter is incorrect.
//
#define NTE_INVALID_PARAMETER            _HRESULT_TYPEDEF_(0x80090027L)

//
// MessageId: NTE_BUFFER_TOO_SMALL
//
// MessageText:
//
// The buffer supplied to a function was too small.
//
#define NTE_BUFFER_TOO_SMALL             _HRESULT_TYPEDEF_(0x80090028L)

//
// MessageId: NTE_NOT_SUPPORTED
//
// MessageText:
//
// The requested operation is not supported.
//
#define NTE_NOT_SUPPORTED                _HRESULT_TYPEDEF_(0x80090029L)

//
// MessageId: NTE_NO_MORE_ITEMS
//
// MessageText:
//
// No more data is available.
//
#define NTE_NO_MORE_ITEMS                _HRESULT_TYPEDEF_(0x8009002AL)

//
// MessageId: NTE_BUFFERS_OVERLAP
//
// MessageText:
//
// The supplied buffers overlap incorrectly.
//
#define NTE_BUFFERS_OVERLAP              _HRESULT_TYPEDEF_(0x8009002BL)

//
// MessageId: NTE_DECRYPTION_FAILURE
//
// MessageText:
//
// The specified data could not be decrypted.
//
#define NTE_DECRYPTION_FAILURE           _HRESULT_TYPEDEF_(0x8009002CL)

//
// MessageId: NTE_INTERNAL_ERROR
//
// MessageText:
//
// An internal consistency check failed.
//
#define NTE_INTERNAL_ERROR               _HRESULT_TYPEDEF_(0x8009002DL)

//
// MessageId: NTE_UI_REQUIRED
//
// MessageText:
//
// This operation requires input from the user.
//
#define NTE_UI_REQUIRED                  _HRESULT_TYPEDEF_(0x8009002EL)

//
// MessageId: NTE_HMAC_NOT_SUPPORTED
//
// MessageText:
//
// The cryptographic provider does not support HMAC.
//
#define NTE_HMAC_NOT_SUPPORTED           _HRESULT_TYPEDEF_(0x8009002FL)

//
// MessageId: SEC_E_INSUFFICIENT_MEMORY
//
// MessageText:
//
// Not enough memory is available to complete this request
//
#define SEC_E_INSUFFICIENT_MEMORY        _HRESULT_TYPEDEF_(0x80090300L)

//
// MessageId: SEC_E_INVALID_HANDLE
//
// MessageText:
//
// The handle specified is invalid
//
#define SEC_E_INVALID_HANDLE             _HRESULT_TYPEDEF_(0x80090301L)

//
// MessageId: SEC_E_UNSUPPORTED_FUNCTION
//
// MessageText:
//
// The function requested is not supported
//
#define SEC_E_UNSUPPORTED_FUNCTION       _HRESULT_TYPEDEF_(0x80090302L)

//
// MessageId: SEC_E_TARGET_UNKNOWN
//
// MessageText:
//
// The specified target is unknown or unreachable
//
#define SEC_E_TARGET_UNKNOWN             _HRESULT_TYPEDEF_(0x80090303L)

//
// MessageId: SEC_E_INTERNAL_ERROR
//
// MessageText:
//
// The Local Security Authority cannot be contacted
//
#define SEC_E_INTERNAL_ERROR             _HRESULT_TYPEDEF_(0x80090304L)

//
// MessageId: SEC_E_SECPKG_NOT_FOUND
//
// MessageText:
//
// The requested security package does not exist
//
#define SEC_E_SECPKG_NOT_FOUND           _HRESULT_TYPEDEF_(0x80090305L)

//
// MessageId: SEC_E_NOT_OWNER
//
// MessageText:
//
// The caller is not the owner of the desired credentials
//
#define SEC_E_NOT_OWNER                  _HRESULT_TYPEDEF_(0x80090306L)

//
// MessageId: SEC_E_CANNOT_INSTALL
//
// MessageText:
//
// The security package failed to initialize, and cannot be installed
//
#define SEC_E_CANNOT_INSTALL             _HRESULT_TYPEDEF_(0x80090307L)

//
// MessageId: SEC_E_INVALID_TOKEN
//
// MessageText:
//
// The token supplied to the function is invalid
//
#define SEC_E_INVALID_TOKEN              _HRESULT_TYPEDEF_(0x80090308L)

//
// MessageId: SEC_E_CANNOT_PACK
//
// MessageText:
//
// The security package is not able to marshall the logon buffer, so the logon attempt has failed
//
#define SEC_E_CANNOT_PACK                _HRESULT_TYPEDEF_(0x80090309L)

//
// MessageId: SEC_E_QOP_NOT_SUPPORTED
//
// MessageText:
//
// The per-message Quality of Protection is not supported by the security package
//
#define SEC_E_QOP_NOT_SUPPORTED          _HRESULT_TYPEDEF_(0x8009030AL)

//
// MessageId: SEC_E_NO_IMPERSONATION
//
// MessageText:
//
// The security context does not allow impersonation of the client
//
#define SEC_E_NO_IMPERSONATION           _HRESULT_TYPEDEF_(0x8009030BL)

//
// MessageId: SEC_E_LOGON_DENIED
//
// MessageText:
//
// The logon attempt failed
//
#define SEC_E_LOGON_DENIED               _HRESULT_TYPEDEF_(0x8009030CL)

//
// MessageId: SEC_E_UNKNOWN_CREDENTIALS
//
// MessageText:
//
// The credentials supplied to the package were not recognized
//
#define SEC_E_UNKNOWN_CREDENTIALS        _HRESULT_TYPEDEF_(0x8009030DL)

//
// MessageId: SEC_E_NO_CREDENTIALS
//
// MessageText:
//
// No credentials are available in the security package
//
#define SEC_E_NO_CREDENTIALS             _HRESULT_TYPEDEF_(0x8009030EL)

//
// MessageId: SEC_E_MESSAGE_ALTERED
//
// MessageText:
//
// The message or signature supplied for verification has been altered
//
#define SEC_E_MESSAGE_ALTERED            _HRESULT_TYPEDEF_(0x8009030FL)

//
// MessageId: SEC_E_OUT_OF_SEQUENCE
//
// MessageText:
//
// The message supplied for verification is out of sequence
//
#define SEC_E_OUT_OF_SEQUENCE            _HRESULT_TYPEDEF_(0x80090310L)

//
// MessageId: SEC_E_NO_AUTHENTICATING_AUTHORITY
//
// MessageText:
//
// No authority could be contacted for authentication.
//
#define SEC_E_NO_AUTHENTICATING_AUTHORITY _HRESULT_TYPEDEF_(0x80090311L)

//
// MessageId: SEC_I_CONTINUE_NEEDED
//
// MessageText:
//
// The function completed successfully, but must be called again to complete the context
//
#define SEC_I_CONTINUE_NEEDED            _HRESULT_TYPEDEF_(0x00090312L)

//
// MessageId: SEC_I_COMPLETE_NEEDED
//
// MessageText:
//
// The function completed successfully, but CompleteToken must be called
//
#define SEC_I_COMPLETE_NEEDED            _HRESULT_TYPEDEF_(0x00090313L)

//
// MessageId: SEC_I_COMPLETE_AND_CONTINUE
//
// MessageText:
//
// The function completed successfully, but both CompleteToken and this function must be called to complete the context
//
#define SEC_I_COMPLETE_AND_CONTINUE      _HRESULT_TYPEDEF_(0x00090314L)

//
// MessageId: SEC_I_LOCAL_LOGON
//
// MessageText:
//
// The logon was completed, but no network authority was available. The logon was made using locally known information
//
#define SEC_I_LOCAL_LOGON                _HRESULT_TYPEDEF_(0x00090315L)

//
// MessageId: SEC_E_BAD_PKGID
//
// MessageText:
//
// The requested security package does not exist
//
#define SEC_E_BAD_PKGID                  _HRESULT_TYPEDEF_(0x80090316L)

//
// MessageId: SEC_E_CONTEXT_EXPIRED
//
// MessageText:
//
// The context has expired and can no longer be used.
//
#define SEC_E_CONTEXT_EXPIRED            _HRESULT_TYPEDEF_(0x80090317L)

//
// MessageId: SEC_I_CONTEXT_EXPIRED
//
// MessageText:
//
// The context has expired and can no longer be used.
//
#define SEC_I_CONTEXT_EXPIRED            _HRESULT_TYPEDEF_(0x00090317L)

//
// MessageId: SEC_E_INCOMPLETE_MESSAGE
//
// MessageText:
//
// The supplied message is incomplete. The signature was not verified.
//
#define SEC_E_INCOMPLETE_MESSAGE         _HRESULT_TYPEDEF_(0x80090318L)

//
// MessageId: SEC_E_INCOMPLETE_CREDENTIALS
//
// MessageText:
//
// The credentials supplied were not complete, and could not be verified. The context could not be initialized.
//
#define SEC_E_INCOMPLETE_CREDENTIALS     _HRESULT_TYPEDEF_(0x80090320L)

//
// MessageId: SEC_E_BUFFER_TOO_SMALL
//
// MessageText:
//
// The buffers supplied to a function was too small.
//
#define SEC_E_BUFFER_TOO_SMALL           _HRESULT_TYPEDEF_(0x80090321L)

//
// MessageId: SEC_I_INCOMPLETE_CREDENTIALS
//
// MessageText:
//
// The credentials supplied were not complete, and could not be verified. Additional information can be returned from the context.
//
#define SEC_I_INCOMPLETE_CREDENTIALS     _HRESULT_TYPEDEF_(0x00090320L)

//
// MessageId: SEC_I_RENEGOTIATE
//
// MessageText:
//
// The context data must be renegotiated with the peer.
//
#define SEC_I_RENEGOTIATE                _HRESULT_TYPEDEF_(0x00090321L)

//
// MessageId: SEC_E_WRONG_PRINCIPAL
//
// MessageText:
//
// The target principal name is incorrect.
//
#define SEC_E_WRONG_PRINCIPAL            _HRESULT_TYPEDEF_(0x80090322L)

//
// MessageId: SEC_I_NO_LSA_CONTEXT
//
// MessageText:
//
// There is no LSA mode context associated with this context.
//
#define SEC_I_NO_LSA_CONTEXT             _HRESULT_TYPEDEF_(0x00090323L)

//
// MessageId: SEC_E_TIME_SKEW
//
// MessageText:
//
// The clocks on the client and server machines are skewed.
//
#define SEC_E_TIME_SKEW                  _HRESULT_TYPEDEF_(0x80090324L)

//
// MessageId: SEC_E_UNTRUSTED_ROOT
//
// MessageText:
//
// The certificate chain was issued by an authority that is not trusted.
//
#define SEC_E_UNTRUSTED_ROOT             _HRESULT_TYPEDEF_(0x80090325L)

//
// MessageId: SEC_E_ILLEGAL_MESSAGE
//
// MessageText:
//
// The message received was unexpected or badly formatted.
//
#define SEC_E_ILLEGAL_MESSAGE            _HRESULT_TYPEDEF_(0x80090326L)

//
// MessageId: SEC_E_CERT_UNKNOWN
//
// MessageText:
//
// An unknown error occurred while processing the certificate.
//
#define SEC_E_CERT_UNKNOWN               _HRESULT_TYPEDEF_(0x80090327L)

//
// MessageId: SEC_E_CERT_EXPIRED
//
// MessageText:
//
// The received certificate has expired.
//
#define SEC_E_CERT_EXPIRED               _HRESULT_TYPEDEF_(0x80090328L)

//
// MessageId: SEC_E_ENCRYPT_FAILURE
//
// MessageText:
//
// The specified data could not be encrypted.
//
#define SEC_E_ENCRYPT_FAILURE            _HRESULT_TYPEDEF_(0x80090329L)

//
// MessageId: SEC_E_DECRYPT_FAILURE
//
// MessageText:
//
// The specified data could not be decrypted.
// 
//
#define SEC_E_DECRYPT_FAILURE            _HRESULT_TYPEDEF_(0x80090330L)

//
// MessageId: SEC_E_ALGORITHM_MISMATCH
//
// MessageText:
//
// The client and server cannot communicate, because they do not possess a common algorithm.
//
#define SEC_E_ALGORITHM_MISMATCH         _HRESULT_TYPEDEF_(0x80090331L)

//
// MessageId: SEC_E_SECURITY_QOS_FAILED
//
// MessageText:
//
// The security context could not be established due to a failure in the requested quality of service (e.g. mutual authentication or delegation).
//
#define SEC_E_SECURITY_QOS_FAILED        _HRESULT_TYPEDEF_(0x80090332L)

//
// MessageId: SEC_E_UNFINISHED_CONTEXT_DELETED
//
// MessageText:
//
// A security context was deleted before the context was completed. This is considered a logon failure.
//
#define SEC_E_UNFINISHED_CONTEXT_DELETED _HRESULT_TYPEDEF_(0x80090333L)

//
// MessageId: SEC_E_NO_TGT_REPLY
//
// MessageText:
//
// The client is trying to negotiate a context and the server requires user-to-user but didn't send a TGT reply.
//
#define SEC_E_NO_TGT_REPLY               _HRESULT_TYPEDEF_(0x80090334L)

//
// MessageId: SEC_E_NO_IP_ADDRESSES
//
// MessageText:
//
// Unable to accomplish the requested task because the local machine does not have any IP addresses.
//
#define SEC_E_NO_IP_ADDRESSES            _HRESULT_TYPEDEF_(0x80090335L)

//
// MessageId: SEC_E_WRONG_CREDENTIAL_HANDLE
//
// MessageText:
//
// The supplied credential handle does not match the credential associated with the security context.
//
#define SEC_E_WRONG_CREDENTIAL_HANDLE    _HRESULT_TYPEDEF_(0x80090336L)

//
// MessageId: SEC_E_CRYPTO_SYSTEM_INVALID
//
// MessageText:
//
// The crypto system or checksum function is invalid because a required function is unavailable.
//
#define SEC_E_CRYPTO_SYSTEM_INVALID      _HRESULT_TYPEDEF_(0x80090337L)

//
// MessageId: SEC_E_MAX_REFERRALS_EXCEEDED
//
// MessageText:
//
// The number of maximum ticket referrals has been exceeded.
//
#define SEC_E_MAX_REFERRALS_EXCEEDED     _HRESULT_TYPEDEF_(0x80090338L)

//
// MessageId: SEC_E_MUST_BE_KDC
//
// MessageText:
//
// The local machine must be a Kerberos KDC (domain controller) and it is not.
//
#define SEC_E_MUST_BE_KDC                _HRESULT_TYPEDEF_(0x80090339L)

//
// MessageId: SEC_E_STRONG_CRYPTO_NOT_SUPPORTED
//
// MessageText:
//
// The other end of the security negotiation is requires strong crypto but it is not supported on the local machine.
//
#define SEC_E_STRONG_CRYPTO_NOT_SUPPORTED _HRESULT_TYPEDEF_(0x8009033AL)

//
// MessageId: SEC_E_TOO_MANY_PRINCIPALS
//
// MessageText:
//
// The KDC reply contained more than one principal name.
//
#define SEC_E_TOO_MANY_PRINCIPALS        _HRESULT_TYPEDEF_(0x8009033BL)

//
// MessageId: SEC_E_NO_PA_DATA
//
// MessageText:
//
// Expected to find PA data for a hint of what etype to use, but it was not found.
//
#define SEC_E_NO_PA_DATA                 _HRESULT_TYPEDEF_(0x8009033CL)

//
// MessageId: SEC_E_PKINIT_NAME_MISMATCH
//
// MessageText:
//
// The client certificate does not contain a valid UPN, or does not match the client name
// in the logon request. Please contact your administrator.
//
#define SEC_E_PKINIT_NAME_MISMATCH       _HRESULT_TYPEDEF_(0x8009033DL)

//
// MessageId: SEC_E_SMARTCARD_LOGON_REQUIRED
//
// MessageText:
//
// Smartcard logon is required and was not used.
//
#define SEC_E_SMARTCARD_LOGON_REQUIRED   _HRESULT_TYPEDEF_(0x8009033EL)

//
// MessageId: SEC_E_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// A system shutdown is in progress.
//
#define SEC_E_SHUTDOWN_IN_PROGRESS       _HRESULT_TYPEDEF_(0x8009033FL)

//
// MessageId: SEC_E_KDC_INVALID_REQUEST
//
// MessageText:
//
// An invalid request was sent to the KDC.
//
#define SEC_E_KDC_INVALID_REQUEST        _HRESULT_TYPEDEF_(0x80090340L)

//
// MessageId: SEC_E_KDC_UNABLE_TO_REFER
//
// MessageText:
//
// The KDC was unable to generate a referral for the service requested.
//
#define SEC_E_KDC_UNABLE_TO_REFER        _HRESULT_TYPEDEF_(0x80090341L)

//
// MessageId: SEC_E_KDC_UNKNOWN_ETYPE
//
// MessageText:
//
// The encryption type requested is not supported by the KDC.
//
#define SEC_E_KDC_UNKNOWN_ETYPE          _HRESULT_TYPEDEF_(0x80090342L)

//
// MessageId: SEC_E_UNSUPPORTED_PREAUTH
//
// MessageText:
//
// An unsupported preauthentication mechanism was presented to the kerberos package.
//
#define SEC_E_UNSUPPORTED_PREAUTH        _HRESULT_TYPEDEF_(0x80090343L)

//
// MessageId: SEC_E_DELEGATION_REQUIRED
//
// MessageText:
//
// The requested operation cannot be completed. The computer must be trusted for delegation and the current user account must be configured to allow delegation.
//
#define SEC_E_DELEGATION_REQUIRED        _HRESULT_TYPEDEF_(0x80090345L)

//
// MessageId: SEC_E_BAD_BINDINGS
//
// MessageText:
//
// Client's supplied SSPI channel bindings were incorrect.
//
#define SEC_E_BAD_BINDINGS               _HRESULT_TYPEDEF_(0x80090346L)

//
// MessageId: SEC_E_MULTIPLE_ACCOUNTS
//
// MessageText:
//
// The received certificate was mapped to multiple accounts.
//
#define SEC_E_MULTIPLE_ACCOUNTS          _HRESULT_TYPEDEF_(0x80090347L)

//
// MessageId: SEC_E_NO_KERB_KEY
//
// MessageText:
//
//  SEC_E_NO_KERB_KEY
//
#define SEC_E_NO_KERB_KEY                _HRESULT_TYPEDEF_(0x80090348L)

//
// MessageId: SEC_E_CERT_WRONG_USAGE
//
// MessageText:
//
// The certificate is not valid for the requested usage.
//
#define SEC_E_CERT_WRONG_USAGE           _HRESULT_TYPEDEF_(0x80090349L)

//
// MessageId: SEC_E_DOWNGRADE_DETECTED
//
// MessageText:
//
// The system detected a possible attempt to compromise security. Please ensure that you can contact the server that authenticated you.
//
#define SEC_E_DOWNGRADE_DETECTED         _HRESULT_TYPEDEF_(0x80090350L)

//
// MessageId: SEC_E_SMARTCARD_CERT_REVOKED
//
// MessageText:
//
// The smartcard certificate used for authentication has been revoked. Please contact your system administrator. There may be additional information in the event log.
//
#define SEC_E_SMARTCARD_CERT_REVOKED     _HRESULT_TYPEDEF_(0x80090351L)

//
// MessageId: SEC_E_ISSUING_CA_UNTRUSTED
//
// MessageText:
//
// An untrusted certificate authority was detected While processing the smartcard certificate used for authentication. Please contact your system administrator.
//
#define SEC_E_ISSUING_CA_UNTRUSTED       _HRESULT_TYPEDEF_(0x80090352L)

//
// MessageId: SEC_E_REVOCATION_OFFLINE_C
//
// MessageText:
//
// The revocation status of the smartcard certificate used for
// authentication could not be determined. Please contact your system administrator.
//
#define SEC_E_REVOCATION_OFFLINE_C       _HRESULT_TYPEDEF_(0x80090353L)

//
// MessageId: SEC_E_PKINIT_CLIENT_FAILURE
//
// MessageText:
//
// The smartcard certificate used for authentication was not trusted. Please contact your system administrator.
//
#define SEC_E_PKINIT_CLIENT_FAILURE      _HRESULT_TYPEDEF_(0x80090354L)

//
// MessageId: SEC_E_SMARTCARD_CERT_EXPIRED
//
// MessageText:
//
// The smartcard certificate used for authentication has expired. Please contact your system administrator.
//
#define SEC_E_SMARTCARD_CERT_EXPIRED     _HRESULT_TYPEDEF_(0x80090355L)

//
// MessageId: SEC_E_NO_S4U_PROT_SUPPORT
//
// MessageText:
//
// The Kerberos subsystem encountered an error. A service for user protocol request was made against a domain controller which does not support service for user.
//
#define SEC_E_NO_S4U_PROT_SUPPORT        _HRESULT_TYPEDEF_(0x80090356L)

//
// MessageId: SEC_E_CROSSREALM_DELEGATION_FAILURE
//
// MessageText:
//
// An attempt was made by this server to make a Kerberos constrained delegation request for a target outside of the server's realm. This is not supported, and indicates a misconfiguration on this server's allowed to delegate to list. Please contact your administrator.
//
#define SEC_E_CROSSREALM_DELEGATION_FAILURE _HRESULT_TYPEDEF_(0x80090357L)

//
// MessageId: SEC_E_REVOCATION_OFFLINE_KDC
//
// MessageText:
//
// The revocation status of the domain controller certificate used for smartcard authentication could not be determined. There is additional information in the system event log. Please contact your system administrator.
//
#define SEC_E_REVOCATION_OFFLINE_KDC     _HRESULT_TYPEDEF_(0x80090358L)

//
// MessageId: SEC_E_ISSUING_CA_UNTRUSTED_KDC
//
// MessageText:
//
// An untrusted certificate authority was detected while processing the domain controller certificate used for authentication. There is additional information in the system event log. Please contact your system administrator.
//
#define SEC_E_ISSUING_CA_UNTRUSTED_KDC   _HRESULT_TYPEDEF_(0x80090359L)

//
// MessageId: SEC_E_KDC_CERT_EXPIRED
//
// MessageText:
//
// The domain controller certificate used for smartcard logon has expired. Please contact your system administrator with the contents of your system event log.
//
#define SEC_E_KDC_CERT_EXPIRED           _HRESULT_TYPEDEF_(0x8009035AL)

//
// MessageId: SEC_E_KDC_CERT_REVOKED
//
// MessageText:
//
// The domain controller certificate used for smartcard logon has been revoked. Please contact your system administrator with the contents of your system event log.
//
#define SEC_E_KDC_CERT_REVOKED           _HRESULT_TYPEDEF_(0x8009035BL)

//
// MessageId: SEC_I_SIGNATURE_NEEDED
//
// MessageText:
//
// A signature operation must be performed before the user can authenticate.
//
#define SEC_I_SIGNATURE_NEEDED           _HRESULT_TYPEDEF_(0x0009035CL)

//
// MessageId: SEC_E_INVALID_PARAMETER
//
// MessageText:
//
// One or more of the parameters passed to the function was invalid.
//
#define SEC_E_INVALID_PARAMETER          _HRESULT_TYPEDEF_(0x8009035DL)

//
// MessageId: SEC_E_DELEGATION_POLICY
//
// MessageText:
//
// Client policy does not allow credential delegation to target server.
//
#define SEC_E_DELEGATION_POLICY          _HRESULT_TYPEDEF_(0x8009035EL)

//
// MessageId: SEC_E_POLICY_NLTM_ONLY
//
// MessageText:
//
// Client policy does not allow credential delegation to target server with NLTM only authentication.
//
#define SEC_E_POLICY_NLTM_ONLY           _HRESULT_TYPEDEF_(0x8009035FL)

//
// MessageId: SEC_I_NO_RENEGOTIATION
//
// MessageText:
//
// The recipient rejected the renegotiation request.
//
#define SEC_I_NO_RENEGOTIATION           _HRESULT_TYPEDEF_(0x00090360L)

//
// Provided for backwards compatibility
//

#define SEC_E_NO_SPM SEC_E_INTERNAL_ERROR
#define SEC_E_NOT_SUPPORTED SEC_E_UNSUPPORTED_FUNCTION

//
// MessageId: CRYPT_E_MSG_ERROR
//
// MessageText:
//
// An error occurred while performing an operation on a cryptographic message.
//
#define CRYPT_E_MSG_ERROR                _HRESULT_TYPEDEF_(0x80091001L)

//
// MessageId: CRYPT_E_UNKNOWN_ALGO
//
// MessageText:
//
// Unknown cryptographic algorithm.
//
#define CRYPT_E_UNKNOWN_ALGO             _HRESULT_TYPEDEF_(0x80091002L)

//
// MessageId: CRYPT_E_OID_FORMAT
//
// MessageText:
//
// The object identifier is poorly formatted.
//
#define CRYPT_E_OID_FORMAT               _HRESULT_TYPEDEF_(0x80091003L)

//
// MessageId: CRYPT_E_INVALID_MSG_TYPE
//
// MessageText:
//
// Invalid cryptographic message type.
//
#define CRYPT_E_INVALID_MSG_TYPE         _HRESULT_TYPEDEF_(0x80091004L)

//
// MessageId: CRYPT_E_UNEXPECTED_ENCODING
//
// MessageText:
//
// Unexpected cryptographic message encoding.
//
#define CRYPT_E_UNEXPECTED_ENCODING      _HRESULT_TYPEDEF_(0x80091005L)

//
// MessageId: CRYPT_E_AUTH_ATTR_MISSING
//
// MessageText:
//
// The cryptographic message does not contain an expected authenticated attribute.
//
#define CRYPT_E_AUTH_ATTR_MISSING        _HRESULT_TYPEDEF_(0x80091006L)

//
// MessageId: CRYPT_E_HASH_VALUE
//
// MessageText:
//
// The hash value is not correct.
//
#define CRYPT_E_HASH_VALUE               _HRESULT_TYPEDEF_(0x80091007L)

//
// MessageId: CRYPT_E_INVALID_INDEX
//
// MessageText:
//
// The index value is not valid.
//
#define CRYPT_E_INVALID_INDEX            _HRESULT_TYPEDEF_(0x80091008L)

//
// MessageId: CRYPT_E_ALREADY_DECRYPTED
//
// MessageText:
//
// The content of the cryptographic message has already been decrypted.
//
#define CRYPT_E_ALREADY_DECRYPTED        _HRESULT_TYPEDEF_(0x80091009L)

//
// MessageId: CRYPT_E_NOT_DECRYPTED
//
// MessageText:
//
// The content of the cryptographic message has not been decrypted yet.
//
#define CRYPT_E_NOT_DECRYPTED            _HRESULT_TYPEDEF_(0x8009100AL)

//
// MessageId: CRYPT_E_RECIPIENT_NOT_FOUND
//
// MessageText:
//
// The enveloped-data message does not contain the specified recipient.
//
#define CRYPT_E_RECIPIENT_NOT_FOUND      _HRESULT_TYPEDEF_(0x8009100BL)

//
// MessageId: CRYPT_E_CONTROL_TYPE
//
// MessageText:
//
// Invalid control type.
//
#define CRYPT_E_CONTROL_TYPE             _HRESULT_TYPEDEF_(0x8009100CL)

//
// MessageId: CRYPT_E_ISSUER_SERIALNUMBER
//
// MessageText:
//
// Invalid issuer and/or serial number.
//
#define CRYPT_E_ISSUER_SERIALNUMBER      _HRESULT_TYPEDEF_(0x8009100DL)

//
// MessageId: CRYPT_E_SIGNER_NOT_FOUND
//
// MessageText:
//
// Cannot find the original signer.
//
#define CRYPT_E_SIGNER_NOT_FOUND         _HRESULT_TYPEDEF_(0x8009100EL)

//
// MessageId: CRYPT_E_ATTRIBUTES_MISSING
//
// MessageText:
//
// The cryptographic message does not contain all of the requested attributes.
//
#define CRYPT_E_ATTRIBUTES_MISSING       _HRESULT_TYPEDEF_(0x8009100FL)

//
// MessageId: CRYPT_E_STREAM_MSG_NOT_READY
//
// MessageText:
//
// The streamed cryptographic message is not ready to return data.
//
#define CRYPT_E_STREAM_MSG_NOT_READY     _HRESULT_TYPEDEF_(0x80091010L)

//
// MessageId: CRYPT_E_STREAM_INSUFFICIENT_DATA
//
// MessageText:
//
// The streamed cryptographic message requires more data to complete the decode operation.
//
#define CRYPT_E_STREAM_INSUFFICIENT_DATA _HRESULT_TYPEDEF_(0x80091011L)

//
// MessageId: CRYPT_I_NEW_PROTECTION_REQUIRED
//
// MessageText:
//
// The protected data needs to be re-protected.
//
#define CRYPT_I_NEW_PROTECTION_REQUIRED  _HRESULT_TYPEDEF_(0x00091012L)

//
// MessageId: CRYPT_E_BAD_LEN
//
// MessageText:
//
// The length specified for the output data was insufficient.
//
#define CRYPT_E_BAD_LEN                  _HRESULT_TYPEDEF_(0x80092001L)

//
// MessageId: CRYPT_E_BAD_ENCODE
//
// MessageText:
//
// An error occurred during encode or decode operation.
//
#define CRYPT_E_BAD_ENCODE               _HRESULT_TYPEDEF_(0x80092002L)

//
// MessageId: CRYPT_E_FILE_ERROR
//
// MessageText:
//
// An error occurred while reading or writing to a file.
//
#define CRYPT_E_FILE_ERROR               _HRESULT_TYPEDEF_(0x80092003L)

//
// MessageId: CRYPT_E_NOT_FOUND
//
// MessageText:
//
// Cannot find object or property.
//
#define CRYPT_E_NOT_FOUND                _HRESULT_TYPEDEF_(0x80092004L)

//
// MessageId: CRYPT_E_EXISTS
//
// MessageText:
//
// The object or property already exists.
//
#define CRYPT_E_EXISTS                   _HRESULT_TYPEDEF_(0x80092005L)

//
// MessageId: CRYPT_E_NO_PROVIDER
//
// MessageText:
//
// No provider was specified for the store or object.
//
#define CRYPT_E_NO_PROVIDER              _HRESULT_TYPEDEF_(0x80092006L)

//
// MessageId: CRYPT_E_SELF_SIGNED
//
// MessageText:
//
// The specified certificate is self signed.
//
#define CRYPT_E_SELF_SIGNED              _HRESULT_TYPEDEF_(0x80092007L)

//
// MessageId: CRYPT_E_DELETED_PREV
//
// MessageText:
//
// The previous certificate or CRL context was deleted.
//
#define CRYPT_E_DELETED_PREV             _HRESULT_TYPEDEF_(0x80092008L)

//
// MessageId: CRYPT_E_NO_MATCH
//
// MessageText:
//
// Cannot find the requested object.
//
#define CRYPT_E_NO_MATCH                 _HRESULT_TYPEDEF_(0x80092009L)

//
// MessageId: CRYPT_E_UNEXPECTED_MSG_TYPE
//
// MessageText:
//
// The certificate does not have a property that references a private key.
//
#define CRYPT_E_UNEXPECTED_MSG_TYPE      _HRESULT_TYPEDEF_(0x8009200AL)

//
// MessageId: CRYPT_E_NO_KEY_PROPERTY
//
// MessageText:
//
// Cannot find the certificate and private key for decryption.
//
#define CRYPT_E_NO_KEY_PROPERTY          _HRESULT_TYPEDEF_(0x8009200BL)

//
// MessageId: CRYPT_E_NO_DECRYPT_CERT
//
// MessageText:
//
// Cannot find the certificate and private key to use for decryption.
//
#define CRYPT_E_NO_DECRYPT_CERT          _HRESULT_TYPEDEF_(0x8009200CL)

//
// MessageId: CRYPT_E_BAD_MSG
//
// MessageText:
//
// Not a cryptographic message or the cryptographic message is not formatted correctly.
//
#define CRYPT_E_BAD_MSG                  _HRESULT_TYPEDEF_(0x8009200DL)

//
// MessageId: CRYPT_E_NO_SIGNER
//
// MessageText:
//
// The signed cryptographic message does not have a signer for the specified signer index.
//
#define CRYPT_E_NO_SIGNER                _HRESULT_TYPEDEF_(0x8009200EL)

//
// MessageId: CRYPT_E_PENDING_CLOSE
//
// MessageText:
//
// Final closure is pending until additional frees or closes.
//
#define CRYPT_E_PENDING_CLOSE            _HRESULT_TYPEDEF_(0x8009200FL)

//
// MessageId: CRYPT_E_REVOKED
//
// MessageText:
//
// The certificate is revoked.
//
#define CRYPT_E_REVOKED                  _HRESULT_TYPEDEF_(0x80092010L)

//
// MessageId: CRYPT_E_NO_REVOCATION_DLL
//
// MessageText:
//
// No Dll or exported function was found to verify revocation.
//
#define CRYPT_E_NO_REVOCATION_DLL        _HRESULT_TYPEDEF_(0x80092011L)

//
// MessageId: CRYPT_E_NO_REVOCATION_CHECK
//
// MessageText:
//
// The revocation function was unable to check revocation for the certificate.
//
#define CRYPT_E_NO_REVOCATION_CHECK      _HRESULT_TYPEDEF_(0x80092012L)

//
// MessageId: CRYPT_E_REVOCATION_OFFLINE
//
// MessageText:
//
// The revocation function was unable to check revocation because the revocation server was offline.
//
#define CRYPT_E_REVOCATION_OFFLINE       _HRESULT_TYPEDEF_(0x80092013L)

//
// MessageId: CRYPT_E_NOT_IN_REVOCATION_DATABASE
//
// MessageText:
//
// The certificate is not in the revocation server's database.
//
#define CRYPT_E_NOT_IN_REVOCATION_DATABASE _HRESULT_TYPEDEF_(0x80092014L)

//
// MessageId: CRYPT_E_INVALID_NUMERIC_STRING
//
// MessageText:
//
// The string contains a non-numeric character.
//
#define CRYPT_E_INVALID_NUMERIC_STRING   _HRESULT_TYPEDEF_(0x80092020L)

//
// MessageId: CRYPT_E_INVALID_PRINTABLE_STRING
//
// MessageText:
//
// The string contains a non-printable character.
//
#define CRYPT_E_INVALID_PRINTABLE_STRING _HRESULT_TYPEDEF_(0x80092021L)

//
// MessageId: CRYPT_E_INVALID_IA5_STRING
//
// MessageText:
//
// The string contains a character not in the 7 bit ASCII character set.
//
#define CRYPT_E_INVALID_IA5_STRING       _HRESULT_TYPEDEF_(0x80092022L)

//
// MessageId: CRYPT_E_INVALID_X500_STRING
//
// MessageText:
//
// The string contains an invalid X500 name attribute key, oid, value or delimiter.
//
#define CRYPT_E_INVALID_X500_STRING      _HRESULT_TYPEDEF_(0x80092023L)

//
// MessageId: CRYPT_E_NOT_CHAR_STRING
//
// MessageText:
//
// The dwValueType for the CERT_NAME_VALUE is not one of the character strings. Most likely it is either a CERT_RDN_ENCODED_BLOB or CERT_TDN_OCTED_STRING.
//
#define CRYPT_E_NOT_CHAR_STRING          _HRESULT_TYPEDEF_(0x80092024L)

//
// MessageId: CRYPT_E_FILERESIZED
//
// MessageText:
//
// The Put operation cannot continue. The file needs to be resized. However, there is already a signature present. A complete signing operation must be done.
//
#define CRYPT_E_FILERESIZED              _HRESULT_TYPEDEF_(0x80092025L)

//
// MessageId: CRYPT_E_SECURITY_SETTINGS
//
// MessageText:
//
// The cryptographic operation failed due to a local security option setting.
//
#define CRYPT_E_SECURITY_SETTINGS        _HRESULT_TYPEDEF_(0x80092026L)

//
// MessageId: CRYPT_E_NO_VERIFY_USAGE_DLL
//
// MessageText:
//
// No DLL or exported function was found to verify subject usage.
//
#define CRYPT_E_NO_VERIFY_USAGE_DLL      _HRESULT_TYPEDEF_(0x80092027L)

//
// MessageId: CRYPT_E_NO_VERIFY_USAGE_CHECK
//
// MessageText:
//
// The called function was unable to do a usage check on the subject.
//
#define CRYPT_E_NO_VERIFY_USAGE_CHECK    _HRESULT_TYPEDEF_(0x80092028L)

//
// MessageId: CRYPT_E_VERIFY_USAGE_OFFLINE
//
// MessageText:
//
// Since the server was offline, the called function was unable to complete the usage check.
//
#define CRYPT_E_VERIFY_USAGE_OFFLINE     _HRESULT_TYPEDEF_(0x80092029L)

//
// MessageId: CRYPT_E_NOT_IN_CTL
//
// MessageText:
//
// The subject was not found in a Certificate Trust List (CTL).
//
#define CRYPT_E_NOT_IN_CTL               _HRESULT_TYPEDEF_(0x8009202AL)

//
// MessageId: CRYPT_E_NO_TRUSTED_SIGNER
//
// MessageText:
//
// None of the signers of the cryptographic message or certificate trust list is trusted.
//
#define CRYPT_E_NO_TRUSTED_SIGNER        _HRESULT_TYPEDEF_(0x8009202BL)

//
// MessageId: CRYPT_E_MISSING_PUBKEY_PARA
//
// MessageText:
//
// The public key's algorithm parameters are missing.
//
#define CRYPT_E_MISSING_PUBKEY_PARA      _HRESULT_TYPEDEF_(0x8009202CL)

//
// MessageId: CRYPT_E_OSS_ERROR
//
// MessageText:
//
// OSS Certificate encode/decode error code base
// 
// See asn1code.h for a definition of the OSS runtime errors. The OSS
// error values are offset by CRYPT_E_OSS_ERROR.
//
#define CRYPT_E_OSS_ERROR                _HRESULT_TYPEDEF_(0x80093000L)

//
// MessageId: OSS_MORE_BUF
//
// MessageText:
//
// OSS ASN.1 Error: Output Buffer is too small.
//
#define OSS_MORE_BUF                     _HRESULT_TYPEDEF_(0x80093001L)

//
// MessageId: OSS_NEGATIVE_UINTEGER
//
// MessageText:
//
// OSS ASN.1 Error: Signed integer is encoded as a unsigned integer.
//
#define OSS_NEGATIVE_UINTEGER            _HRESULT_TYPEDEF_(0x80093002L)

//
// MessageId: OSS_PDU_RANGE
//
// MessageText:
//
// OSS ASN.1 Error: Unknown ASN.1 data type.
//
#define OSS_PDU_RANGE                    _HRESULT_TYPEDEF_(0x80093003L)

//
// MessageId: OSS_MORE_INPUT
//
// MessageText:
//
// OSS ASN.1 Error: Output buffer is too small, the decoded data has been truncated.
//
#define OSS_MORE_INPUT                   _HRESULT_TYPEDEF_(0x80093004L)

//
// MessageId: OSS_DATA_ERROR
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_DATA_ERROR                   _HRESULT_TYPEDEF_(0x80093005L)

//
// MessageId: OSS_BAD_ARG
//
// MessageText:
//
// OSS ASN.1 Error: Invalid argument.
//
#define OSS_BAD_ARG                      _HRESULT_TYPEDEF_(0x80093006L)

//
// MessageId: OSS_BAD_VERSION
//
// MessageText:
//
// OSS ASN.1 Error: Encode/Decode version mismatch.
//
#define OSS_BAD_VERSION                  _HRESULT_TYPEDEF_(0x80093007L)

//
// MessageId: OSS_OUT_MEMORY
//
// MessageText:
//
// OSS ASN.1 Error: Out of memory.
//
#define OSS_OUT_MEMORY                   _HRESULT_TYPEDEF_(0x80093008L)

//
// MessageId: OSS_PDU_MISMATCH
//
// MessageText:
//
// OSS ASN.1 Error: Encode/Decode Error.
//
#define OSS_PDU_MISMATCH                 _HRESULT_TYPEDEF_(0x80093009L)

//
// MessageId: OSS_LIMITED
//
// MessageText:
//
// OSS ASN.1 Error: Internal Error.
//
#define OSS_LIMITED                      _HRESULT_TYPEDEF_(0x8009300AL)

//
// MessageId: OSS_BAD_PTR
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_BAD_PTR                      _HRESULT_TYPEDEF_(0x8009300BL)

//
// MessageId: OSS_BAD_TIME
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_BAD_TIME                     _HRESULT_TYPEDEF_(0x8009300CL)

//
// MessageId: OSS_INDEFINITE_NOT_SUPPORTED
//
// MessageText:
//
// OSS ASN.1 Error: Unsupported BER indefinite-length encoding.
//
#define OSS_INDEFINITE_NOT_SUPPORTED     _HRESULT_TYPEDEF_(0x8009300DL)

//
// MessageId: OSS_MEM_ERROR
//
// MessageText:
//
// OSS ASN.1 Error: Access violation.
//
#define OSS_MEM_ERROR                    _HRESULT_TYPEDEF_(0x8009300EL)

//
// MessageId: OSS_BAD_TABLE
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_BAD_TABLE                    _HRESULT_TYPEDEF_(0x8009300FL)

//
// MessageId: OSS_TOO_LONG
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_TOO_LONG                     _HRESULT_TYPEDEF_(0x80093010L)

//
// MessageId: OSS_CONSTRAINT_VIOLATED
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_CONSTRAINT_VIOLATED          _HRESULT_TYPEDEF_(0x80093011L)

//
// MessageId: OSS_FATAL_ERROR
//
// MessageText:
//
// OSS ASN.1 Error: Internal Error.
//
#define OSS_FATAL_ERROR                  _HRESULT_TYPEDEF_(0x80093012L)

//
// MessageId: OSS_ACCESS_SERIALIZATION_ERROR
//
// MessageText:
//
// OSS ASN.1 Error: Multi-threading conflict.
//
#define OSS_ACCESS_SERIALIZATION_ERROR   _HRESULT_TYPEDEF_(0x80093013L)

//
// MessageId: OSS_NULL_TBL
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_NULL_TBL                     _HRESULT_TYPEDEF_(0x80093014L)

//
// MessageId: OSS_NULL_FCN
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_NULL_FCN                     _HRESULT_TYPEDEF_(0x80093015L)

//
// MessageId: OSS_BAD_ENCRULES
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_BAD_ENCRULES                 _HRESULT_TYPEDEF_(0x80093016L)

//
// MessageId: OSS_UNAVAIL_ENCRULES
//
// MessageText:
//
// OSS ASN.1 Error: Encode/Decode function not implemented.
//
#define OSS_UNAVAIL_ENCRULES             _HRESULT_TYPEDEF_(0x80093017L)

//
// MessageId: OSS_CANT_OPEN_TRACE_WINDOW
//
// MessageText:
//
// OSS ASN.1 Error: Trace file error.
//
#define OSS_CANT_OPEN_TRACE_WINDOW       _HRESULT_TYPEDEF_(0x80093018L)

//
// MessageId: OSS_UNIMPLEMENTED
//
// MessageText:
//
// OSS ASN.1 Error: Function not implemented.
//
#define OSS_UNIMPLEMENTED                _HRESULT_TYPEDEF_(0x80093019L)

//
// MessageId: OSS_OID_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_OID_DLL_NOT_LINKED           _HRESULT_TYPEDEF_(0x8009301AL)

//
// MessageId: OSS_CANT_OPEN_TRACE_FILE
//
// MessageText:
//
// OSS ASN.1 Error: Trace file error.
//
#define OSS_CANT_OPEN_TRACE_FILE         _HRESULT_TYPEDEF_(0x8009301BL)

//
// MessageId: OSS_TRACE_FILE_ALREADY_OPEN
//
// MessageText:
//
// OSS ASN.1 Error: Trace file error.
//
#define OSS_TRACE_FILE_ALREADY_OPEN      _HRESULT_TYPEDEF_(0x8009301CL)

//
// MessageId: OSS_TABLE_MISMATCH
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_TABLE_MISMATCH               _HRESULT_TYPEDEF_(0x8009301DL)

//
// MessageId: OSS_TYPE_NOT_SUPPORTED
//
// MessageText:
//
// OSS ASN.1 Error: Invalid data.
//
#define OSS_TYPE_NOT_SUPPORTED           _HRESULT_TYPEDEF_(0x8009301EL)

//
// MessageId: OSS_REAL_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_REAL_DLL_NOT_LINKED          _HRESULT_TYPEDEF_(0x8009301FL)

//
// MessageId: OSS_REAL_CODE_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_REAL_CODE_NOT_LINKED         _HRESULT_TYPEDEF_(0x80093020L)

//
// MessageId: OSS_OUT_OF_RANGE
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_OUT_OF_RANGE                 _HRESULT_TYPEDEF_(0x80093021L)

//
// MessageId: OSS_COPIER_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_COPIER_DLL_NOT_LINKED        _HRESULT_TYPEDEF_(0x80093022L)

//
// MessageId: OSS_CONSTRAINT_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_CONSTRAINT_DLL_NOT_LINKED    _HRESULT_TYPEDEF_(0x80093023L)

//
// MessageId: OSS_COMPARATOR_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_COMPARATOR_DLL_NOT_LINKED    _HRESULT_TYPEDEF_(0x80093024L)

//
// MessageId: OSS_COMPARATOR_CODE_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_COMPARATOR_CODE_NOT_LINKED   _HRESULT_TYPEDEF_(0x80093025L)

//
// MessageId: OSS_MEM_MGR_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_MEM_MGR_DLL_NOT_LINKED       _HRESULT_TYPEDEF_(0x80093026L)

//
// MessageId: OSS_PDV_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_PDV_DLL_NOT_LINKED           _HRESULT_TYPEDEF_(0x80093027L)

//
// MessageId: OSS_PDV_CODE_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_PDV_CODE_NOT_LINKED          _HRESULT_TYPEDEF_(0x80093028L)

//
// MessageId: OSS_API_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_API_DLL_NOT_LINKED           _HRESULT_TYPEDEF_(0x80093029L)

//
// MessageId: OSS_BERDER_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_BERDER_DLL_NOT_LINKED        _HRESULT_TYPEDEF_(0x8009302AL)

//
// MessageId: OSS_PER_DLL_NOT_LINKED
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_PER_DLL_NOT_LINKED           _HRESULT_TYPEDEF_(0x8009302BL)

//
// MessageId: OSS_OPEN_TYPE_ERROR
//
// MessageText:
//
// OSS ASN.1 Error: Program link error.
//
#define OSS_OPEN_TYPE_ERROR              _HRESULT_TYPEDEF_(0x8009302CL)

//
// MessageId: OSS_MUTEX_NOT_CREATED
//
// MessageText:
//
// OSS ASN.1 Error: System resource error.
//
#define OSS_MUTEX_NOT_CREATED            _HRESULT_TYPEDEF_(0x8009302DL)

//
// MessageId: OSS_CANT_CLOSE_TRACE_FILE
//
// MessageText:
//
// OSS ASN.1 Error: Trace file error.
//
#define OSS_CANT_CLOSE_TRACE_FILE        _HRESULT_TYPEDEF_(0x8009302EL)

//
// MessageId: CRYPT_E_ASN1_ERROR
//
// MessageText:
//
// ASN1 Certificate encode/decode error code base.
// 
// The ASN1 error values are offset by CRYPT_E_ASN1_ERROR.
//
#define CRYPT_E_ASN1_ERROR               _HRESULT_TYPEDEF_(0x80093100L)

//
// MessageId: CRYPT_E_ASN1_INTERNAL
//
// MessageText:
//
// ASN1 internal encode or decode error.
//
#define CRYPT_E_ASN1_INTERNAL            _HRESULT_TYPEDEF_(0x80093101L)

//
// MessageId: CRYPT_E_ASN1_EOD
//
// MessageText:
//
// ASN1 unexpected end of data.
//
#define CRYPT_E_ASN1_EOD                 _HRESULT_TYPEDEF_(0x80093102L)

//
// MessageId: CRYPT_E_ASN1_CORRUPT
//
// MessageText:
//
// ASN1 corrupted data.
//
#define CRYPT_E_ASN1_CORRUPT             _HRESULT_TYPEDEF_(0x80093103L)

//
// MessageId: CRYPT_E_ASN1_LARGE
//
// MessageText:
//
// ASN1 value too large.
//
#define CRYPT_E_ASN1_LARGE               _HRESULT_TYPEDEF_(0x80093104L)

//
// MessageId: CRYPT_E_ASN1_CONSTRAINT
//
// MessageText:
//
// ASN1 constraint violated.
//
#define CRYPT_E_ASN1_CONSTRAINT          _HRESULT_TYPEDEF_(0x80093105L)

//
// MessageId: CRYPT_E_ASN1_MEMORY
//
// MessageText:
//
// ASN1 out of memory.
//
#define CRYPT_E_ASN1_MEMORY              _HRESULT_TYPEDEF_(0x80093106L)

//
// MessageId: CRYPT_E_ASN1_OVERFLOW
//
// MessageText:
//
// ASN1 buffer overflow.
//
#define CRYPT_E_ASN1_OVERFLOW            _HRESULT_TYPEDEF_(0x80093107L)

//
// MessageId: CRYPT_E_ASN1_BADPDU
//
// MessageText:
//
// ASN1 function not supported for this PDU.
//
#define CRYPT_E_ASN1_BADPDU              _HRESULT_TYPEDEF_(0x80093108L)

//
// MessageId: CRYPT_E_ASN1_BADARGS
//
// MessageText:
//
// ASN1 bad arguments to function call.
//
#define CRYPT_E_ASN1_BADARGS             _HRESULT_TYPEDEF_(0x80093109L)

//
// MessageId: CRYPT_E_ASN1_BADREAL
//
// MessageText:
//
// ASN1 bad real value.
//
#define CRYPT_E_ASN1_BADREAL             _HRESULT_TYPEDEF_(0x8009310AL)

//
// MessageId: CRYPT_E_ASN1_BADTAG
//
// MessageText:
//
// ASN1 bad tag value met.
//
#define CRYPT_E_ASN1_BADTAG              _HRESULT_TYPEDEF_(0x8009310BL)

//
// MessageId: CRYPT_E_ASN1_CHOICE
//
// MessageText:
//
// ASN1 bad choice value.
//
#define CRYPT_E_ASN1_CHOICE              _HRESULT_TYPEDEF_(0x8009310CL)

//
// MessageId: CRYPT_E_ASN1_RULE
//
// MessageText:
//
// ASN1 bad encoding rule.
//
#define CRYPT_E_ASN1_RULE                _HRESULT_TYPEDEF_(0x8009310DL)

//
// MessageId: CRYPT_E_ASN1_UTF8
//
// MessageText:
//
// ASN1 bad unicode (UTF8).
//
#define CRYPT_E_ASN1_UTF8                _HRESULT_TYPEDEF_(0x8009310EL)

//
// MessageId: CRYPT_E_ASN1_PDU_TYPE
//
// MessageText:
//
// ASN1 bad PDU type.
//
#define CRYPT_E_ASN1_PDU_TYPE            _HRESULT_TYPEDEF_(0x80093133L)

//
// MessageId: CRYPT_E_ASN1_NYI
//
// MessageText:
//
// ASN1 not yet implemented.
//
#define CRYPT_E_ASN1_NYI                 _HRESULT_TYPEDEF_(0x80093134L)

//
// MessageId: CRYPT_E_ASN1_EXTENDED
//
// MessageText:
//
// ASN1 skipped unknown extension(s).
//
#define CRYPT_E_ASN1_EXTENDED            _HRESULT_TYPEDEF_(0x80093201L)

//
// MessageId: CRYPT_E_ASN1_NOEOD
//
// MessageText:
//
// ASN1 end of data expected
//
#define CRYPT_E_ASN1_NOEOD               _HRESULT_TYPEDEF_(0x80093202L)

//
// MessageId: CERTSRV_E_BAD_REQUESTSUBJECT
//
// MessageText:
//
// The request subject name is invalid or too long.
//
#define CERTSRV_E_BAD_REQUESTSUBJECT     _HRESULT_TYPEDEF_(0x80094001L)

//
// MessageId: CERTSRV_E_NO_REQUEST
//
// MessageText:
//
// The request does not exist.
//
#define CERTSRV_E_NO_REQUEST             _HRESULT_TYPEDEF_(0x80094002L)

//
// MessageId: CERTSRV_E_BAD_REQUESTSTATUS
//
// MessageText:
//
// The request's current status does not allow this operation.
//
#define CERTSRV_E_BAD_REQUESTSTATUS      _HRESULT_TYPEDEF_(0x80094003L)

//
// MessageId: CERTSRV_E_PROPERTY_EMPTY
//
// MessageText:
//
// The requested property value is empty.
//
#define CERTSRV_E_PROPERTY_EMPTY         _HRESULT_TYPEDEF_(0x80094004L)

//
// MessageId: CERTSRV_E_INVALID_CA_CERTIFICATE
//
// MessageText:
//
// The certification authority's certificate contains invalid data.
//
#define CERTSRV_E_INVALID_CA_CERTIFICATE _HRESULT_TYPEDEF_(0x80094005L)

//
// MessageId: CERTSRV_E_SERVER_SUSPENDED
//
// MessageText:
//
// Certificate service has been suspended for a database restore operation.
//
#define CERTSRV_E_SERVER_SUSPENDED       _HRESULT_TYPEDEF_(0x80094006L)

//
// MessageId: CERTSRV_E_ENCODING_LENGTH
//
// MessageText:
//
// The certificate contains an encoded length that is potentially incompatible with older enrollment software.
//
#define CERTSRV_E_ENCODING_LENGTH        _HRESULT_TYPEDEF_(0x80094007L)

//
// MessageId: CERTSRV_E_ROLECONFLICT
//
// MessageText:
//
// The operation is denied. The user has multiple roles assigned and the certification authority is configured to enforce role separation.
//
#define CERTSRV_E_ROLECONFLICT           _HRESULT_TYPEDEF_(0x80094008L)

//
// MessageId: CERTSRV_E_RESTRICTEDOFFICER
//
// MessageText:
//
// The operation is denied. It can only be performed by a certificate manager that is allowed to manage certificates for the current requester.
//
#define CERTSRV_E_RESTRICTEDOFFICER      _HRESULT_TYPEDEF_(0x80094009L)

//
// MessageId: CERTSRV_E_KEY_ARCHIVAL_NOT_CONFIGURED
//
// MessageText:
//
// Cannot archive private key. The certification authority is not configured for key archival.
//
#define CERTSRV_E_KEY_ARCHIVAL_NOT_CONFIGURED _HRESULT_TYPEDEF_(0x8009400AL)

//
// MessageId: CERTSRV_E_NO_VALID_KRA
//
// MessageText:
//
// Cannot archive private key. The certification authority could not verify one or more key recovery certificates.
//
#define CERTSRV_E_NO_VALID_KRA           _HRESULT_TYPEDEF_(0x8009400BL)

//
// MessageId: CERTSRV_E_BAD_REQUEST_KEY_ARCHIVAL
//
// MessageText:
//
// The request is incorrectly formatted. The encrypted private key must be in an unauthenticated attribute in an outermost signature.
//
#define CERTSRV_E_BAD_REQUEST_KEY_ARCHIVAL _HRESULT_TYPEDEF_(0x8009400CL)

//
// MessageId: CERTSRV_E_NO_CAADMIN_DEFINED
//
// MessageText:
//
// At least one security principal must have the permission to manage this CA.
//
#define CERTSRV_E_NO_CAADMIN_DEFINED     _HRESULT_TYPEDEF_(0x8009400DL)

//
// MessageId: CERTSRV_E_BAD_RENEWAL_CERT_ATTRIBUTE
//
// MessageText:
//
// The request contains an invalid renewal certificate attribute.
//
#define CERTSRV_E_BAD_RENEWAL_CERT_ATTRIBUTE _HRESULT_TYPEDEF_(0x8009400EL)

//
// MessageId: CERTSRV_E_NO_DB_SESSIONS
//
// MessageText:
//
// An attempt was made to open a Certification Authority database session, but there are already too many active sessions. The server may need to be configured to allow additional sessions.
//
#define CERTSRV_E_NO_DB_SESSIONS         _HRESULT_TYPEDEF_(0x8009400FL)

//
// MessageId: CERTSRV_E_ALIGNMENT_FAULT
//
// MessageText:
//
// A memory reference caused a data alignment fault.
//
#define CERTSRV_E_ALIGNMENT_FAULT        _HRESULT_TYPEDEF_(0x80094010L)

//
// MessageId: CERTSRV_E_ENROLL_DENIED
//
// MessageText:
//
// The permissions on this certification authority do not allow the current user to enroll for certificates.
//
#define CERTSRV_E_ENROLL_DENIED          _HRESULT_TYPEDEF_(0x80094011L)

//
// MessageId: CERTSRV_E_TEMPLATE_DENIED
//
// MessageText:
//
// The permissions on the certificate template do not allow the current user to enroll for this type of certificate.
//
#define CERTSRV_E_TEMPLATE_DENIED        _HRESULT_TYPEDEF_(0x80094012L)

//
// MessageId: CERTSRV_E_DOWNLEVEL_DC_SSL_OR_UPGRADE
//
// MessageText:
//
// The contacted domain controller cannot support signed LDAP traffic. Update the domain controller or configure Certificate Services to use SSL for Active Directory access.
//
#define CERTSRV_E_DOWNLEVEL_DC_SSL_OR_UPGRADE _HRESULT_TYPEDEF_(0x80094013L)

//
// MessageId: CERTSRV_E_UNSUPPORTED_CERT_TYPE
//
// MessageText:
//
// The requested certificate template is not supported by this CA.
//
#define CERTSRV_E_UNSUPPORTED_CERT_TYPE  _HRESULT_TYPEDEF_(0x80094800L)

//
// MessageId: CERTSRV_E_NO_CERT_TYPE
//
// MessageText:
//
// The request contains no certificate template information.
//
#define CERTSRV_E_NO_CERT_TYPE           _HRESULT_TYPEDEF_(0x80094801L)

//
// MessageId: CERTSRV_E_TEMPLATE_CONFLICT
//
// MessageText:
//
// The request contains conflicting template information.
//
#define CERTSRV_E_TEMPLATE_CONFLICT      _HRESULT_TYPEDEF_(0x80094802L)

//
// MessageId: CERTSRV_E_SUBJECT_ALT_NAME_REQUIRED
//
// MessageText:
//
// The request is missing a required Subject Alternate name extension.
//
#define CERTSRV_E_SUBJECT_ALT_NAME_REQUIRED _HRESULT_TYPEDEF_(0x80094803L)

//
// MessageId: CERTSRV_E_ARCHIVED_KEY_REQUIRED
//
// MessageText:
//
// The request is missing a required private key for archival by the server.
//
#define CERTSRV_E_ARCHIVED_KEY_REQUIRED  _HRESULT_TYPEDEF_(0x80094804L)

//
// MessageId: CERTSRV_E_SMIME_REQUIRED
//
// MessageText:
//
// The request is missing a required SMIME capabilities extension.
//
#define CERTSRV_E_SMIME_REQUIRED         _HRESULT_TYPEDEF_(0x80094805L)

//
// MessageId: CERTSRV_E_BAD_RENEWAL_SUBJECT
//
// MessageText:
//
// The request was made on behalf of a subject other than the caller. The certificate template must be configured to require at least one signature to authorize the request.
//
#define CERTSRV_E_BAD_RENEWAL_SUBJECT    _HRESULT_TYPEDEF_(0x80094806L)

//
// MessageId: CERTSRV_E_BAD_TEMPLATE_VERSION
//
// MessageText:
//
// The request template version is newer than the supported template version.
//
#define CERTSRV_E_BAD_TEMPLATE_VERSION   _HRESULT_TYPEDEF_(0x80094807L)

//
// MessageId: CERTSRV_E_TEMPLATE_POLICY_REQUIRED
//
// MessageText:
//
// The template is missing a required signature policy attribute.
//
#define CERTSRV_E_TEMPLATE_POLICY_REQUIRED _HRESULT_TYPEDEF_(0x80094808L)

//
// MessageId: CERTSRV_E_SIGNATURE_POLICY_REQUIRED
//
// MessageText:
//
// The request is missing required signature policy information.
//
#define CERTSRV_E_SIGNATURE_POLICY_REQUIRED _HRESULT_TYPEDEF_(0x80094809L)

//
// MessageId: CERTSRV_E_SIGNATURE_COUNT
//
// MessageText:
//
// The request is missing one or more required signatures.
//
#define CERTSRV_E_SIGNATURE_COUNT        _HRESULT_TYPEDEF_(0x8009480AL)

//
// MessageId: CERTSRV_E_SIGNATURE_REJECTED
//
// MessageText:
//
// One or more signatures did not include the required application or issuance policies. The request is missing one or more required valid signatures.
//
#define CERTSRV_E_SIGNATURE_REJECTED     _HRESULT_TYPEDEF_(0x8009480BL)

//
// MessageId: CERTSRV_E_ISSUANCE_POLICY_REQUIRED
//
// MessageText:
//
// The request is missing one or more required signature issuance policies.
//
#define CERTSRV_E_ISSUANCE_POLICY_REQUIRED _HRESULT_TYPEDEF_(0x8009480CL)

//
// MessageId: CERTSRV_E_SUBJECT_UPN_REQUIRED
//
// MessageText:
//
// The UPN is unavailable and cannot be added to the Subject Alternate name.
//
#define CERTSRV_E_SUBJECT_UPN_REQUIRED   _HRESULT_TYPEDEF_(0x8009480DL)

//
// MessageId: CERTSRV_E_SUBJECT_DIRECTORY_GUID_REQUIRED
//
// MessageText:
//
// The Active Directory GUID is unavailable and cannot be added to the Subject Alternate name.
//
#define CERTSRV_E_SUBJECT_DIRECTORY_GUID_REQUIRED _HRESULT_TYPEDEF_(0x8009480EL)

//
// MessageId: CERTSRV_E_SUBJECT_DNS_REQUIRED
//
// MessageText:
//
// The DNS name is unavailable and cannot be added to the Subject Alternate name.
//
#define CERTSRV_E_SUBJECT_DNS_REQUIRED   _HRESULT_TYPEDEF_(0x8009480FL)

//
// MessageId: CERTSRV_E_ARCHIVED_KEY_UNEXPECTED
//
// MessageText:
//
// The request includes a private key for archival by the server, but key archival is not enabled for the specified certificate template.
//
#define CERTSRV_E_ARCHIVED_KEY_UNEXPECTED _HRESULT_TYPEDEF_(0x80094810L)

//
// MessageId: CERTSRV_E_KEY_LENGTH
//
// MessageText:
//
// The public key does not meet the minimum size required by the specified certificate template.
//
#define CERTSRV_E_KEY_LENGTH             _HRESULT_TYPEDEF_(0x80094811L)

//
// MessageId: CERTSRV_E_SUBJECT_EMAIL_REQUIRED
//
// MessageText:
//
// The EMail name is unavailable and cannot be added to the Subject or Subject Alternate name.
//
#define CERTSRV_E_SUBJECT_EMAIL_REQUIRED _HRESULT_TYPEDEF_(0x80094812L)

//
// MessageId: CERTSRV_E_UNKNOWN_CERT_TYPE
//
// MessageText:
//
// One or more certificate templates to be enabled on this certification authority could not be found.
//
#define CERTSRV_E_UNKNOWN_CERT_TYPE      _HRESULT_TYPEDEF_(0x80094813L)

//
// MessageId: CERTSRV_E_CERT_TYPE_OVERLAP
//
// MessageText:
//
// The certificate template renewal period is longer than the certificate validity period. The template should be reconfigured or the CA certificate renewed.
//
#define CERTSRV_E_CERT_TYPE_OVERLAP      _HRESULT_TYPEDEF_(0x80094814L)

//
// MessageId: CERTSRV_E_TOO_MANY_SIGNATURES
//
// MessageText:
//
// The certificate template requires too many RA signatures. Only one RA signature is allowed.
//
#define CERTSRV_E_TOO_MANY_SIGNATURES    _HRESULT_TYPEDEF_(0x80094815L)

//
// The range 0x5000-0x51ff is reserved for XENROLL errors.
//
//
// MessageId: XENROLL_E_KEY_NOT_EXPORTABLE
//
// MessageText:
//
// The key is not exportable.
//
#define XENROLL_E_KEY_NOT_EXPORTABLE     _HRESULT_TYPEDEF_(0x80095000L)

//
// MessageId: XENROLL_E_CANNOT_ADD_ROOT_CERT
//
// MessageText:
//
// You cannot add the root CA certificate into your local store.
//
#define XENROLL_E_CANNOT_ADD_ROOT_CERT   _HRESULT_TYPEDEF_(0x80095001L)

//
// MessageId: XENROLL_E_RESPONSE_KA_HASH_NOT_FOUND
//
// MessageText:
//
// The key archival hash attribute was not found in the response.
//
#define XENROLL_E_RESPONSE_KA_HASH_NOT_FOUND _HRESULT_TYPEDEF_(0x80095002L)

//
// MessageId: XENROLL_E_RESPONSE_UNEXPECTED_KA_HASH
//
// MessageText:
//
// An unexpected key archival hash attribute was found in the response.
//
#define XENROLL_E_RESPONSE_UNEXPECTED_KA_HASH _HRESULT_TYPEDEF_(0x80095003L)

//
// MessageId: XENROLL_E_RESPONSE_KA_HASH_MISMATCH
//
// MessageText:
//
// There is a key archival hash mismatch between the request and the response.
//
#define XENROLL_E_RESPONSE_KA_HASH_MISMATCH _HRESULT_TYPEDEF_(0x80095004L)

//
// MessageId: XENROLL_E_KEYSPEC_SMIME_MISMATCH
//
// MessageText:
//
// Signing certificate cannot include SMIME extension.
//
#define XENROLL_E_KEYSPEC_SMIME_MISMATCH _HRESULT_TYPEDEF_(0x80095005L)

//
// MessageId: TRUST_E_SYSTEM_ERROR
//
// MessageText:
//
// A system-level error occurred while verifying trust.
//
#define TRUST_E_SYSTEM_ERROR             _HRESULT_TYPEDEF_(0x80096001L)

//
// MessageId: TRUST_E_NO_SIGNER_CERT
//
// MessageText:
//
// The certificate for the signer of the message is invalid or not found.
//
#define TRUST_E_NO_SIGNER_CERT           _HRESULT_TYPEDEF_(0x80096002L)

//
// MessageId: TRUST_E_COUNTER_SIGNER
//
// MessageText:
//
// One of the counter signatures was invalid.
//
#define TRUST_E_COUNTER_SIGNER           _HRESULT_TYPEDEF_(0x80096003L)

//
// MessageId: TRUST_E_CERT_SIGNATURE
//
// MessageText:
//
// The signature of the certificate cannot be verified.
//
#define TRUST_E_CERT_SIGNATURE           _HRESULT_TYPEDEF_(0x80096004L)

//
// MessageId: TRUST_E_TIME_STAMP
//
// MessageText:
//
// The timestamp signature and/or certificate could not be verified or is malformed.
//
#define TRUST_E_TIME_STAMP               _HRESULT_TYPEDEF_(0x80096005L)

//
// MessageId: TRUST_E_BAD_DIGEST
//
// MessageText:
//
// The digital signature of the object did not verify.
//
#define TRUST_E_BAD_DIGEST               _HRESULT_TYPEDEF_(0x80096010L)

//
// MessageId: TRUST_E_BASIC_CONSTRAINTS
//
// MessageText:
//
// A certificate's basic constraint extension has not been observed.
//
#define TRUST_E_BASIC_CONSTRAINTS        _HRESULT_TYPEDEF_(0x80096019L)

//
// MessageId: TRUST_E_FINANCIAL_CRITERIA
//
// MessageText:
//
// The certificate does not meet or contain the Authenticode(tm) financial extensions.
//
#define TRUST_E_FINANCIAL_CRITERIA       _HRESULT_TYPEDEF_(0x8009601EL)

//
//  Error codes for mssipotf.dll
//  Most of the error codes can only occur when an error occurs
//    during font file signing
//
//
//
// MessageId: MSSIPOTF_E_OUTOFMEMRANGE
//
// MessageText:
//
// Tried to reference a part of the file outside the proper range.
//
#define MSSIPOTF_E_OUTOFMEMRANGE         _HRESULT_TYPEDEF_(0x80097001L)

//
// MessageId: MSSIPOTF_E_CANTGETOBJECT
//
// MessageText:
//
// Could not retrieve an object from the file.
//
#define MSSIPOTF_E_CANTGETOBJECT         _HRESULT_TYPEDEF_(0x80097002L)

//
// MessageId: MSSIPOTF_E_NOHEADTABLE
//
// MessageText:
//
// Could not find the head table in the file.
//
#define MSSIPOTF_E_NOHEADTABLE           _HRESULT_TYPEDEF_(0x80097003L)

//
// MessageId: MSSIPOTF_E_BAD_MAGICNUMBER
//
// MessageText:
//
// The magic number in the head table is incorrect.
//
#define MSSIPOTF_E_BAD_MAGICNUMBER       _HRESULT_TYPEDEF_(0x80097004L)

//
// MessageId: MSSIPOTF_E_BAD_OFFSET_TABLE
//
// MessageText:
//
// The offset table has incorrect values.
//
#define MSSIPOTF_E_BAD_OFFSET_TABLE      _HRESULT_TYPEDEF_(0x80097005L)

//
// MessageId: MSSIPOTF_E_TABLE_TAGORDER
//
// MessageText:
//
// Duplicate table tags or tags out of alphabetical order.
//
#define MSSIPOTF_E_TABLE_TAGORDER        _HRESULT_TYPEDEF_(0x80097006L)

//
// MessageId: MSSIPOTF_E_TABLE_LONGWORD
//
// MessageText:
//
// A table does not start on a long word boundary.
//
#define MSSIPOTF_E_TABLE_LONGWORD        _HRESULT_TYPEDEF_(0x80097007L)

//
// MessageId: MSSIPOTF_E_BAD_FIRST_TABLE_PLACEMENT
//
// MessageText:
//
// First table does not appear after header information.
//
#define MSSIPOTF_E_BAD_FIRST_TABLE_PLACEMENT _HRESULT_TYPEDEF_(0x80097008L)

//
// MessageId: MSSIPOTF_E_TABLES_OVERLAP
//
// MessageText:
//
// Two or more tables overlap.
//
#define MSSIPOTF_E_TABLES_OVERLAP        _HRESULT_TYPEDEF_(0x80097009L)

//
// MessageId: MSSIPOTF_E_TABLE_PADBYTES
//
// MessageText:
//
// Too many pad bytes between tables or pad bytes are not 0.
//
#define MSSIPOTF_E_TABLE_PADBYTES        _HRESULT_TYPEDEF_(0x8009700AL)

//
// MessageId: MSSIPOTF_E_FILETOOSMALL
//
// MessageText:
//
// File is too small to contain the last table.
//
#define MSSIPOTF_E_FILETOOSMALL          _HRESULT_TYPEDEF_(0x8009700BL)

//
// MessageId: MSSIPOTF_E_TABLE_CHECKSUM
//
// MessageText:
//
// A table checksum is incorrect.
//
#define MSSIPOTF_E_TABLE_CHECKSUM        _HRESULT_TYPEDEF_(0x8009700CL)

//
// MessageId: MSSIPOTF_E_FILE_CHECKSUM
//
// MessageText:
//
// The file checksum is incorrect.
//
#define MSSIPOTF_E_FILE_CHECKSUM         _HRESULT_TYPEDEF_(0x8009700DL)

//
// MessageId: MSSIPOTF_E_FAILED_POLICY
//
// MessageText:
//
// The signature does not have the correct attributes for the policy.
//
#define MSSIPOTF_E_FAILED_POLICY         _HRESULT_TYPEDEF_(0x80097010L)

//
// MessageId: MSSIPOTF_E_FAILED_HINTS_CHECK
//
// MessageText:
//
// The file did not pass the hints check.
//
#define MSSIPOTF_E_FAILED_HINTS_CHECK    _HRESULT_TYPEDEF_(0x80097011L)

//
// MessageId: MSSIPOTF_E_NOT_OPENTYPE
//
// MessageText:
//
// The file is not an OpenType file.
//
#define MSSIPOTF_E_NOT_OPENTYPE          _HRESULT_TYPEDEF_(0x80097012L)

//
// MessageId: MSSIPOTF_E_FILE
//
// MessageText:
//
// Failed on a file operation (open, map, read, write).
//
#define MSSIPOTF_E_FILE                  _HRESULT_TYPEDEF_(0x80097013L)

//
// MessageId: MSSIPOTF_E_CRYPT
//
// MessageText:
//
// A call to a CryptoAPI function failed.
//
#define MSSIPOTF_E_CRYPT                 _HRESULT_TYPEDEF_(0x80097014L)

//
// MessageId: MSSIPOTF_E_BADVERSION
//
// MessageText:
//
// There is a bad version number in the file.
//
#define MSSIPOTF_E_BADVERSION            _HRESULT_TYPEDEF_(0x80097015L)

//
// MessageId: MSSIPOTF_E_DSIG_STRUCTURE
//
// MessageText:
//
// The structure of the DSIG table is incorrect.
//
#define MSSIPOTF_E_DSIG_STRUCTURE        _HRESULT_TYPEDEF_(0x80097016L)

//
// MessageId: MSSIPOTF_E_PCONST_CHECK
//
// MessageText:
//
// A check failed in a partially constant table.
//
#define MSSIPOTF_E_PCONST_CHECK          _HRESULT_TYPEDEF_(0x80097017L)

//
// MessageId: MSSIPOTF_E_STRUCTURE
//
// MessageText:
//
// Some kind of structural error.
//
#define MSSIPOTF_E_STRUCTURE             _HRESULT_TYPEDEF_(0x80097018L)

//
// MessageId: ERROR_CRED_REQUIRES_CONFIRMATION
//
// MessageText:
//
// The requested credential requires confirmation.
//
#define ERROR_CRED_REQUIRES_CONFIRMATION _HRESULT_TYPEDEF_(0x80097019L)

#define NTE_OP_OK 0

//
// Note that additional FACILITY_SSPI errors are in issperr.h
//
// ******************
// FACILITY_CERT
// ******************
//
// MessageId: TRUST_E_PROVIDER_UNKNOWN
//
// MessageText:
//
// Unknown trust provider.
//
#define TRUST_E_PROVIDER_UNKNOWN         _HRESULT_TYPEDEF_(0x800B0001L)

//
// MessageId: TRUST_E_ACTION_UNKNOWN
//
// MessageText:
//
// The trust verification action specified is not supported by the specified trust provider.
//
#define TRUST_E_ACTION_UNKNOWN           _HRESULT_TYPEDEF_(0x800B0002L)

//
// MessageId: TRUST_E_SUBJECT_FORM_UNKNOWN
//
// MessageText:
//
// The form specified for the subject is not one supported or known by the specified trust provider.
//
#define TRUST_E_SUBJECT_FORM_UNKNOWN     _HRESULT_TYPEDEF_(0x800B0003L)

//
// MessageId: TRUST_E_SUBJECT_NOT_TRUSTED
//
// MessageText:
//
// The subject is not trusted for the specified action.
//
#define TRUST_E_SUBJECT_NOT_TRUSTED      _HRESULT_TYPEDEF_(0x800B0004L)

//
// MessageId: DIGSIG_E_ENCODE
//
// MessageText:
//
// Error due to problem in ASN.1 encoding process.
//
#define DIGSIG_E_ENCODE                  _HRESULT_TYPEDEF_(0x800B0005L)

//
// MessageId: DIGSIG_E_DECODE
//
// MessageText:
//
// Error due to problem in ASN.1 decoding process.
//
#define DIGSIG_E_DECODE                  _HRESULT_TYPEDEF_(0x800B0006L)

//
// MessageId: DIGSIG_E_EXTENSIBILITY
//
// MessageText:
//
// Reading / writing Extensions where Attributes are appropriate, and visa versa.
//
#define DIGSIG_E_EXTENSIBILITY           _HRESULT_TYPEDEF_(0x800B0007L)

//
// MessageId: DIGSIG_E_CRYPTO
//
// MessageText:
//
// Unspecified cryptographic failure.
//
#define DIGSIG_E_CRYPTO                  _HRESULT_TYPEDEF_(0x800B0008L)

//
// MessageId: PERSIST_E_SIZEDEFINITE
//
// MessageText:
//
// The size of the data could not be determined.
//
#define PERSIST_E_SIZEDEFINITE           _HRESULT_TYPEDEF_(0x800B0009L)

//
// MessageId: PERSIST_E_SIZEINDEFINITE
//
// MessageText:
//
// The size of the indefinite-sized data could not be determined.
//
#define PERSIST_E_SIZEINDEFINITE         _HRESULT_TYPEDEF_(0x800B000AL)

//
// MessageId: PERSIST_E_NOTSELFSIZING
//
// MessageText:
//
// This object does not read and write self-sizing data.
//
#define PERSIST_E_NOTSELFSIZING          _HRESULT_TYPEDEF_(0x800B000BL)

//
// MessageId: TRUST_E_NOSIGNATURE
//
// MessageText:
//
// No signature was present in the subject.
//
#define TRUST_E_NOSIGNATURE              _HRESULT_TYPEDEF_(0x800B0100L)

//
// MessageId: CERT_E_EXPIRED
//
// MessageText:
//
// A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
//
#define CERT_E_EXPIRED                   _HRESULT_TYPEDEF_(0x800B0101L)

//
// MessageId: CERT_E_VALIDITYPERIODNESTING
//
// MessageText:
//
// The validity periods of the certification chain do not nest correctly.
//
#define CERT_E_VALIDITYPERIODNESTING     _HRESULT_TYPEDEF_(0x800B0102L)

//
// MessageId: CERT_E_ROLE
//
// MessageText:
//
// A certificate that can only be used as an end-entity is being used as a CA or visa versa.
//
#define CERT_E_ROLE                      _HRESULT_TYPEDEF_(0x800B0103L)

//
// MessageId: CERT_E_PATHLENCONST
//
// MessageText:
//
// A path length constraint in the certification chain has been violated.
//
#define CERT_E_PATHLENCONST              _HRESULT_TYPEDEF_(0x800B0104L)

//
// MessageId: CERT_E_CRITICAL
//
// MessageText:
//
// A certificate contains an unknown extension that is marked 'critical'.
//
#define CERT_E_CRITICAL                  _HRESULT_TYPEDEF_(0x800B0105L)

//
// MessageId: CERT_E_PURPOSE
//
// MessageText:
//
// A certificate being used for a purpose other than the ones specified by its CA.
//
#define CERT_E_PURPOSE                   _HRESULT_TYPEDEF_(0x800B0106L)

//
// MessageId: CERT_E_ISSUERCHAINING
//
// MessageText:
//
// A parent of a given certificate in fact did not issue that child certificate.
//
#define CERT_E_ISSUERCHAINING            _HRESULT_TYPEDEF_(0x800B0107L)

//
// MessageId: CERT_E_MALFORMED
//
// MessageText:
//
// A certificate is missing or has an empty value for an important field, such as a subject or issuer name.
//
#define CERT_E_MALFORMED                 _HRESULT_TYPEDEF_(0x800B0108L)

//
// MessageId: CERT_E_UNTRUSTEDROOT
//
// MessageText:
//
// A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
//
#define CERT_E_UNTRUSTEDROOT             _HRESULT_TYPEDEF_(0x800B0109L)

//
// MessageId: CERT_E_CHAINING
//
// MessageText:
//
// A certificate chain could not be built to a trusted root authority.
//
#define CERT_E_CHAINING                  _HRESULT_TYPEDEF_(0x800B010AL)

//
// MessageId: TRUST_E_FAIL
//
// MessageText:
//
// Generic trust failure.
//
#define TRUST_E_FAIL                     _HRESULT_TYPEDEF_(0x800B010BL)

//
// MessageId: CERT_E_REVOKED
//
// MessageText:
//
// A certificate was explicitly revoked by its issuer.
//
#define CERT_E_REVOKED                   _HRESULT_TYPEDEF_(0x800B010CL)

//
// MessageId: CERT_E_UNTRUSTEDTESTROOT
//
// MessageText:
//
// The certification path terminates with the test root which is not trusted with the current policy settings.
//
#define CERT_E_UNTRUSTEDTESTROOT         _HRESULT_TYPEDEF_(0x800B010DL)

//
// MessageId: CERT_E_REVOCATION_FAILURE
//
// MessageText:
//
// The revocation process could not continue - the certificate(s) could not be checked.
//
#define CERT_E_REVOCATION_FAILURE        _HRESULT_TYPEDEF_(0x800B010EL)

//
// MessageId: CERT_E_CN_NO_MATCH
//
// MessageText:
//
// The certificate's CN name does not match the passed value.
//
#define CERT_E_CN_NO_MATCH               _HRESULT_TYPEDEF_(0x800B010FL)

//
// MessageId: CERT_E_WRONG_USAGE
//
// MessageText:
//
// The certificate is not valid for the requested usage.
//
#define CERT_E_WRONG_USAGE               _HRESULT_TYPEDEF_(0x800B0110L)

//
// MessageId: TRUST_E_EXPLICIT_DISTRUST
//
// MessageText:
//
// The certificate was explicitly marked as untrusted by the user.
//
#define TRUST_E_EXPLICIT_DISTRUST        _HRESULT_TYPEDEF_(0x800B0111L)

//
// MessageId: CERT_E_UNTRUSTEDCA
//
// MessageText:
//
// A certification chain processed correctly, but one of the CA certificates is not trusted by the policy provider.
//
#define CERT_E_UNTRUSTEDCA               _HRESULT_TYPEDEF_(0x800B0112L)

//
// MessageId: CERT_E_INVALID_POLICY
//
// MessageText:
//
// The certificate has invalid policy.
//
#define CERT_E_INVALID_POLICY            _HRESULT_TYPEDEF_(0x800B0113L)

//
// MessageId: CERT_E_INVALID_NAME
//
// MessageText:
//
// The certificate has an invalid name. The name is not included in the permitted list or is explicitly excluded.
//
#define CERT_E_INVALID_NAME              _HRESULT_TYPEDEF_(0x800B0114L)

// *****************
// FACILITY_SETUPAPI
// *****************
//
// Since these error codes aren't in the standard Win32 range (i.e., 0-64K), define a
// macro to map either Win32 or SetupAPI error codes into an HRESULT.
//
#define HRESULT_FROM_SETUPAPI(x) ((((x) & (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR)) == (APPLICATION_ERROR_MASK|ERROR_SEVERITY_ERROR)) \
                                 ? ((HRESULT) (((x) & 0x0000FFFF) | (FACILITY_SETUPAPI << 16) | 0x80000000))                               \
                                 : HRESULT_FROM_WIN32(x))
//
// MessageId: SPAPI_E_EXPECTED_SECTION_NAME
//
// MessageText:
//
// A non-empty line was encountered in the INF before the start of a section.
//
#define SPAPI_E_EXPECTED_SECTION_NAME    _HRESULT_TYPEDEF_(0x800F0000L)

//
// MessageId: SPAPI_E_BAD_SECTION_NAME_LINE
//
// MessageText:
//
// A section name marker in the INF is not complete, or does not exist on a line by itself.
//
#define SPAPI_E_BAD_SECTION_NAME_LINE    _HRESULT_TYPEDEF_(0x800F0001L)

//
// MessageId: SPAPI_E_SECTION_NAME_TOO_LONG
//
// MessageText:
//
// An INF section was encountered whose name exceeds the maximum section name length.
//
#define SPAPI_E_SECTION_NAME_TOO_LONG    _HRESULT_TYPEDEF_(0x800F0002L)

//
// MessageId: SPAPI_E_GENERAL_SYNTAX
//
// MessageText:
//
// The syntax of the INF is invalid.
//
#define SPAPI_E_GENERAL_SYNTAX           _HRESULT_TYPEDEF_(0x800F0003L)

//
// MessageId: SPAPI_E_WRONG_INF_STYLE
//
// MessageText:
//
// The style of the INF is different than what was requested.
//
#define SPAPI_E_WRONG_INF_STYLE          _HRESULT_TYPEDEF_(0x800F0100L)

//
// MessageId: SPAPI_E_SECTION_NOT_FOUND
//
// MessageText:
//
// The required section was not found in the INF.
//
#define SPAPI_E_SECTION_NOT_FOUND        _HRESULT_TYPEDEF_(0x800F0101L)

//
// MessageId: SPAPI_E_LINE_NOT_FOUND
//
// MessageText:
//
// The required line was not found in the INF.
//
#define SPAPI_E_LINE_NOT_FOUND           _HRESULT_TYPEDEF_(0x800F0102L)

//
// MessageId: SPAPI_E_NO_BACKUP
//
// MessageText:
//
// The files affected by the installation of this file queue have not been backed up for uninstall.
//
#define SPAPI_E_NO_BACKUP                _HRESULT_TYPEDEF_(0x800F0103L)

//
// MessageId: SPAPI_E_NO_ASSOCIATED_CLASS
//
// MessageText:
//
// The INF or the device information set or element does not have an associated install class.
//
#define SPAPI_E_NO_ASSOCIATED_CLASS      _HRESULT_TYPEDEF_(0x800F0200L)

//
// MessageId: SPAPI_E_CLASS_MISMATCH
//
// MessageText:
//
// The INF or the device information set or element does not match the specified install class.
//
#define SPAPI_E_CLASS_MISMATCH           _HRESULT_TYPEDEF_(0x800F0201L)

//
// MessageId: SPAPI_E_DUPLICATE_FOUND
//
// MessageText:
//
// An existing device was found that is a duplicate of the device being manually installed.
//
#define SPAPI_E_DUPLICATE_FOUND          _HRESULT_TYPEDEF_(0x800F0202L)

//
// MessageId: SPAPI_E_NO_DRIVER_SELECTED
//
// MessageText:
//
// There is no driver selected for the device information set or element.
//
#define SPAPI_E_NO_DRIVER_SELECTED       _HRESULT_TYPEDEF_(0x800F0203L)

//
// MessageId: SPAPI_E_KEY_DOES_NOT_EXIST
//
// MessageText:
//
// The requested device registry key does not exist.
//
#define SPAPI_E_KEY_DOES_NOT_EXIST       _HRESULT_TYPEDEF_(0x800F0204L)

//
// MessageId: SPAPI_E_INVALID_DEVINST_NAME
//
// MessageText:
//
// The device instance name is invalid.
//
#define SPAPI_E_INVALID_DEVINST_NAME     _HRESULT_TYPEDEF_(0x800F0205L)

//
// MessageId: SPAPI_E_INVALID_CLASS
//
// MessageText:
//
// The install class is not present or is invalid.
//
#define SPAPI_E_INVALID_CLASS            _HRESULT_TYPEDEF_(0x800F0206L)

//
// MessageId: SPAPI_E_DEVINST_ALREADY_EXISTS
//
// MessageText:
//
// The device instance cannot be created because it already exists.
//
#define SPAPI_E_DEVINST_ALREADY_EXISTS   _HRESULT_TYPEDEF_(0x800F0207L)

//
// MessageId: SPAPI_E_DEVINFO_NOT_REGISTERED
//
// MessageText:
//
// The operation cannot be performed on a device information element that has not been registered.
//
#define SPAPI_E_DEVINFO_NOT_REGISTERED   _HRESULT_TYPEDEF_(0x800F0208L)

//
// MessageId: SPAPI_E_INVALID_REG_PROPERTY
//
// MessageText:
//
// The device property code is invalid.
//
#define SPAPI_E_INVALID_REG_PROPERTY     _HRESULT_TYPEDEF_(0x800F0209L)

//
// MessageId: SPAPI_E_NO_INF
//
// MessageText:
//
// The INF from which a driver list is to be built does not exist.
//
#define SPAPI_E_NO_INF                   _HRESULT_TYPEDEF_(0x800F020AL)

//
// MessageId: SPAPI_E_NO_SUCH_DEVINST
//
// MessageText:
//
// The device instance does not exist in the hardware tree.
//
#define SPAPI_E_NO_SUCH_DEVINST          _HRESULT_TYPEDEF_(0x800F020BL)

//
// MessageId: SPAPI_E_CANT_LOAD_CLASS_ICON
//
// MessageText:
//
// The icon representing this install class cannot be loaded.
//
#define SPAPI_E_CANT_LOAD_CLASS_ICON     _HRESULT_TYPEDEF_(0x800F020CL)

//
// MessageId: SPAPI_E_INVALID_CLASS_INSTALLER
//
// MessageText:
//
// The class installer registry entry is invalid.
//
#define SPAPI_E_INVALID_CLASS_INSTALLER  _HRESULT_TYPEDEF_(0x800F020DL)

//
// MessageId: SPAPI_E_DI_DO_DEFAULT
//
// MessageText:
//
// The class installer has indicated that the default action should be performed for this installation request.
//
#define SPAPI_E_DI_DO_DEFAULT            _HRESULT_TYPEDEF_(0x800F020EL)

//
// MessageId: SPAPI_E_DI_NOFILECOPY
//
// MessageText:
//
// The operation does not require any files to be copied.
//
#define SPAPI_E_DI_NOFILECOPY            _HRESULT_TYPEDEF_(0x800F020FL)

//
// MessageId: SPAPI_E_INVALID_HWPROFILE
//
// MessageText:
//
// The specified hardware profile does not exist.
//
#define SPAPI_E_INVALID_HWPROFILE        _HRESULT_TYPEDEF_(0x800F0210L)

//
// MessageId: SPAPI_E_NO_DEVICE_SELECTED
//
// MessageText:
//
// There is no device information element currently selected for this device information set.
//
#define SPAPI_E_NO_DEVICE_SELECTED       _HRESULT_TYPEDEF_(0x800F0211L)

//
// MessageId: SPAPI_E_DEVINFO_LIST_LOCKED
//
// MessageText:
//
// The operation cannot be performed because the device information set is locked.
//
#define SPAPI_E_DEVINFO_LIST_LOCKED      _HRESULT_TYPEDEF_(0x800F0212L)

//
// MessageId: SPAPI_E_DEVINFO_DATA_LOCKED
//
// MessageText:
//
// The operation cannot be performed because the device information element is locked.
//
#define SPAPI_E_DEVINFO_DATA_LOCKED      _HRESULT_TYPEDEF_(0x800F0213L)

//
// MessageId: SPAPI_E_DI_BAD_PATH
//
// MessageText:
//
// The specified path does not contain any applicable device INFs.
//
#define SPAPI_E_DI_BAD_PATH              _HRESULT_TYPEDEF_(0x800F0214L)

//
// MessageId: SPAPI_E_NO_CLASSINSTALL_PARAMS
//
// MessageText:
//
// No class installer parameters have been set for the device information set or element.
//
#define SPAPI_E_NO_CLASSINSTALL_PARAMS   _HRESULT_TYPEDEF_(0x800F0215L)

//
// MessageId: SPAPI_E_FILEQUEUE_LOCKED
//
// MessageText:
//
// The operation cannot be performed because the file queue is locked.
//
#define SPAPI_E_FILEQUEUE_LOCKED         _HRESULT_TYPEDEF_(0x800F0216L)

//
// MessageId: SPAPI_E_BAD_SERVICE_INSTALLSECT
//
// MessageText:
//
// A service installation section in this INF is invalid.
//
#define SPAPI_E_BAD_SERVICE_INSTALLSECT  _HRESULT_TYPEDEF_(0x800F0217L)

//
// MessageId: SPAPI_E_NO_CLASS_DRIVER_LIST
//
// MessageText:
//
// There is no class driver list for the device information element.
//
#define SPAPI_E_NO_CLASS_DRIVER_LIST     _HRESULT_TYPEDEF_(0x800F0218L)

//
// MessageId: SPAPI_E_NO_ASSOCIATED_SERVICE
//
// MessageText:
//
// The installation failed because a function driver was not specified for this device instance.
//
#define SPAPI_E_NO_ASSOCIATED_SERVICE    _HRESULT_TYPEDEF_(0x800F0219L)

//
// MessageId: SPAPI_E_NO_DEFAULT_DEVICE_INTERFACE
//
// MessageText:
//
// There is presently no default device interface designated for this interface class.
//
#define SPAPI_E_NO_DEFAULT_DEVICE_INTERFACE _HRESULT_TYPEDEF_(0x800F021AL)

//
// MessageId: SPAPI_E_DEVICE_INTERFACE_ACTIVE
//
// MessageText:
//
// The operation cannot be performed because the device interface is currently active.
//
#define SPAPI_E_DEVICE_INTERFACE_ACTIVE  _HRESULT_TYPEDEF_(0x800F021BL)

//
// MessageId: SPAPI_E_DEVICE_INTERFACE_REMOVED
//
// MessageText:
//
// The operation cannot be performed because the device interface has been removed from the system.
//
#define SPAPI_E_DEVICE_INTERFACE_REMOVED _HRESULT_TYPEDEF_(0x800F021CL)

//
// MessageId: SPAPI_E_BAD_INTERFACE_INSTALLSECT
//
// MessageText:
//
// An interface installation section in this INF is invalid.
//
#define SPAPI_E_BAD_INTERFACE_INSTALLSECT _HRESULT_TYPEDEF_(0x800F021DL)

//
// MessageId: SPAPI_E_NO_SUCH_INTERFACE_CLASS
//
// MessageText:
//
// This interface class does not exist in the system.
//
#define SPAPI_E_NO_SUCH_INTERFACE_CLASS  _HRESULT_TYPEDEF_(0x800F021EL)

//
// MessageId: SPAPI_E_INVALID_REFERENCE_STRING
//
// MessageText:
//
// The reference string supplied for this interface device is invalid.
//
#define SPAPI_E_INVALID_REFERENCE_STRING _HRESULT_TYPEDEF_(0x800F021FL)

//
// MessageId: SPAPI_E_INVALID_MACHINENAME
//
// MessageText:
//
// The specified machine name does not conform to UNC naming conventions.
//
#define SPAPI_E_INVALID_MACHINENAME      _HRESULT_TYPEDEF_(0x800F0220L)

//
// MessageId: SPAPI_E_REMOTE_COMM_FAILURE
//
// MessageText:
//
// A general remote communication error occurred.
//
#define SPAPI_E_REMOTE_COMM_FAILURE      _HRESULT_TYPEDEF_(0x800F0221L)

//
// MessageId: SPAPI_E_MACHINE_UNAVAILABLE
//
// MessageText:
//
// The machine selected for remote communication is not available at this time.
//
#define SPAPI_E_MACHINE_UNAVAILABLE      _HRESULT_TYPEDEF_(0x800F0222L)

//
// MessageId: SPAPI_E_NO_CONFIGMGR_SERVICES
//
// MessageText:
//
// The Plug and Play service is not available on the remote machine.
//
#define SPAPI_E_NO_CONFIGMGR_SERVICES    _HRESULT_TYPEDEF_(0x800F0223L)

//
// MessageId: SPAPI_E_INVALID_PROPPAGE_PROVIDER
//
// MessageText:
//
// The property page provider registry entry is invalid.
//
#define SPAPI_E_INVALID_PROPPAGE_PROVIDER _HRESULT_TYPEDEF_(0x800F0224L)

//
// MessageId: SPAPI_E_NO_SUCH_DEVICE_INTERFACE
//
// MessageText:
//
// The requested device interface is not present in the system.
//
#define SPAPI_E_NO_SUCH_DEVICE_INTERFACE _HRESULT_TYPEDEF_(0x800F0225L)

//
// MessageId: SPAPI_E_DI_POSTPROCESSING_REQUIRED
//
// MessageText:
//
// The device's co-installer has additional work to perform after installation is complete.
//
#define SPAPI_E_DI_POSTPROCESSING_REQUIRED _HRESULT_TYPEDEF_(0x800F0226L)

//
// MessageId: SPAPI_E_INVALID_COINSTALLER
//
// MessageText:
//
// The device's co-installer is invalid.
//
#define SPAPI_E_INVALID_COINSTALLER      _HRESULT_TYPEDEF_(0x800F0227L)

//
// MessageId: SPAPI_E_NO_COMPAT_DRIVERS
//
// MessageText:
//
// There are no compatible drivers for this device.
//
#define SPAPI_E_NO_COMPAT_DRIVERS        _HRESULT_TYPEDEF_(0x800F0228L)

//
// MessageId: SPAPI_E_NO_DEVICE_ICON
//
// MessageText:
//
// There is no icon that represents this device or device type.
//
#define SPAPI_E_NO_DEVICE_ICON           _HRESULT_TYPEDEF_(0x800F0229L)

//
// MessageId: SPAPI_E_INVALID_INF_LOGCONFIG
//
// MessageText:
//
// A logical configuration specified in this INF is invalid.
//
#define SPAPI_E_INVALID_INF_LOGCONFIG    _HRESULT_TYPEDEF_(0x800F022AL)

//
// MessageId: SPAPI_E_DI_DONT_INSTALL
//
// MessageText:
//
// The class installer has denied the request to install or upgrade this device.
//
#define SPAPI_E_DI_DONT_INSTALL          _HRESULT_TYPEDEF_(0x800F022BL)

//
// MessageId: SPAPI_E_INVALID_FILTER_DRIVER
//
// MessageText:
//
// One of the filter drivers installed for this device is invalid.
//
#define SPAPI_E_INVALID_FILTER_DRIVER    _HRESULT_TYPEDEF_(0x800F022CL)

//
// MessageId: SPAPI_E_NON_WINDOWS_NT_DRIVER
//
// MessageText:
//
// The driver selected for this device does not support Windows Vista.
//
#define SPAPI_E_NON_WINDOWS_NT_DRIVER    _HRESULT_TYPEDEF_(0x800F022DL)

//
// MessageId: SPAPI_E_NON_WINDOWS_DRIVER
//
// MessageText:
//
// The driver selected for this device does not support Windows.
//
#define SPAPI_E_NON_WINDOWS_DRIVER       _HRESULT_TYPEDEF_(0x800F022EL)

//
// MessageId: SPAPI_E_NO_CATALOG_FOR_OEM_INF
//
// MessageText:
//
// The third-party INF does not contain digital signature information.
//
#define SPAPI_E_NO_CATALOG_FOR_OEM_INF   _HRESULT_TYPEDEF_(0x800F022FL)

//
// MessageId: SPAPI_E_DEVINSTALL_QUEUE_NONNATIVE
//
// MessageText:
//
// An invalid attempt was made to use a device installation file queue for verification of digital signatures relative to other platforms.
//
#define SPAPI_E_DEVINSTALL_QUEUE_NONNATIVE _HRESULT_TYPEDEF_(0x800F0230L)

//
// MessageId: SPAPI_E_NOT_DISABLEABLE
//
// MessageText:
//
// The device cannot be disabled.
//
#define SPAPI_E_NOT_DISABLEABLE          _HRESULT_TYPEDEF_(0x800F0231L)

//
// MessageId: SPAPI_E_CANT_REMOVE_DEVINST
//
// MessageText:
//
// The device could not be dynamically removed.
//
#define SPAPI_E_CANT_REMOVE_DEVINST      _HRESULT_TYPEDEF_(0x800F0232L)

//
// MessageId: SPAPI_E_INVALID_TARGET
//
// MessageText:
//
// Cannot copy to specified target.
//
#define SPAPI_E_INVALID_TARGET           _HRESULT_TYPEDEF_(0x800F0233L)

//
// MessageId: SPAPI_E_DRIVER_NONNATIVE
//
// MessageText:
//
// Driver is not intended for this platform.
//
#define SPAPI_E_DRIVER_NONNATIVE         _HRESULT_TYPEDEF_(0x800F0234L)

//
// MessageId: SPAPI_E_IN_WOW64
//
// MessageText:
//
// Operation not allowed in WOW64.
//
#define SPAPI_E_IN_WOW64                 _HRESULT_TYPEDEF_(0x800F0235L)

//
// MessageId: SPAPI_E_SET_SYSTEM_RESTORE_POINT
//
// MessageText:
//
// The operation involving unsigned file copying was rolled back, so that a system restore point could be set.
//
#define SPAPI_E_SET_SYSTEM_RESTORE_POINT _HRESULT_TYPEDEF_(0x800F0236L)

//
// MessageId: SPAPI_E_INCORRECTLY_COPIED_INF
//
// MessageText:
//
// An INF was copied into the Windows INF directory in an improper manner.
//
#define SPAPI_E_INCORRECTLY_COPIED_INF   _HRESULT_TYPEDEF_(0x800F0237L)

//
// MessageId: SPAPI_E_SCE_DISABLED
//
// MessageText:
//
// The Security Configuration Editor (SCE) APIs have been disabled on this Embedded product.
//
#define SPAPI_E_SCE_DISABLED             _HRESULT_TYPEDEF_(0x800F0238L)

//
// MessageId: SPAPI_E_UNKNOWN_EXCEPTION
//
// MessageText:
//
// An unknown exception was encountered.
//
#define SPAPI_E_UNKNOWN_EXCEPTION        _HRESULT_TYPEDEF_(0x800F0239L)

//
// MessageId: SPAPI_E_PNP_REGISTRY_ERROR
//
// MessageText:
//
// A problem was encountered when accessing the Plug and Play registry database.
//
#define SPAPI_E_PNP_REGISTRY_ERROR       _HRESULT_TYPEDEF_(0x800F023AL)

//
// MessageId: SPAPI_E_REMOTE_REQUEST_UNSUPPORTED
//
// MessageText:
//
// The requested operation is not supported for a remote machine.
//
#define SPAPI_E_REMOTE_REQUEST_UNSUPPORTED _HRESULT_TYPEDEF_(0x800F023BL)

//
// MessageId: SPAPI_E_NOT_AN_INSTALLED_OEM_INF
//
// MessageText:
//
// The specified file is not an installed OEM INF.
//
#define SPAPI_E_NOT_AN_INSTALLED_OEM_INF _HRESULT_TYPEDEF_(0x800F023CL)

//
// MessageId: SPAPI_E_INF_IN_USE_BY_DEVICES
//
// MessageText:
//
// One or more devices are presently installed using the specified INF.
//
#define SPAPI_E_INF_IN_USE_BY_DEVICES    _HRESULT_TYPEDEF_(0x800F023DL)

//
// MessageId: SPAPI_E_DI_FUNCTION_OBSOLETE
//
// MessageText:
//
// The requested device install operation is obsolete.
//
#define SPAPI_E_DI_FUNCTION_OBSOLETE     _HRESULT_TYPEDEF_(0x800F023EL)

//
// MessageId: SPAPI_E_NO_AUTHENTICODE_CATALOG
//
// MessageText:
//
// A file could not be verified because it does not have an associated catalog signed via Authenticode(tm).
//
#define SPAPI_E_NO_AUTHENTICODE_CATALOG  _HRESULT_TYPEDEF_(0x800F023FL)

//
// MessageId: SPAPI_E_AUTHENTICODE_DISALLOWED
//
// MessageText:
//
// Authenticode(tm) signature verification is not supported for the specified INF.
//
#define SPAPI_E_AUTHENTICODE_DISALLOWED  _HRESULT_TYPEDEF_(0x800F0240L)

//
// MessageId: SPAPI_E_AUTHENTICODE_TRUSTED_PUBLISHER
//
// MessageText:
//
// The INF was signed with an Authenticode(tm) catalog from a trusted publisher.
//
#define SPAPI_E_AUTHENTICODE_TRUSTED_PUBLISHER _HRESULT_TYPEDEF_(0x800F0241L)

//
// MessageId: SPAPI_E_AUTHENTICODE_TRUST_NOT_ESTABLISHED
//
// MessageText:
//
// The publisher of an Authenticode(tm) signed catalog has not yet been established as trusted.
//
#define SPAPI_E_AUTHENTICODE_TRUST_NOT_ESTABLISHED _HRESULT_TYPEDEF_(0x800F0242L)

//
// MessageId: SPAPI_E_AUTHENTICODE_PUBLISHER_NOT_TRUSTED
//
// MessageText:
//
// The publisher of an Authenticode(tm) signed catalog was not established as trusted.
//
#define SPAPI_E_AUTHENTICODE_PUBLISHER_NOT_TRUSTED _HRESULT_TYPEDEF_(0x800F0243L)

//
// MessageId: SPAPI_E_SIGNATURE_OSATTRIBUTE_MISMATCH
//
// MessageText:
//
// The software was tested for compliance with Windows Logo requirements on a different version of Windows, and may not be compatible with this version.
//
#define SPAPI_E_SIGNATURE_OSATTRIBUTE_MISMATCH _HRESULT_TYPEDEF_(0x800F0244L)

//
// MessageId: SPAPI_E_ONLY_VALIDATE_VIA_AUTHENTICODE
//
// MessageText:
//
// The file may only be validated by a catalog signed via Authenticode(tm).
//
#define SPAPI_E_ONLY_VALIDATE_VIA_AUTHENTICODE _HRESULT_TYPEDEF_(0x800F0245L)

//
// MessageId: SPAPI_E_DEVICE_INSTALLER_NOT_READY
//
// MessageText:
//
// One of the installers for this device cannot perform the installation at this time.
//
#define SPAPI_E_DEVICE_INSTALLER_NOT_READY _HRESULT_TYPEDEF_(0x800F0246L)

//
// MessageId: SPAPI_E_DRIVER_STORE_ADD_FAILED
//
// MessageText:
//
// A problem was encountered while attempting to add the driver to the store.
//
#define SPAPI_E_DRIVER_STORE_ADD_FAILED  _HRESULT_TYPEDEF_(0x800F0247L)

//
// MessageId: SPAPI_E_DEVICE_INSTALL_BLOCKED
//
// MessageText:
//
// The installation of this device is forbidden by system policy. Contact your system administrator.
//
#define SPAPI_E_DEVICE_INSTALL_BLOCKED   _HRESULT_TYPEDEF_(0x800F0248L)

//
// MessageId: SPAPI_E_DRIVER_INSTALL_BLOCKED
//
// MessageText:
//
// The installation of this driver is forbidden by system policy. Contact your system administrator.
//
#define SPAPI_E_DRIVER_INSTALL_BLOCKED   _HRESULT_TYPEDEF_(0x800F0249L)

//
// MessageId: SPAPI_E_WRONG_INF_TYPE
//
// MessageText:
//
// The specified INF is the wrong type for this operation.
//
#define SPAPI_E_WRONG_INF_TYPE           _HRESULT_TYPEDEF_(0x800F024AL)

//
// MessageId: SPAPI_E_FILE_HASH_NOT_IN_CATALOG
//
// MessageText:
//
// The hash for the file is not present in the specified catalog file. The file is likely corrupt or the victim of tampering.
//
#define SPAPI_E_FILE_HASH_NOT_IN_CATALOG _HRESULT_TYPEDEF_(0x800F024BL)

//
// MessageId: SPAPI_E_DRIVER_STORE_DELETE_FAILED
//
// MessageText:
//
// A problem was encountered while attempting to delete the driver from the store.
//
#define SPAPI_E_DRIVER_STORE_DELETE_FAILED _HRESULT_TYPEDEF_(0x800F024CL)

//
// MessageId: SPAPI_E_UNRECOVERABLE_STACK_OVERFLOW
//
// MessageText:
//
// An unrecoverable stack overflow was encountered.
//
#define SPAPI_E_UNRECOVERABLE_STACK_OVERFLOW _HRESULT_TYPEDEF_(0x800F0300L)

//
// MessageId: SPAPI_E_ERROR_NOT_INSTALLED
//
// MessageText:
//
// No installed components were detected.
//
#define SPAPI_E_ERROR_NOT_INSTALLED      _HRESULT_TYPEDEF_(0x800F1000L)

// *****************
// FACILITY_SCARD
// *****************
//
// =============================
// Facility SCARD Error Messages
// =============================
//
#define SCARD_S_SUCCESS NO_ERROR
//
// MessageId: SCARD_F_INTERNAL_ERROR
//
// MessageText:
//
// An internal consistency check failed.
//
#define SCARD_F_INTERNAL_ERROR           _HRESULT_TYPEDEF_(0x80100001L)

//
// MessageId: SCARD_E_CANCELLED
//
// MessageText:
//
// The action was cancelled by an SCardCancel request.
//
#define SCARD_E_CANCELLED                _HRESULT_TYPEDEF_(0x80100002L)

//
// MessageId: SCARD_E_INVALID_HANDLE
//
// MessageText:
//
// The supplied handle was invalid.
//
#define SCARD_E_INVALID_HANDLE           _HRESULT_TYPEDEF_(0x80100003L)

//
// MessageId: SCARD_E_INVALID_PARAMETER
//
// MessageText:
//
// One or more of the supplied parameters could not be properly interpreted.
//
#define SCARD_E_INVALID_PARAMETER        _HRESULT_TYPEDEF_(0x80100004L)

//
// MessageId: SCARD_E_INVALID_TARGET
//
// MessageText:
//
// Registry startup information is missing or invalid.
//
#define SCARD_E_INVALID_TARGET           _HRESULT_TYPEDEF_(0x80100005L)

//
// MessageId: SCARD_E_NO_MEMORY
//
// MessageText:
//
// Not enough memory available to complete this command.
//
#define SCARD_E_NO_MEMORY                _HRESULT_TYPEDEF_(0x80100006L)

//
// MessageId: SCARD_F_WAITED_TOO_LONG
//
// MessageText:
//
// An internal consistency timer has expired.
//
#define SCARD_F_WAITED_TOO_LONG          _HRESULT_TYPEDEF_(0x80100007L)

//
// MessageId: SCARD_E_INSUFFICIENT_BUFFER
//
// MessageText:
//
// The data buffer to receive returned data is too small for the returned data.
//
#define SCARD_E_INSUFFICIENT_BUFFER      _HRESULT_TYPEDEF_(0x80100008L)

//
// MessageId: SCARD_E_UNKNOWN_READER
//
// MessageText:
//
// The specified reader name is not recognized.
//
#define SCARD_E_UNKNOWN_READER           _HRESULT_TYPEDEF_(0x80100009L)

//
// MessageId: SCARD_E_TIMEOUT
//
// MessageText:
//
// The user-specified timeout value has expired.
//
#define SCARD_E_TIMEOUT                  _HRESULT_TYPEDEF_(0x8010000AL)

//
// MessageId: SCARD_E_SHARING_VIOLATION
//
// MessageText:
//
// The smart card cannot be accessed because of other connections outstanding.
//
#define SCARD_E_SHARING_VIOLATION        _HRESULT_TYPEDEF_(0x8010000BL)

//
// MessageId: SCARD_E_NO_SMARTCARD
//
// MessageText:
//
// The operation requires a Smart Card, but no Smart Card is currently in the device.
//
#define SCARD_E_NO_SMARTCARD             _HRESULT_TYPEDEF_(0x8010000CL)

//
// MessageId: SCARD_E_UNKNOWN_CARD
//
// MessageText:
//
// The specified smart card name is not recognized.
//
#define SCARD_E_UNKNOWN_CARD             _HRESULT_TYPEDEF_(0x8010000DL)

//
// MessageId: SCARD_E_CANT_DISPOSE
//
// MessageText:
//
// The system could not dispose of the media in the requested manner.
//
#define SCARD_E_CANT_DISPOSE             _HRESULT_TYPEDEF_(0x8010000EL)

//
// MessageId: SCARD_E_PROTO_MISMATCH
//
// MessageText:
//
// The requested protocols are incompatible with the protocol currently in use with the smart card.
//
#define SCARD_E_PROTO_MISMATCH           _HRESULT_TYPEDEF_(0x8010000FL)

//
// MessageId: SCARD_E_NOT_READY
//
// MessageText:
//
// The reader or smart card is not ready to accept commands.
//
#define SCARD_E_NOT_READY                _HRESULT_TYPEDEF_(0x80100010L)

//
// MessageId: SCARD_E_INVALID_VALUE
//
// MessageText:
//
// One or more of the supplied parameters values could not be properly interpreted.
//
#define SCARD_E_INVALID_VALUE            _HRESULT_TYPEDEF_(0x80100011L)

//
// MessageId: SCARD_E_SYSTEM_CANCELLED
//
// MessageText:
//
// The action was cancelled by the system, presumably to log off or shut down.
//
#define SCARD_E_SYSTEM_CANCELLED         _HRESULT_TYPEDEF_(0x80100012L)

//
// MessageId: SCARD_F_COMM_ERROR
//
// MessageText:
//
// An internal communications error has been detected.
//
#define SCARD_F_COMM_ERROR               _HRESULT_TYPEDEF_(0x80100013L)

//
// MessageId: SCARD_F_UNKNOWN_ERROR
//
// MessageText:
//
// An internal error has been detected, but the source is unknown.
//
#define SCARD_F_UNKNOWN_ERROR            _HRESULT_TYPEDEF_(0x80100014L)

//
// MessageId: SCARD_E_INVALID_ATR
//
// MessageText:
//
// An ATR obtained from the registry is not a valid ATR string.
//
#define SCARD_E_INVALID_ATR              _HRESULT_TYPEDEF_(0x80100015L)

//
// MessageId: SCARD_E_NOT_TRANSACTED
//
// MessageText:
//
// An attempt was made to end a non-existent transaction.
//
#define SCARD_E_NOT_TRANSACTED           _HRESULT_TYPEDEF_(0x80100016L)

//
// MessageId: SCARD_E_READER_UNAVAILABLE
//
// MessageText:
//
// The specified reader is not currently available for use.
//
#define SCARD_E_READER_UNAVAILABLE       _HRESULT_TYPEDEF_(0x80100017L)

//
// MessageId: SCARD_P_SHUTDOWN
//
// MessageText:
//
// The operation has been aborted to allow the server application to exit.
//
#define SCARD_P_SHUTDOWN                 _HRESULT_TYPEDEF_(0x80100018L)

//
// MessageId: SCARD_E_PCI_TOO_SMALL
//
// MessageText:
//
// The PCI Receive buffer was too small.
//
#define SCARD_E_PCI_TOO_SMALL            _HRESULT_TYPEDEF_(0x80100019L)

//
// MessageId: SCARD_E_READER_UNSUPPORTED
//
// MessageText:
//
// The reader driver does not meet minimal requirements for support.
//
#define SCARD_E_READER_UNSUPPORTED       _HRESULT_TYPEDEF_(0x8010001AL)

//
// MessageId: SCARD_E_DUPLICATE_READER
//
// MessageText:
//
// The reader driver did not produce a unique reader name.
//
#define SCARD_E_DUPLICATE_READER         _HRESULT_TYPEDEF_(0x8010001BL)

//
// MessageId: SCARD_E_CARD_UNSUPPORTED
//
// MessageText:
//
// The smart card does not meet minimal requirements for support.
//
#define SCARD_E_CARD_UNSUPPORTED         _HRESULT_TYPEDEF_(0x8010001CL)

//
// MessageId: SCARD_E_NO_SERVICE
//
// MessageText:
//
// The Smart card resource manager is not running.
//
#define SCARD_E_NO_SERVICE               _HRESULT_TYPEDEF_(0x8010001DL)

//
// MessageId: SCARD_E_SERVICE_STOPPED
//
// MessageText:
//
// The Smart card resource manager has shut down.
//
#define SCARD_E_SERVICE_STOPPED          _HRESULT_TYPEDEF_(0x8010001EL)

//
// MessageId: SCARD_E_UNEXPECTED
//
// MessageText:
//
// An unexpected card error has occurred.
//
#define SCARD_E_UNEXPECTED               _HRESULT_TYPEDEF_(0x8010001FL)

//
// MessageId: SCARD_E_ICC_INSTALLATION
//
// MessageText:
//
// No Primary Provider can be found for the smart card.
//
#define SCARD_E_ICC_INSTALLATION         _HRESULT_TYPEDEF_(0x80100020L)

//
// MessageId: SCARD_E_ICC_CREATEORDER
//
// MessageText:
//
// The requested order of object creation is not supported.
//
#define SCARD_E_ICC_CREATEORDER          _HRESULT_TYPEDEF_(0x80100021L)

//
// MessageId: SCARD_E_UNSUPPORTED_FEATURE
//
// MessageText:
//
// This smart card does not support the requested feature.
//
#define SCARD_E_UNSUPPORTED_FEATURE      _HRESULT_TYPEDEF_(0x80100022L)

//
// MessageId: SCARD_E_DIR_NOT_FOUND
//
// MessageText:
//
// The identified directory does not exist in the smart card.
//
#define SCARD_E_DIR_NOT_FOUND            _HRESULT_TYPEDEF_(0x80100023L)

//
// MessageId: SCARD_E_FILE_NOT_FOUND
//
// MessageText:
//
// The identified file does not exist in the smart card.
//
#define SCARD_E_FILE_NOT_FOUND           _HRESULT_TYPEDEF_(0x80100024L)

//
// MessageId: SCARD_E_NO_DIR
//
// MessageText:
//
// The supplied path does not represent a smart card directory.
//
#define SCARD_E_NO_DIR                   _HRESULT_TYPEDEF_(0x80100025L)

//
// MessageId: SCARD_E_NO_FILE
//
// MessageText:
//
// The supplied path does not represent a smart card file.
//
#define SCARD_E_NO_FILE                  _HRESULT_TYPEDEF_(0x80100026L)

//
// MessageId: SCARD_E_NO_ACCESS
//
// MessageText:
//
// Access is denied to this file.
//
#define SCARD_E_NO_ACCESS                _HRESULT_TYPEDEF_(0x80100027L)

//
// MessageId: SCARD_E_WRITE_TOO_MANY
//
// MessageText:
//
// The smartcard does not have enough memory to store the information.
//
#define SCARD_E_WRITE_TOO_MANY           _HRESULT_TYPEDEF_(0x80100028L)

//
// MessageId: SCARD_E_BAD_SEEK
//
// MessageText:
//
// There was an error trying to set the smart card file object pointer.
//
#define SCARD_E_BAD_SEEK                 _HRESULT_TYPEDEF_(0x80100029L)

//
// MessageId: SCARD_E_INVALID_CHV
//
// MessageText:
//
// The supplied PIN is incorrect.
//
#define SCARD_E_INVALID_CHV              _HRESULT_TYPEDEF_(0x8010002AL)

//
// MessageId: SCARD_E_UNKNOWN_RES_MNG
//
// MessageText:
//
// An unrecognized error code was returned from a layered component.
//
#define SCARD_E_UNKNOWN_RES_MNG          _HRESULT_TYPEDEF_(0x8010002BL)

//
// MessageId: SCARD_E_NO_SUCH_CERTIFICATE
//
// MessageText:
//
// The requested certificate does not exist.
//
#define SCARD_E_NO_SUCH_CERTIFICATE      _HRESULT_TYPEDEF_(0x8010002CL)

//
// MessageId: SCARD_E_CERTIFICATE_UNAVAILABLE
//
// MessageText:
//
// The requested certificate could not be obtained.
//
#define SCARD_E_CERTIFICATE_UNAVAILABLE  _HRESULT_TYPEDEF_(0x8010002DL)

//
// MessageId: SCARD_E_NO_READERS_AVAILABLE
//
// MessageText:
//
// Cannot find a smart card reader.
//
#define SCARD_E_NO_READERS_AVAILABLE     _HRESULT_TYPEDEF_(0x8010002EL)

//
// MessageId: SCARD_E_COMM_DATA_LOST
//
// MessageText:
//
// A communications error with the smart card has been detected. Retry the operation.
//
#define SCARD_E_COMM_DATA_LOST           _HRESULT_TYPEDEF_(0x8010002FL)

//
// MessageId: SCARD_E_NO_KEY_CONTAINER
//
// MessageText:
//
// The requested key container does not exist on the smart card.
//
#define SCARD_E_NO_KEY_CONTAINER         _HRESULT_TYPEDEF_(0x80100030L)

//
// MessageId: SCARD_E_SERVER_TOO_BUSY
//
// MessageText:
//
// The Smart card resource manager is too busy to complete this operation.
//
#define SCARD_E_SERVER_TOO_BUSY          _HRESULT_TYPEDEF_(0x80100031L)

//
// These are warning codes.
//
//
// MessageId: SCARD_W_UNSUPPORTED_CARD
//
// MessageText:
//
// The reader cannot communicate with the smart card, due to ATR configuration conflicts.
//
#define SCARD_W_UNSUPPORTED_CARD         _HRESULT_TYPEDEF_(0x80100065L)

//
// MessageId: SCARD_W_UNRESPONSIVE_CARD
//
// MessageText:
//
// The smart card is not responding to a reset.
//
#define SCARD_W_UNRESPONSIVE_CARD        _HRESULT_TYPEDEF_(0x80100066L)

//
// MessageId: SCARD_W_UNPOWERED_CARD
//
// MessageText:
//
// Power has been removed from the smart card, so that further communication is not possible.
//
#define SCARD_W_UNPOWERED_CARD           _HRESULT_TYPEDEF_(0x80100067L)

//
// MessageId: SCARD_W_RESET_CARD
//
// MessageText:
//
// The smart card has been reset, so any shared state information is invalid.
//
#define SCARD_W_RESET_CARD               _HRESULT_TYPEDEF_(0x80100068L)

//
// MessageId: SCARD_W_REMOVED_CARD
//
// MessageText:
//
// The smart card has been removed, so that further communication is not possible.
//
#define SCARD_W_REMOVED_CARD             _HRESULT_TYPEDEF_(0x80100069L)

//
// MessageId: SCARD_W_SECURITY_VIOLATION
//
// MessageText:
//
// Access was denied because of a security violation.
//
#define SCARD_W_SECURITY_VIOLATION       _HRESULT_TYPEDEF_(0x8010006AL)

//
// MessageId: SCARD_W_WRONG_CHV
//
// MessageText:
//
// The card cannot be accessed because the wrong PIN was presented.
//
#define SCARD_W_WRONG_CHV                _HRESULT_TYPEDEF_(0x8010006BL)

//
// MessageId: SCARD_W_CHV_BLOCKED
//
// MessageText:
//
// The card cannot be accessed because the maximum number of PIN entry attempts has been reached.
//
#define SCARD_W_CHV_BLOCKED              _HRESULT_TYPEDEF_(0x8010006CL)

//
// MessageId: SCARD_W_EOF
//
// MessageText:
//
// The end of the smart card file has been reached.
//
#define SCARD_W_EOF                      _HRESULT_TYPEDEF_(0x8010006DL)

//
// MessageId: SCARD_W_CANCELLED_BY_USER
//
// MessageText:
//
// The action was cancelled by the user.
//
#define SCARD_W_CANCELLED_BY_USER        _HRESULT_TYPEDEF_(0x8010006EL)

//
// MessageId: SCARD_W_CARD_NOT_AUTHENTICATED
//
// MessageText:
//
// No PIN was presented to the smart card.
//
#define SCARD_W_CARD_NOT_AUTHENTICATED   _HRESULT_TYPEDEF_(0x8010006FL)

//
// MessageId: SCARD_W_CACHE_ITEM_NOT_FOUND
//
// MessageText:
//
// The requested item could not be found in the cache.
//
#define SCARD_W_CACHE_ITEM_NOT_FOUND     _HRESULT_TYPEDEF_(0x80100070L)

//
// MessageId: SCARD_W_CACHE_ITEM_STALE
//
// MessageText:
//
// The requested cache item is too old and was deleted from the cache.
//
#define SCARD_W_CACHE_ITEM_STALE         _HRESULT_TYPEDEF_(0x80100071L)

//
// MessageId: SCARD_W_CACHE_ITEM_TOO_BIG
//
// MessageText:
//
// The new cache item exceeds the maximum per-item size defined for the cache.
//
#define SCARD_W_CACHE_ITEM_TOO_BIG       _HRESULT_TYPEDEF_(0x80100072L)

// *****************
// FACILITY_COMPLUS
// *****************
//
// ===============================
// Facility COMPLUS Error Messages
// ===============================
//
//
// The following are the subranges  within the COMPLUS facility
// 0x400 - 0x4ff               COMADMIN_E_CAT
// 0x600 - 0x6ff               COMQC errors
// 0x700 - 0x7ff               MSDTC errors
// 0x800 - 0x8ff               Other COMADMIN errors
//
// COMPLUS Admin errors
//
//
// MessageId: COMADMIN_E_OBJECTERRORS
//
// MessageText:
//
// Errors occurred accessing one or more objects - the ErrorInfo collection may have more detail
//
#define COMADMIN_E_OBJECTERRORS          _HRESULT_TYPEDEF_(0x80110401L)

//
// MessageId: COMADMIN_E_OBJECTINVALID
//
// MessageText:
//
// One or more of the object's properties are missing or invalid
//
#define COMADMIN_E_OBJECTINVALID         _HRESULT_TYPEDEF_(0x80110402L)

//
// MessageId: COMADMIN_E_KEYMISSING
//
// MessageText:
//
// The object was not found in the catalog
//
#define COMADMIN_E_KEYMISSING            _HRESULT_TYPEDEF_(0x80110403L)

//
// MessageId: COMADMIN_E_ALREADYINSTALLED
//
// MessageText:
//
// The object is already registered
//
#define COMADMIN_E_ALREADYINSTALLED      _HRESULT_TYPEDEF_(0x80110404L)

//
// MessageId: COMADMIN_E_APP_FILE_WRITEFAIL
//
// MessageText:
//
// Error occurred writing to the application file
//
#define COMADMIN_E_APP_FILE_WRITEFAIL    _HRESULT_TYPEDEF_(0x80110407L)

//
// MessageId: COMADMIN_E_APP_FILE_READFAIL
//
// MessageText:
//
// Error occurred reading the application file
//
#define COMADMIN_E_APP_FILE_READFAIL     _HRESULT_TYPEDEF_(0x80110408L)

//
// MessageId: COMADMIN_E_APP_FILE_VERSION
//
// MessageText:
//
// Invalid version number in application file
//
#define COMADMIN_E_APP_FILE_VERSION      _HRESULT_TYPEDEF_(0x80110409L)

//
// MessageId: COMADMIN_E_BADPATH
//
// MessageText:
//
// The file path is invalid
//
#define COMADMIN_E_BADPATH               _HRESULT_TYPEDEF_(0x8011040AL)

//
// MessageId: COMADMIN_E_APPLICATIONEXISTS
//
// MessageText:
//
// The application is already installed
//
#define COMADMIN_E_APPLICATIONEXISTS     _HRESULT_TYPEDEF_(0x8011040BL)

//
// MessageId: COMADMIN_E_ROLEEXISTS
//
// MessageText:
//
// The role already exists
//
#define COMADMIN_E_ROLEEXISTS            _HRESULT_TYPEDEF_(0x8011040CL)

//
// MessageId: COMADMIN_E_CANTCOPYFILE
//
// MessageText:
//
// An error occurred copying the file
//
#define COMADMIN_E_CANTCOPYFILE          _HRESULT_TYPEDEF_(0x8011040DL)

//
// MessageId: COMADMIN_E_NOUSER
//
// MessageText:
//
// One or more users are not valid
//
#define COMADMIN_E_NOUSER                _HRESULT_TYPEDEF_(0x8011040FL)

//
// MessageId: COMADMIN_E_INVALIDUSERIDS
//
// MessageText:
//
// One or more users in the application file are not valid
//
#define COMADMIN_E_INVALIDUSERIDS        _HRESULT_TYPEDEF_(0x80110410L)

//
// MessageId: COMADMIN_E_NOREGISTRYCLSID
//
// MessageText:
//
// The component's CLSID is missing or corrupt
//
#define COMADMIN_E_NOREGISTRYCLSID       _HRESULT_TYPEDEF_(0x80110411L)

//
// MessageId: COMADMIN_E_BADREGISTRYPROGID
//
// MessageText:
//
// The component's progID is missing or corrupt
//
#define COMADMIN_E_BADREGISTRYPROGID     _HRESULT_TYPEDEF_(0x80110412L)

//
// MessageId: COMADMIN_E_AUTHENTICATIONLEVEL
//
// MessageText:
//
// Unable to set required authentication level for update request
//
#define COMADMIN_E_AUTHENTICATIONLEVEL   _HRESULT_TYPEDEF_(0x80110413L)

//
// MessageId: COMADMIN_E_USERPASSWDNOTVALID
//
// MessageText:
//
// The identity or password set on the application is not valid
//
#define COMADMIN_E_USERPASSWDNOTVALID    _HRESULT_TYPEDEF_(0x80110414L)

//
// MessageId: COMADMIN_E_CLSIDORIIDMISMATCH
//
// MessageText:
//
// Application file CLSIDs or IIDs do not match corresponding DLLs
//
#define COMADMIN_E_CLSIDORIIDMISMATCH    _HRESULT_TYPEDEF_(0x80110418L)

//
// MessageId: COMADMIN_E_REMOTEINTERFACE
//
// MessageText:
//
// Interface information is either missing or changed
//
#define COMADMIN_E_REMOTEINTERFACE       _HRESULT_TYPEDEF_(0x80110419L)

//
// MessageId: COMADMIN_E_DLLREGISTERSERVER
//
// MessageText:
//
// DllRegisterServer failed on component install
//
#define COMADMIN_E_DLLREGISTERSERVER     _HRESULT_TYPEDEF_(0x8011041AL)

//
// MessageId: COMADMIN_E_NOSERVERSHARE
//
// MessageText:
//
// No server file share available
//
#define COMADMIN_E_NOSERVERSHARE         _HRESULT_TYPEDEF_(0x8011041BL)

//
// MessageId: COMADMIN_E_DLLLOADFAILED
//
// MessageText:
//
// DLL could not be loaded
//
#define COMADMIN_E_DLLLOADFAILED         _HRESULT_TYPEDEF_(0x8011041DL)

//
// MessageId: COMADMIN_E_BADREGISTRYLIBID
//
// MessageText:
//
// The registered TypeLib ID is not valid
//
#define COMADMIN_E_BADREGISTRYLIBID      _HRESULT_TYPEDEF_(0x8011041EL)

//
// MessageId: COMADMIN_E_APPDIRNOTFOUND
//
// MessageText:
//
// Application install directory not found
//
#define COMADMIN_E_APPDIRNOTFOUND        _HRESULT_TYPEDEF_(0x8011041FL)

//
// MessageId: COMADMIN_E_REGISTRARFAILED
//
// MessageText:
//
// Errors occurred while in the component registrar
//
#define COMADMIN_E_REGISTRARFAILED       _HRESULT_TYPEDEF_(0x80110423L)

//
// MessageId: COMADMIN_E_COMPFILE_DOESNOTEXIST
//
// MessageText:
//
// The file does not exist
//
#define COMADMIN_E_COMPFILE_DOESNOTEXIST _HRESULT_TYPEDEF_(0x80110424L)

//
// MessageId: COMADMIN_E_COMPFILE_LOADDLLFAIL
//
// MessageText:
//
// The DLL could not be loaded
//
#define COMADMIN_E_COMPFILE_LOADDLLFAIL  _HRESULT_TYPEDEF_(0x80110425L)

//
// MessageId: COMADMIN_E_COMPFILE_GETCLASSOBJ
//
// MessageText:
//
// GetClassObject failed in the DLL
//
#define COMADMIN_E_COMPFILE_GETCLASSOBJ  _HRESULT_TYPEDEF_(0x80110426L)

//
// MessageId: COMADMIN_E_COMPFILE_CLASSNOTAVAIL
//
// MessageText:
//
// The DLL does not support the components listed in the TypeLib
//
#define COMADMIN_E_COMPFILE_CLASSNOTAVAIL _HRESULT_TYPEDEF_(0x80110427L)

//
// MessageId: COMADMIN_E_COMPFILE_BADTLB
//
// MessageText:
//
// The TypeLib could not be loaded
//
#define COMADMIN_E_COMPFILE_BADTLB       _HRESULT_TYPEDEF_(0x80110428L)

//
// MessageId: COMADMIN_E_COMPFILE_NOTINSTALLABLE
//
// MessageText:
//
// The file does not contain components or component information
//
#define COMADMIN_E_COMPFILE_NOTINSTALLABLE _HRESULT_TYPEDEF_(0x80110429L)

//
// MessageId: COMADMIN_E_NOTCHANGEABLE
//
// MessageText:
//
// Changes to this object and its sub-objects have been disabled
//
#define COMADMIN_E_NOTCHANGEABLE         _HRESULT_TYPEDEF_(0x8011042AL)

//
// MessageId: COMADMIN_E_NOTDELETEABLE
//
// MessageText:
//
// The delete function has been disabled for this object
//
#define COMADMIN_E_NOTDELETEABLE         _HRESULT_TYPEDEF_(0x8011042BL)

//
// MessageId: COMADMIN_E_SESSION
//
// MessageText:
//
// The server catalog version is not supported
//
#define COMADMIN_E_SESSION               _HRESULT_TYPEDEF_(0x8011042CL)

//
// MessageId: COMADMIN_E_COMP_MOVE_LOCKED
//
// MessageText:
//
// The component move was disallowed, because the source or destination application is either a system application or currently locked against changes
//
#define COMADMIN_E_COMP_MOVE_LOCKED      _HRESULT_TYPEDEF_(0x8011042DL)

//
// MessageId: COMADMIN_E_COMP_MOVE_BAD_DEST
//
// MessageText:
//
// The component move failed because the destination application no longer exists
//
#define COMADMIN_E_COMP_MOVE_BAD_DEST    _HRESULT_TYPEDEF_(0x8011042EL)

//
// MessageId: COMADMIN_E_REGISTERTLB
//
// MessageText:
//
// The system was unable to register the TypeLib
//
#define COMADMIN_E_REGISTERTLB           _HRESULT_TYPEDEF_(0x80110430L)

//
// MessageId: COMADMIN_E_SYSTEMAPP
//
// MessageText:
//
// This operation cannot be performed on the system application
//
#define COMADMIN_E_SYSTEMAPP             _HRESULT_TYPEDEF_(0x80110433L)

//
// MessageId: COMADMIN_E_COMPFILE_NOREGISTRAR
//
// MessageText:
//
// The component registrar referenced in this file is not available
//
#define COMADMIN_E_COMPFILE_NOREGISTRAR  _HRESULT_TYPEDEF_(0x80110434L)

//
// MessageId: COMADMIN_E_COREQCOMPINSTALLED
//
// MessageText:
//
// A component in the same DLL is already installed
//
#define COMADMIN_E_COREQCOMPINSTALLED    _HRESULT_TYPEDEF_(0x80110435L)

//
// MessageId: COMADMIN_E_SERVICENOTINSTALLED
//
// MessageText:
//
// The service is not installed
//
#define COMADMIN_E_SERVICENOTINSTALLED   _HRESULT_TYPEDEF_(0x80110436L)

//
// MessageId: COMADMIN_E_PROPERTYSAVEFAILED
//
// MessageText:
//
// One or more property settings are either invalid or in conflict with each other
//
#define COMADMIN_E_PROPERTYSAVEFAILED    _HRESULT_TYPEDEF_(0x80110437L)

//
// MessageId: COMADMIN_E_OBJECTEXISTS
//
// MessageText:
//
// The object you are attempting to add or rename already exists
//
#define COMADMIN_E_OBJECTEXISTS          _HRESULT_TYPEDEF_(0x80110438L)

//
// MessageId: COMADMIN_E_COMPONENTEXISTS
//
// MessageText:
//
// The component already exists
//
#define COMADMIN_E_COMPONENTEXISTS       _HRESULT_TYPEDEF_(0x80110439L)

//
// MessageId: COMADMIN_E_REGFILE_CORRUPT
//
// MessageText:
//
// The registration file is corrupt
//
#define COMADMIN_E_REGFILE_CORRUPT       _HRESULT_TYPEDEF_(0x8011043BL)

//
// MessageId: COMADMIN_E_PROPERTY_OVERFLOW
//
// MessageText:
//
// The property value is too large
//
#define COMADMIN_E_PROPERTY_OVERFLOW     _HRESULT_TYPEDEF_(0x8011043CL)

//
// MessageId: COMADMIN_E_NOTINREGISTRY
//
// MessageText:
//
// Object was not found in registry
//
#define COMADMIN_E_NOTINREGISTRY         _HRESULT_TYPEDEF_(0x8011043EL)

//
// MessageId: COMADMIN_E_OBJECTNOTPOOLABLE
//
// MessageText:
//
// This object is not poolable
//
#define COMADMIN_E_OBJECTNOTPOOLABLE     _HRESULT_TYPEDEF_(0x8011043FL)

//
// MessageId: COMADMIN_E_APPLID_MATCHES_CLSID
//
// MessageText:
//
// A CLSID with the same GUID as the new application ID is already installed on this machine
//
#define COMADMIN_E_APPLID_MATCHES_CLSID  _HRESULT_TYPEDEF_(0x80110446L)

//
// MessageId: COMADMIN_E_ROLE_DOES_NOT_EXIST
//
// MessageText:
//
// A role assigned to a component, interface, or method did not exist in the application
//
#define COMADMIN_E_ROLE_DOES_NOT_EXIST   _HRESULT_TYPEDEF_(0x80110447L)

//
// MessageId: COMADMIN_E_START_APP_NEEDS_COMPONENTS
//
// MessageText:
//
// You must have components in an application in order to start the application
//
#define COMADMIN_E_START_APP_NEEDS_COMPONENTS _HRESULT_TYPEDEF_(0x80110448L)

//
// MessageId: COMADMIN_E_REQUIRES_DIFFERENT_PLATFORM
//
// MessageText:
//
// This operation is not enabled on this platform
//
#define COMADMIN_E_REQUIRES_DIFFERENT_PLATFORM _HRESULT_TYPEDEF_(0x80110449L)

//
// MessageId: COMADMIN_E_CAN_NOT_EXPORT_APP_PROXY
//
// MessageText:
//
// Application Proxy is not exportable
//
#define COMADMIN_E_CAN_NOT_EXPORT_APP_PROXY _HRESULT_TYPEDEF_(0x8011044AL)

//
// MessageId: COMADMIN_E_CAN_NOT_START_APP
//
// MessageText:
//
// Failed to start application because it is either a library application or an application proxy
//
#define COMADMIN_E_CAN_NOT_START_APP     _HRESULT_TYPEDEF_(0x8011044BL)

//
// MessageId: COMADMIN_E_CAN_NOT_EXPORT_SYS_APP
//
// MessageText:
//
// System application is not exportable
//
#define COMADMIN_E_CAN_NOT_EXPORT_SYS_APP _HRESULT_TYPEDEF_(0x8011044CL)

//
// MessageId: COMADMIN_E_CANT_SUBSCRIBE_TO_COMPONENT
//
// MessageText:
//
// Cannot subscribe to this component (the component may have been imported)
//
#define COMADMIN_E_CANT_SUBSCRIBE_TO_COMPONENT _HRESULT_TYPEDEF_(0x8011044DL)

//
// MessageId: COMADMIN_E_EVENTCLASS_CANT_BE_SUBSCRIBER
//
// MessageText:
//
// An event class cannot also be a subscriber component
//
#define COMADMIN_E_EVENTCLASS_CANT_BE_SUBSCRIBER _HRESULT_TYPEDEF_(0x8011044EL)

//
// MessageId: COMADMIN_E_LIB_APP_PROXY_INCOMPATIBLE
//
// MessageText:
//
// Library applications and application proxies are incompatible
//
#define COMADMIN_E_LIB_APP_PROXY_INCOMPATIBLE _HRESULT_TYPEDEF_(0x8011044FL)

//
// MessageId: COMADMIN_E_BASE_PARTITION_ONLY
//
// MessageText:
//
// This function is valid for the base partition only
//
#define COMADMIN_E_BASE_PARTITION_ONLY   _HRESULT_TYPEDEF_(0x80110450L)

//
// MessageId: COMADMIN_E_START_APP_DISABLED
//
// MessageText:
//
// You cannot start an application that has been disabled
//
#define COMADMIN_E_START_APP_DISABLED    _HRESULT_TYPEDEF_(0x80110451L)

//
// MessageId: COMADMIN_E_CAT_DUPLICATE_PARTITION_NAME
//
// MessageText:
//
// The specified partition name is already in use on this computer
//
#define COMADMIN_E_CAT_DUPLICATE_PARTITION_NAME _HRESULT_TYPEDEF_(0x80110457L)

//
// MessageId: COMADMIN_E_CAT_INVALID_PARTITION_NAME
//
// MessageText:
//
// The specified partition name is invalid. Check that the name contains at least one visible character
//
#define COMADMIN_E_CAT_INVALID_PARTITION_NAME _HRESULT_TYPEDEF_(0x80110458L)

//
// MessageId: COMADMIN_E_CAT_PARTITION_IN_USE
//
// MessageText:
//
// The partition cannot be deleted because it is the default partition for one or more users
//
#define COMADMIN_E_CAT_PARTITION_IN_USE  _HRESULT_TYPEDEF_(0x80110459L)

//
// MessageId: COMADMIN_E_FILE_PARTITION_DUPLICATE_FILES
//
// MessageText:
//
// The partition cannot be exported, because one or more components in the partition have the same file name
//
#define COMADMIN_E_FILE_PARTITION_DUPLICATE_FILES _HRESULT_TYPEDEF_(0x8011045AL)

//
// MessageId: COMADMIN_E_CAT_IMPORTED_COMPONENTS_NOT_ALLOWED
//
// MessageText:
//
// Applications that contain one or more imported components cannot be installed into a non-base partition
//
#define COMADMIN_E_CAT_IMPORTED_COMPONENTS_NOT_ALLOWED _HRESULT_TYPEDEF_(0x8011045BL)

//
// MessageId: COMADMIN_E_AMBIGUOUS_APPLICATION_NAME
//
// MessageText:
//
// The application name is not unique and cannot be resolved to an application id
//
#define COMADMIN_E_AMBIGUOUS_APPLICATION_NAME _HRESULT_TYPEDEF_(0x8011045CL)

//
// MessageId: COMADMIN_E_AMBIGUOUS_PARTITION_NAME
//
// MessageText:
//
// The partition name is not unique and cannot be resolved to a partition id
//
#define COMADMIN_E_AMBIGUOUS_PARTITION_NAME _HRESULT_TYPEDEF_(0x8011045DL)

//
// MessageId: COMADMIN_E_REGDB_NOTINITIALIZED
//
// MessageText:
//
// The COM+ registry database has not been initialized
//
#define COMADMIN_E_REGDB_NOTINITIALIZED  _HRESULT_TYPEDEF_(0x80110472L)

//
// MessageId: COMADMIN_E_REGDB_NOTOPEN
//
// MessageText:
//
// The COM+ registry database is not open
//
#define COMADMIN_E_REGDB_NOTOPEN         _HRESULT_TYPEDEF_(0x80110473L)

//
// MessageId: COMADMIN_E_REGDB_SYSTEMERR
//
// MessageText:
//
// The COM+ registry database detected a system error
//
#define COMADMIN_E_REGDB_SYSTEMERR       _HRESULT_TYPEDEF_(0x80110474L)

//
// MessageId: COMADMIN_E_REGDB_ALREADYRUNNING
//
// MessageText:
//
// The COM+ registry database is already running
//
#define COMADMIN_E_REGDB_ALREADYRUNNING  _HRESULT_TYPEDEF_(0x80110475L)

//
// MessageId: COMADMIN_E_MIG_VERSIONNOTSUPPORTED
//
// MessageText:
//
// This version of the COM+ registry database cannot be migrated
//
#define COMADMIN_E_MIG_VERSIONNOTSUPPORTED _HRESULT_TYPEDEF_(0x80110480L)

//
// MessageId: COMADMIN_E_MIG_SCHEMANOTFOUND
//
// MessageText:
//
// The schema version to be migrated could not be found in the COM+ registry database
//
#define COMADMIN_E_MIG_SCHEMANOTFOUND    _HRESULT_TYPEDEF_(0x80110481L)

//
// MessageId: COMADMIN_E_CAT_BITNESSMISMATCH
//
// MessageText:
//
// There was a type mismatch between binaries
//
#define COMADMIN_E_CAT_BITNESSMISMATCH   _HRESULT_TYPEDEF_(0x80110482L)

//
// MessageId: COMADMIN_E_CAT_UNACCEPTABLEBITNESS
//
// MessageText:
//
// A binary of unknown or invalid type was provided
//
#define COMADMIN_E_CAT_UNACCEPTABLEBITNESS _HRESULT_TYPEDEF_(0x80110483L)

//
// MessageId: COMADMIN_E_CAT_WRONGAPPBITNESS
//
// MessageText:
//
// There was a type mismatch between a binary and an application
//
#define COMADMIN_E_CAT_WRONGAPPBITNESS   _HRESULT_TYPEDEF_(0x80110484L)

//
// MessageId: COMADMIN_E_CAT_PAUSE_RESUME_NOT_SUPPORTED
//
// MessageText:
//
// The application cannot be paused or resumed
//
#define COMADMIN_E_CAT_PAUSE_RESUME_NOT_SUPPORTED _HRESULT_TYPEDEF_(0x80110485L)

//
// MessageId: COMADMIN_E_CAT_SERVERFAULT
//
// MessageText:
//
// The COM+ Catalog Server threw an exception during execution
//
#define COMADMIN_E_CAT_SERVERFAULT       _HRESULT_TYPEDEF_(0x80110486L)

//
// COMPLUS Queued component errors
//
//
// MessageId: COMQC_E_APPLICATION_NOT_QUEUED
//
// MessageText:
//
// Only COM+ Applications marked "queued" can be invoked using the "queue" moniker
//
#define COMQC_E_APPLICATION_NOT_QUEUED   _HRESULT_TYPEDEF_(0x80110600L)

//
// MessageId: COMQC_E_NO_QUEUEABLE_INTERFACES
//
// MessageText:
//
// At least one interface must be marked "queued" in order to create a queued component instance with the "queue" moniker
//
#define COMQC_E_NO_QUEUEABLE_INTERFACES  _HRESULT_TYPEDEF_(0x80110601L)

//
// MessageId: COMQC_E_QUEUING_SERVICE_NOT_AVAILABLE
//
// MessageText:
//
// MSMQ is required for the requested operation and is not installed
//
#define COMQC_E_QUEUING_SERVICE_NOT_AVAILABLE _HRESULT_TYPEDEF_(0x80110602L)

//
// MessageId: COMQC_E_NO_IPERSISTSTREAM
//
// MessageText:
//
// Unable to marshal an interface that does not support IPersistStream
//
#define COMQC_E_NO_IPERSISTSTREAM        _HRESULT_TYPEDEF_(0x80110603L)

//
// MessageId: COMQC_E_BAD_MESSAGE
//
// MessageText:
//
// The message is improperly formatted or was damaged in transit
//
#define COMQC_E_BAD_MESSAGE              _HRESULT_TYPEDEF_(0x80110604L)

//
// MessageId: COMQC_E_UNAUTHENTICATED
//
// MessageText:
//
// An unauthenticated message was received by an application that accepts only authenticated messages
//
#define COMQC_E_UNAUTHENTICATED          _HRESULT_TYPEDEF_(0x80110605L)

//
// MessageId: COMQC_E_UNTRUSTED_ENQUEUER
//
// MessageText:
//
// The message was requeued or moved by a user not in the "QC Trusted User" role
//
#define COMQC_E_UNTRUSTED_ENQUEUER       _HRESULT_TYPEDEF_(0x80110606L)

//
// The range 0x700-0x7ff is reserved for MSDTC errors.
//
//
// MessageId: MSDTC_E_DUPLICATE_RESOURCE
//
// MessageText:
//
// Cannot create a duplicate resource of type Distributed Transaction Coordinator
//
#define MSDTC_E_DUPLICATE_RESOURCE       _HRESULT_TYPEDEF_(0x80110701L)

//
// More COMADMIN errors from 0x8**
//
//
// MessageId: COMADMIN_E_OBJECT_PARENT_MISSING
//
// MessageText:
//
// One of the objects being inserted or updated does not belong to a valid parent collection
//
#define COMADMIN_E_OBJECT_PARENT_MISSING _HRESULT_TYPEDEF_(0x80110808L)

//
// MessageId: COMADMIN_E_OBJECT_DOES_NOT_EXIST
//
// MessageText:
//
// One of the specified objects cannot be found
//
#define COMADMIN_E_OBJECT_DOES_NOT_EXIST _HRESULT_TYPEDEF_(0x80110809L)

//
// MessageId: COMADMIN_E_APP_NOT_RUNNING
//
// MessageText:
//
// The specified application is not currently running
//
#define COMADMIN_E_APP_NOT_RUNNING       _HRESULT_TYPEDEF_(0x8011080AL)

//
// MessageId: COMADMIN_E_INVALID_PARTITION
//
// MessageText:
//
// The partition(s) specified are not valid.
//
#define COMADMIN_E_INVALID_PARTITION     _HRESULT_TYPEDEF_(0x8011080BL)

//
// MessageId: COMADMIN_E_SVCAPP_NOT_POOLABLE_OR_RECYCLABLE
//
// MessageText:
//
// COM+ applications that run as NT service may not be pooled or recycled
//
#define COMADMIN_E_SVCAPP_NOT_POOLABLE_OR_RECYCLABLE _HRESULT_TYPEDEF_(0x8011080DL)

//
// MessageId: COMADMIN_E_USER_IN_SET
//
// MessageText:
//
// One or more users are already assigned to a local partition set.
//
#define COMADMIN_E_USER_IN_SET           _HRESULT_TYPEDEF_(0x8011080EL)

//
// MessageId: COMADMIN_E_CANTRECYCLELIBRARYAPPS
//
// MessageText:
//
// Library applications may not be recycled.
//
#define COMADMIN_E_CANTRECYCLELIBRARYAPPS _HRESULT_TYPEDEF_(0x8011080FL)

//
// MessageId: COMADMIN_E_CANTRECYCLESERVICEAPPS
//
// MessageText:
//
// Applications running as NT services may not be recycled.
//
#define COMADMIN_E_CANTRECYCLESERVICEAPPS _HRESULT_TYPEDEF_(0x80110811L)

//
// MessageId: COMADMIN_E_PROCESSALREADYRECYCLED
//
// MessageText:
//
// The process has already been recycled.
//
#define COMADMIN_E_PROCESSALREADYRECYCLED _HRESULT_TYPEDEF_(0x80110812L)

//
// MessageId: COMADMIN_E_PAUSEDPROCESSMAYNOTBERECYCLED
//
// MessageText:
//
// A paused process may not be recycled.
//
#define COMADMIN_E_PAUSEDPROCESSMAYNOTBERECYCLED _HRESULT_TYPEDEF_(0x80110813L)

//
// MessageId: COMADMIN_E_CANTMAKEINPROCSERVICE
//
// MessageText:
//
// Library applications may not be NT services.
//
#define COMADMIN_E_CANTMAKEINPROCSERVICE _HRESULT_TYPEDEF_(0x80110814L)

//
// MessageId: COMADMIN_E_PROGIDINUSEBYCLSID
//
// MessageText:
//
// The ProgID provided to the copy operation is invalid. The ProgID is in use by another registered CLSID.
//
#define COMADMIN_E_PROGIDINUSEBYCLSID    _HRESULT_TYPEDEF_(0x80110815L)

//
// MessageId: COMADMIN_E_DEFAULT_PARTITION_NOT_IN_SET
//
// MessageText:
//
// The partition specified as default is not a member of the partition set.
//
#define COMADMIN_E_DEFAULT_PARTITION_NOT_IN_SET _HRESULT_TYPEDEF_(0x80110816L)

//
// MessageId: COMADMIN_E_RECYCLEDPROCESSMAYNOTBEPAUSED
//
// MessageText:
//
// A recycled process may not be paused.
//
#define COMADMIN_E_RECYCLEDPROCESSMAYNOTBEPAUSED _HRESULT_TYPEDEF_(0x80110817L)

//
// MessageId: COMADMIN_E_PARTITION_ACCESSDENIED
//
// MessageText:
//
// Access to the specified partition is denied.
//
#define COMADMIN_E_PARTITION_ACCESSDENIED _HRESULT_TYPEDEF_(0x80110818L)

//
// MessageId: COMADMIN_E_PARTITION_MSI_ONLY
//
// MessageText:
//
// Only Application Files (*.MSI files) can be installed into partitions.
//
#define COMADMIN_E_PARTITION_MSI_ONLY    _HRESULT_TYPEDEF_(0x80110819L)

//
// MessageId: COMADMIN_E_LEGACYCOMPS_NOT_ALLOWED_IN_1_0_FORMAT
//
// MessageText:
//
// Applications containing one or more legacy components may not be exported to 1.0 format.
//
#define COMADMIN_E_LEGACYCOMPS_NOT_ALLOWED_IN_1_0_FORMAT _HRESULT_TYPEDEF_(0x8011081AL)

//
// MessageId: COMADMIN_E_LEGACYCOMPS_NOT_ALLOWED_IN_NONBASE_PARTITIONS
//
// MessageText:
//
// Legacy components may not exist in non-base partitions.
//
#define COMADMIN_E_LEGACYCOMPS_NOT_ALLOWED_IN_NONBASE_PARTITIONS _HRESULT_TYPEDEF_(0x8011081BL)

//
// MessageId: COMADMIN_E_COMP_MOVE_SOURCE
//
// MessageText:
//
// A component cannot be moved (or copied) from the System Application, an application proxy or a non-changeable application
//
#define COMADMIN_E_COMP_MOVE_SOURCE      _HRESULT_TYPEDEF_(0x8011081CL)

//
// MessageId: COMADMIN_E_COMP_MOVE_DEST
//
// MessageText:
//
// A component cannot be moved (or copied) to the System Application, an application proxy or a non-changeable application
//
#define COMADMIN_E_COMP_MOVE_DEST        _HRESULT_TYPEDEF_(0x8011081DL)

//
// MessageId: COMADMIN_E_COMP_MOVE_PRIVATE
//
// MessageText:
//
// A private component cannot be moved (or copied) to a library application or to the base partition
//
#define COMADMIN_E_COMP_MOVE_PRIVATE     _HRESULT_TYPEDEF_(0x8011081EL)

//
// MessageId: COMADMIN_E_BASEPARTITION_REQUIRED_IN_SET
//
// MessageText:
//
// The Base Application Partition exists in all partition sets and cannot be removed.
//
#define COMADMIN_E_BASEPARTITION_REQUIRED_IN_SET _HRESULT_TYPEDEF_(0x8011081FL)

//
// MessageId: COMADMIN_E_CANNOT_ALIAS_EVENTCLASS
//
// MessageText:
//
// Alas, Event Class components cannot be aliased.
//
#define COMADMIN_E_CANNOT_ALIAS_EVENTCLASS _HRESULT_TYPEDEF_(0x80110820L)

//
// MessageId: COMADMIN_E_PRIVATE_ACCESSDENIED
//
// MessageText:
//
// Access is denied because the component is private.
//
#define COMADMIN_E_PRIVATE_ACCESSDENIED  _HRESULT_TYPEDEF_(0x80110821L)

//
// MessageId: COMADMIN_E_SAFERINVALID
//
// MessageText:
//
// The specified SAFER level is invalid.
//
#define COMADMIN_E_SAFERINVALID          _HRESULT_TYPEDEF_(0x80110822L)

//
// MessageId: COMADMIN_E_REGISTRY_ACCESSDENIED
//
// MessageText:
//
// The specified user cannot write to the system registry
//
#define COMADMIN_E_REGISTRY_ACCESSDENIED _HRESULT_TYPEDEF_(0x80110823L)

//
// MessageId: COMADMIN_E_PARTITIONS_DISABLED
//
// MessageText:
//
// COM+ partitions are currently disabled.
//
#define COMADMIN_E_PARTITIONS_DISABLED   _HRESULT_TYPEDEF_(0x80110824L)

// ***********************
// FACILITY_USERMODE_FILTER_MANAGER
// ***********************
//
//  Translation macro for converting:
//     NTSTATUS  --> HRESULT
//
#define FILTER_HRESULT_FROM_FLT_NTSTATUS(x) ((HRESULT) (((x) & 0x8000FFFF) | (FACILITY_USERMODE_FILTER_MANAGER << 16)))
//
// MessageId: ERROR_FLT_IO_COMPLETE
//
// MessageText:
//
// The IO was completed by a filter.
//
#define ERROR_FLT_IO_COMPLETE            _HRESULT_TYPEDEF_(0x001F0001L)

//
// MessageId: ERROR_FLT_NO_HANDLER_DEFINED
//
// MessageText:
//
// A handler was not defined by the filter for this operation.
//
#define ERROR_FLT_NO_HANDLER_DEFINED     _HRESULT_TYPEDEF_(0x801F0001L)

//
// MessageId: ERROR_FLT_CONTEXT_ALREADY_DEFINED
//
// MessageText:
//
// A context is already defined for this object.
//
#define ERROR_FLT_CONTEXT_ALREADY_DEFINED _HRESULT_TYPEDEF_(0x801F0002L)

//
// MessageId: ERROR_FLT_INVALID_ASYNCHRONOUS_REQUEST
//
// MessageText:
//
// Asynchronous requests are not valid for this operation.
//
#define ERROR_FLT_INVALID_ASYNCHRONOUS_REQUEST _HRESULT_TYPEDEF_(0x801F0003L)

//
// MessageId: ERROR_FLT_DISALLOW_FAST_IO
//
// MessageText:
//
// Disallow the Fast IO path for this operation.
//
#define ERROR_FLT_DISALLOW_FAST_IO       _HRESULT_TYPEDEF_(0x801F0004L)

//
// MessageId: ERROR_FLT_INVALID_NAME_REQUEST
//
// MessageText:
//
// An invalid name request was made. The name requested cannot be retrieved at this time.
//
#define ERROR_FLT_INVALID_NAME_REQUEST   _HRESULT_TYPEDEF_(0x801F0005L)

//
// MessageId: ERROR_FLT_NOT_SAFE_TO_POST_OPERATION
//
// MessageText:
//
// Posting this operation to a worker thread for further processing is not safe at this time because it could lead to a system deadlock.
//
#define ERROR_FLT_NOT_SAFE_TO_POST_OPERATION _HRESULT_TYPEDEF_(0x801F0006L)

//
// MessageId: ERROR_FLT_NOT_INITIALIZED
//
// MessageText:
//
// The Filter Manager was not initialized when a filter tried to register. Make sure that the Filter Manager is getting loaded as a driver.
//
#define ERROR_FLT_NOT_INITIALIZED        _HRESULT_TYPEDEF_(0x801F0007L)

//
// MessageId: ERROR_FLT_FILTER_NOT_READY
//
// MessageText:
//
// The filter is not ready for attachment to volumes because it has not finished initializing (FltStartFiltering has not been called).
//
#define ERROR_FLT_FILTER_NOT_READY       _HRESULT_TYPEDEF_(0x801F0008L)

//
// MessageId: ERROR_FLT_POST_OPERATION_CLEANUP
//
// MessageText:
//
// The filter must cleanup any operation specific context at this time because it is being removed from the system before the operation is completed by the lower drivers.
//
#define ERROR_FLT_POST_OPERATION_CLEANUP _HRESULT_TYPEDEF_(0x801F0009L)

//
// MessageId: ERROR_FLT_INTERNAL_ERROR
//
// MessageText:
//
// The Filter Manager had an internal error from which it cannot recover, therefore the operation has been failed. This is usually the result of a filter returning an invalid value from a pre-operation callback.
//
#define ERROR_FLT_INTERNAL_ERROR         _HRESULT_TYPEDEF_(0x801F000AL)

//
// MessageId: ERROR_FLT_DELETING_OBJECT
//
// MessageText:
//
// The object specified for this action is in the process of being deleted, therefore the action requested cannot be completed at this time.
//
#define ERROR_FLT_DELETING_OBJECT        _HRESULT_TYPEDEF_(0x801F000BL)

//
// MessageId: ERROR_FLT_MUST_BE_NONPAGED_POOL
//
// MessageText:
//
// Non-paged pool must be used for this type of context.
//
#define ERROR_FLT_MUST_BE_NONPAGED_POOL  _HRESULT_TYPEDEF_(0x801F000CL)

//
// MessageId: ERROR_FLT_DUPLICATE_ENTRY
//
// MessageText:
//
// A duplicate handler definition has been provided for an operation.
//
#define ERROR_FLT_DUPLICATE_ENTRY        _HRESULT_TYPEDEF_(0x801F000DL)

//
// MessageId: ERROR_FLT_CBDQ_DISABLED
//
// MessageText:
//
// The callback data queue has been disabled.
//
#define ERROR_FLT_CBDQ_DISABLED          _HRESULT_TYPEDEF_(0x801F000EL)

//
// MessageId: ERROR_FLT_DO_NOT_ATTACH
//
// MessageText:
//
// Do not attach the filter to the volume at this time.
//
#define ERROR_FLT_DO_NOT_ATTACH          _HRESULT_TYPEDEF_(0x801F000FL)

//
// MessageId: ERROR_FLT_DO_NOT_DETACH
//
// MessageText:
//
// Do not detach the filter from the volume at this time.
//
#define ERROR_FLT_DO_NOT_DETACH          _HRESULT_TYPEDEF_(0x801F0010L)

//
// MessageId: ERROR_FLT_INSTANCE_ALTITUDE_COLLISION
//
// MessageText:
//
// An instance already exists at this altitude on the volume specified.
//
#define ERROR_FLT_INSTANCE_ALTITUDE_COLLISION _HRESULT_TYPEDEF_(0x801F0011L)

//
// MessageId: ERROR_FLT_INSTANCE_NAME_COLLISION
//
// MessageText:
//
// An instance already exists with this name on the volume specified.
//
#define ERROR_FLT_INSTANCE_NAME_COLLISION _HRESULT_TYPEDEF_(0x801F0012L)

//
// MessageId: ERROR_FLT_FILTER_NOT_FOUND
//
// MessageText:
//
// The system could not find the filter specified.
//
#define ERROR_FLT_FILTER_NOT_FOUND       _HRESULT_TYPEDEF_(0x801F0013L)

//
// MessageId: ERROR_FLT_VOLUME_NOT_FOUND
//
// MessageText:
//
// The system could not find the volume specified.
//
#define ERROR_FLT_VOLUME_NOT_FOUND       _HRESULT_TYPEDEF_(0x801F0014L)

//
// MessageId: ERROR_FLT_INSTANCE_NOT_FOUND
//
// MessageText:
//
// The system could not find the instance specified.
//
#define ERROR_FLT_INSTANCE_NOT_FOUND     _HRESULT_TYPEDEF_(0x801F0015L)

//
// MessageId: ERROR_FLT_CONTEXT_ALLOCATION_NOT_FOUND
//
// MessageText:
//
// No registered context allocation definition was found for the given request.
//
#define ERROR_FLT_CONTEXT_ALLOCATION_NOT_FOUND _HRESULT_TYPEDEF_(0x801F0016L)

//
// MessageId: ERROR_FLT_INVALID_CONTEXT_REGISTRATION
//
// MessageText:
//
// An invalid parameter was specified during context registration.
//
#define ERROR_FLT_INVALID_CONTEXT_REGISTRATION _HRESULT_TYPEDEF_(0x801F0017L)

//
// MessageId: ERROR_FLT_NAME_CACHE_MISS
//
// MessageText:
//
// The name requested was not found in Filter Manager's name cache and could not be retrieved from the file system.
//
#define ERROR_FLT_NAME_CACHE_MISS        _HRESULT_TYPEDEF_(0x801F0018L)

//
// MessageId: ERROR_FLT_NO_DEVICE_OBJECT
//
// MessageText:
//
// The requested device object does not exist for the given volume.
//
#define ERROR_FLT_NO_DEVICE_OBJECT       _HRESULT_TYPEDEF_(0x801F0019L)

//
// MessageId: ERROR_FLT_VOLUME_ALREADY_MOUNTED
//
// MessageText:
//
// The specified volume is already mounted.
//
#define ERROR_FLT_VOLUME_ALREADY_MOUNTED _HRESULT_TYPEDEF_(0x801F001AL)

//
// MessageId: ERROR_FLT_ALREADY_ENLISTED
//
// MessageText:
//
// The specified Transaction Context is already enlisted in a transaction
//
#define ERROR_FLT_ALREADY_ENLISTED       _HRESULT_TYPEDEF_(0x801F001BL)

//
// MessageId: ERROR_FLT_CONTEXT_ALREADY_LINKED
//
// MessageText:
//
// The specifiec context is already attached to another object
//
#define ERROR_FLT_CONTEXT_ALREADY_LINKED _HRESULT_TYPEDEF_(0x801F001CL)

//
// MessageId: ERROR_FLT_NO_WAITER_FOR_REPLY
//
// MessageText:
//
// No waiter is present for the filter's reply to this message.
//
#define ERROR_FLT_NO_WAITER_FOR_REPLY    _HRESULT_TYPEDEF_(0x801F0020L)

//
// ===============================
// Facility Graphics Error Messages
// ===============================
//
//
// The following are the subranges within the Graphics facility
//
// 0x0000 - 0x0fff     Display Driver Loader driver & Video Port errors (displdr.sys, videoprt.sys)
// 0x1000 - 0x1fff     Monitor Class Function driver errors             (monitor.sys)
// 0x2000 - 0x2fff     Windows Graphics Kernel Subsystem errors         (dxgkrnl.sys)
// 0x3000 - 0x3fff               Desktop Window Manager errors
//   0x2000 - 0x20ff      Common errors
//   0x2100 - 0x21ff      Video Memory Manager (VidMM) subsystem errors
//   0x2200 - 0x22ff      Video GPU Scheduler (VidSch) subsystem errors
//   0x2300 - 0x23ff      Video Display Mode Management (VidDMM) subsystem errors
//
// Display Driver Loader driver & Video Port errors {0x0000..0x0fff}
//
//
// MessageId: ERROR_HUNG_DISPLAY_DRIVER_THREAD
//
// MessageText:
//
// {Display Driver Stopped Responding}
// The %hs display driver has stopped working normally. Save your work and reboot the system to restore full display functionality.
// The next time you reboot the machine a dialog will be displayed giving you a chance to report this failure to Microsoft.
//
#define ERROR_HUNG_DISPLAY_DRIVER_THREAD _HRESULT_TYPEDEF_(0x80260001L)

//
// Desktop Window Manager errors {0x3000..0x3fff}
//
//
// MessageId: DWM_E_COMPOSITIONDISABLED
//
// MessageText:
//
// {Desktop composition is disabled}
// The operation could not be completed because desktop composition is disabled.
//
#define DWM_E_COMPOSITIONDISABLED        _HRESULT_TYPEDEF_(0x80263001L)

//
// MessageId: DWM_E_REMOTING_NOT_SUPPORTED
//
// MessageText:
//
// {Some desktop composition APIs are not supported while remoting}
// The operation is not supported while running in a remote session.
//
#define DWM_E_REMOTING_NOT_SUPPORTED     _HRESULT_TYPEDEF_(0x80263002L)

//
// MessageId: DWM_E_NO_REDIRECTION_SURFACE_AVAILABLE
//
// MessageText:
//
// {No DWM redirection surface is available}
// The DWM was unable to provide a redireciton surface to complete the DirectX present.
//
#define DWM_E_NO_REDIRECTION_SURFACE_AVAILABLE _HRESULT_TYPEDEF_(0x80263003L)

//
// MessageId: DWM_E_NOT_QUEUING_PRESENTS
//
// MessageText:
//
// {DWM is not queuing presents for the specified window}
// The window specified is not currently using queued presents.
//
#define DWM_E_NOT_QUEUING_PRESENTS       _HRESULT_TYPEDEF_(0x80263004L)

//
// Monitor class function driver errors {0x1000..0x1fff}
//
//
// MessageId: ERROR_MONITOR_NO_DESCRIPTOR
//
// MessageText:
//
// Monitor descriptor could not be obtained.
//
#define ERROR_MONITOR_NO_DESCRIPTOR      _HRESULT_TYPEDEF_(0x80261001L)

//
// MessageId: ERROR_MONITOR_UNKNOWN_DESCRIPTOR_FORMAT
//
// MessageText:
//
// Format of the obtained monitor descriptor is not supported by this release.
//
#define ERROR_MONITOR_UNKNOWN_DESCRIPTOR_FORMAT _HRESULT_TYPEDEF_(0x80261002L)

//
// MessageId: ERROR_MONITOR_INVALID_DESCRIPTOR_CHECKSUM
//
// MessageText:
//
// Checksum of the obtained monitor descriptor is invalid.
//
#define ERROR_MONITOR_INVALID_DESCRIPTOR_CHECKSUM _HRESULT_TYPEDEF_(0xC0261003L)

//
// MessageId: ERROR_MONITOR_INVALID_STANDARD_TIMING_BLOCK
//
// MessageText:
//
// Monitor descriptor contains an invalid standard timing block.
//
#define ERROR_MONITOR_INVALID_STANDARD_TIMING_BLOCK _HRESULT_TYPEDEF_(0xC0261004L)

//
// MessageId: ERROR_MONITOR_WMI_DATABLOCK_REGISTRATION_FAILED
//
// MessageText:
//
// WMI data block registration failed for one of the MSMonitorClass WMI subclasses.
//
#define ERROR_MONITOR_WMI_DATABLOCK_REGISTRATION_FAILED _HRESULT_TYPEDEF_(0xC0261005L)

//
// MessageId: ERROR_MONITOR_INVALID_SERIAL_NUMBER_MONDSC_BLOCK
//
// MessageText:
//
// Provided monitor descriptor block is either corrupted or does not contain monitor's detailed serial number.
//
#define ERROR_MONITOR_INVALID_SERIAL_NUMBER_MONDSC_BLOCK _HRESULT_TYPEDEF_(0xC0261006L)

//
// MessageId: ERROR_MONITOR_INVALID_USER_FRIENDLY_MONDSC_BLOCK
//
// MessageText:
//
// Provided monitor descriptor block is either corrupted or does not contain monitor's user friendly name.
//
#define ERROR_MONITOR_INVALID_USER_FRIENDLY_MONDSC_BLOCK _HRESULT_TYPEDEF_(0xC0261007L)

//
// MessageId: ERROR_MONITOR_NO_MORE_DESCRIPTOR_DATA
//
// MessageText:
//
// There is no monitor descriptor data at the specified (offset, size) region.
//
#define ERROR_MONITOR_NO_MORE_DESCRIPTOR_DATA _HRESULT_TYPEDEF_(0xC0261008L)

//
// MessageId: ERROR_MONITOR_INVALID_DETAILED_TIMING_BLOCK
//
// MessageText:
//
// Monitor descriptor contains an invalid detailed timing block.
//
#define ERROR_MONITOR_INVALID_DETAILED_TIMING_BLOCK _HRESULT_TYPEDEF_(0xC0261009L)

//
// Windows Graphics Kernel Subsystem errors {0x2000..0x2fff}
//
// TODO: Add DXG Win32 errors here
//
// Common errors {0x2000..0x20ff}
//
//
// MessageId: ERROR_GRAPHICS_NOT_EXCLUSIVE_MODE_OWNER
//
// MessageText:
//
// Exclusive mode ownership is needed to create unmanaged primary allocation.
//
#define ERROR_GRAPHICS_NOT_EXCLUSIVE_MODE_OWNER _HRESULT_TYPEDEF_(0xC0262000L)

//
// MessageId: ERROR_GRAPHICS_INSUFFICIENT_DMA_BUFFER
//
// MessageText:
//
// The driver needs more DMA buffer space in order to complete the requested operation.
//
#define ERROR_GRAPHICS_INSUFFICIENT_DMA_BUFFER _HRESULT_TYPEDEF_(0xC0262001L)

//
// MessageId: ERROR_GRAPHICS_INVALID_DISPLAY_ADAPTER
//
// MessageText:
//
// Specified display adapter handle is invalid.
//
#define ERROR_GRAPHICS_INVALID_DISPLAY_ADAPTER _HRESULT_TYPEDEF_(0xC0262002L)

//
// MessageId: ERROR_GRAPHICS_ADAPTER_WAS_RESET
//
// MessageText:
//
// Specified display adapter and all of its state has been reset.
//
#define ERROR_GRAPHICS_ADAPTER_WAS_RESET _HRESULT_TYPEDEF_(0xC0262003L)

//
// MessageId: ERROR_GRAPHICS_INVALID_DRIVER_MODEL
//
// MessageText:
//
// The driver stack doesn't match the expected driver model.
//
#define ERROR_GRAPHICS_INVALID_DRIVER_MODEL _HRESULT_TYPEDEF_(0xC0262004L)

//
// MessageId: ERROR_GRAPHICS_PRESENT_MODE_CHANGED
//
// MessageText:
//
// Present happened but ended up into the changed desktop mode
//
#define ERROR_GRAPHICS_PRESENT_MODE_CHANGED _HRESULT_TYPEDEF_(0xC0262005L)

//
// MessageId: ERROR_GRAPHICS_PRESENT_OCCLUDED
//
// MessageText:
//
// Nothing to present due to desktop occlusion
//
#define ERROR_GRAPHICS_PRESENT_OCCLUDED  _HRESULT_TYPEDEF_(0xC0262006L)

//
// MessageId: ERROR_GRAPHICS_PRESENT_DENIED
//
// MessageText:
//
// Not able to present due to denial of desktop access
//
#define ERROR_GRAPHICS_PRESENT_DENIED    _HRESULT_TYPEDEF_(0xC0262007L)

//
// MessageId: ERROR_GRAPHICS_CANNOTCOLORCONVERT
//
// MessageText:
//
// Not able to present with color convertion
//
#define ERROR_GRAPHICS_CANNOTCOLORCONVERT _HRESULT_TYPEDEF_(0xC0262008L)

//
// MessageId: ERROR_GRAPHICS_DRIVER_MISMATCH
//
// MessageText:
//
// The kernel driver detected a version mismatch between it and the user mode driver.
//
#define ERROR_GRAPHICS_DRIVER_MISMATCH   _HRESULT_TYPEDEF_(0xC0262009L)

//
// MessageId: ERROR_GRAPHICS_PARTIAL_DATA_POPULATED
//
// MessageText:
//
// Specified buffer is not big enough to contain entire requested dataset. Partial data populated upto the size of the buffer.
// Caller needs to provide buffer of size as specified in the partially populated buffer's content (interface specific).
//
#define ERROR_GRAPHICS_PARTIAL_DATA_POPULATED _HRESULT_TYPEDEF_(0x4026200AL)

//
// Video Memory Manager (VidMM) subsystem errors {0x2100..0x21ff}
//
//
// MessageId: ERROR_GRAPHICS_NO_VIDEO_MEMORY
//
// MessageText:
//
// Not enough video memory available to complete the operation.
//
#define ERROR_GRAPHICS_NO_VIDEO_MEMORY   _HRESULT_TYPEDEF_(0xC0262100L)

//
// MessageId: ERROR_GRAPHICS_CANT_LOCK_MEMORY
//
// MessageText:
//
// Couldn't probe and lock the underlying memory of an allocation.
//
#define ERROR_GRAPHICS_CANT_LOCK_MEMORY  _HRESULT_TYPEDEF_(0xC0262101L)

//
// MessageId: ERROR_GRAPHICS_ALLOCATION_BUSY
//
// MessageText:
//
// The allocation is currently busy.
//
#define ERROR_GRAPHICS_ALLOCATION_BUSY   _HRESULT_TYPEDEF_(0xC0262102L)

//
// MessageId: ERROR_GRAPHICS_TOO_MANY_REFERENCES
//
// MessageText:
//
// An object being referenced has reach the maximum reference count already and can't be reference further.
//
#define ERROR_GRAPHICS_TOO_MANY_REFERENCES _HRESULT_TYPEDEF_(0xC0262103L)

//
// MessageId: ERROR_GRAPHICS_TRY_AGAIN_LATER
//
// MessageText:
//
// A problem couldn't be solved due to some currently existing condition. The problem should be tried again later.
//
#define ERROR_GRAPHICS_TRY_AGAIN_LATER   _HRESULT_TYPEDEF_(0xC0262104L)

//
// MessageId: ERROR_GRAPHICS_TRY_AGAIN_NOW
//
// MessageText:
//
// A problem couldn't be solved due to some currently existing condition. The problem should be tried again immediately.
//
#define ERROR_GRAPHICS_TRY_AGAIN_NOW     _HRESULT_TYPEDEF_(0xC0262105L)

//
// MessageId: ERROR_GRAPHICS_ALLOCATION_INVALID
//
// MessageText:
//
// The allocation is invalid.
//
#define ERROR_GRAPHICS_ALLOCATION_INVALID _HRESULT_TYPEDEF_(0xC0262106L)

//
// MessageId: ERROR_GRAPHICS_UNSWIZZLING_APERTURE_UNAVAILABLE
//
// MessageText:
//
// No more unswizzling aperture are currently available.
//
#define ERROR_GRAPHICS_UNSWIZZLING_APERTURE_UNAVAILABLE _HRESULT_TYPEDEF_(0xC0262107L)

//
// MessageId: ERROR_GRAPHICS_UNSWIZZLING_APERTURE_UNSUPPORTED
//
// MessageText:
//
// The current allocation can't be unswizzled by an aperture.
//
#define ERROR_GRAPHICS_UNSWIZZLING_APERTURE_UNSUPPORTED _HRESULT_TYPEDEF_(0xC0262108L)

//
// MessageId: ERROR_GRAPHICS_CANT_EVICT_PINNED_ALLOCATION
//
// MessageText:
//
// The request failed because a pinned allocation can't be evicted.
//
#define ERROR_GRAPHICS_CANT_EVICT_PINNED_ALLOCATION _HRESULT_TYPEDEF_(0xC0262109L)

//
// MessageId: ERROR_GRAPHICS_INVALID_ALLOCATION_USAGE
//
// MessageText:
//
// The allocation can't be used from it's current segment location for the specified operation.
//
#define ERROR_GRAPHICS_INVALID_ALLOCATION_USAGE _HRESULT_TYPEDEF_(0xC0262110L)

//
// MessageId: ERROR_GRAPHICS_CANT_RENDER_LOCKED_ALLOCATION
//
// MessageText:
//
// A locked allocation can't be used in the current command buffer.
//
#define ERROR_GRAPHICS_CANT_RENDER_LOCKED_ALLOCATION _HRESULT_TYPEDEF_(0xC0262111L)

//
// MessageId: ERROR_GRAPHICS_ALLOCATION_CLOSED
//
// MessageText:
//
// The allocation being referenced has been closed permanently.
//
#define ERROR_GRAPHICS_ALLOCATION_CLOSED _HRESULT_TYPEDEF_(0xC0262112L)

//
// MessageId: ERROR_GRAPHICS_INVALID_ALLOCATION_INSTANCE
//
// MessageText:
//
// An invalid allocation instance is being referenced.
//
#define ERROR_GRAPHICS_INVALID_ALLOCATION_INSTANCE _HRESULT_TYPEDEF_(0xC0262113L)

//
// MessageId: ERROR_GRAPHICS_INVALID_ALLOCATION_HANDLE
//
// MessageText:
//
// An invalid allocation handle is being referenced.
//
#define ERROR_GRAPHICS_INVALID_ALLOCATION_HANDLE _HRESULT_TYPEDEF_(0xC0262114L)

//
// MessageId: ERROR_GRAPHICS_WRONG_ALLOCATION_DEVICE
//
// MessageText:
//
// The allocation being referenced doesn't belong to the current device.
//
#define ERROR_GRAPHICS_WRONG_ALLOCATION_DEVICE _HRESULT_TYPEDEF_(0xC0262115L)

//
// MessageId: ERROR_GRAPHICS_ALLOCATION_CONTENT_LOST
//
// MessageText:
//
// The specified allocation lost its content.
//
#define ERROR_GRAPHICS_ALLOCATION_CONTENT_LOST _HRESULT_TYPEDEF_(0xC0262116L)

//
// Video GPU Scheduler (VidSch) subsystem errors {0x2200..0x22ff}
//
//
// MessageId: ERROR_GRAPHICS_GPU_EXCEPTION_ON_DEVICE
//
// MessageText:
//
// GPU exception is detected on the given device. The device is not able to be scheduled.
//
#define ERROR_GRAPHICS_GPU_EXCEPTION_ON_DEVICE _HRESULT_TYPEDEF_(0xC0262200L)

//
// Video Present Network Management (VidPNMgr) subsystem errors {0x2300..0x23ff}
//
//
// MessageId: ERROR_GRAPHICS_INVALID_VIDPN_TOPOLOGY
//
// MessageText:
//
// Specified VidPN topology is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDPN_TOPOLOGY _HRESULT_TYPEDEF_(0xC0262300L)

//
// MessageId: ERROR_GRAPHICS_VIDPN_TOPOLOGY_NOT_SUPPORTED
//
// MessageText:
//
// Specified VidPN topology is valid but is not supported by this model of the display adapter.
//
#define ERROR_GRAPHICS_VIDPN_TOPOLOGY_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262301L)

//
// MessageId: ERROR_GRAPHICS_VIDPN_TOPOLOGY_CURRENTLY_NOT_SUPPORTED
//
// MessageText:
//
// Specified VidPN topology is valid but is not supported by the display adapter at this time, due to current allocation of its resources.
//
#define ERROR_GRAPHICS_VIDPN_TOPOLOGY_CURRENTLY_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262302L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDPN
//
// MessageText:
//
// Specified VidPN handle is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDPN     _HRESULT_TYPEDEF_(0xC0262303L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE
//
// MessageText:
//
// Specified video present source is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE _HRESULT_TYPEDEF_(0xC0262304L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET
//
// MessageText:
//
// Specified video present target is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET _HRESULT_TYPEDEF_(0xC0262305L)

//
// MessageId: ERROR_GRAPHICS_VIDPN_MODALITY_NOT_SUPPORTED
//
// MessageText:
//
// Specified VidPN modality is not supported (e.g. at least two of the pinned modes are not cofunctional).
//
#define ERROR_GRAPHICS_VIDPN_MODALITY_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262306L)

//
// MessageId: ERROR_GRAPHICS_MODE_NOT_PINNED
//
// MessageText:
//
// No mode is pinned on the specified VidPN source/target.
//
#define ERROR_GRAPHICS_MODE_NOT_PINNED   _HRESULT_TYPEDEF_(0x00262307L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDPN_SOURCEMODESET
//
// MessageText:
//
// Specified VidPN source mode set is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDPN_SOURCEMODESET _HRESULT_TYPEDEF_(0xC0262308L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDPN_TARGETMODESET
//
// MessageText:
//
// Specified VidPN target mode set is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDPN_TARGETMODESET _HRESULT_TYPEDEF_(0xC0262309L)

//
// MessageId: ERROR_GRAPHICS_INVALID_FREQUENCY
//
// MessageText:
//
// Specified video signal frequency is invalid.
//
#define ERROR_GRAPHICS_INVALID_FREQUENCY _HRESULT_TYPEDEF_(0xC026230AL)

//
// MessageId: ERROR_GRAPHICS_INVALID_ACTIVE_REGION
//
// MessageText:
//
// Specified video signal active region is invalid.
//
#define ERROR_GRAPHICS_INVALID_ACTIVE_REGION _HRESULT_TYPEDEF_(0xC026230BL)

//
// MessageId: ERROR_GRAPHICS_INVALID_TOTAL_REGION
//
// MessageText:
//
// Specified video signal total region is invalid.
//
#define ERROR_GRAPHICS_INVALID_TOTAL_REGION _HRESULT_TYPEDEF_(0xC026230CL)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE_MODE
//
// MessageText:
//
// Specified video present source mode is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE_MODE _HRESULT_TYPEDEF_(0xC0262310L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET_MODE
//
// MessageText:
//
// Specified video present target mode is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET_MODE _HRESULT_TYPEDEF_(0xC0262311L)

//
// MessageId: ERROR_GRAPHICS_PINNED_MODE_MUST_REMAIN_IN_SET
//
// MessageText:
//
// Pinned mode must remain in the set on VidPN's cofunctional modality enumeration.
//
#define ERROR_GRAPHICS_PINNED_MODE_MUST_REMAIN_IN_SET _HRESULT_TYPEDEF_(0xC0262312L)

//
// MessageId: ERROR_GRAPHICS_PATH_ALREADY_IN_TOPOLOGY
//
// MessageText:
//
// Specified video present path is already in VidPN's topology.
//
#define ERROR_GRAPHICS_PATH_ALREADY_IN_TOPOLOGY _HRESULT_TYPEDEF_(0xC0262313L)

//
// MessageId: ERROR_GRAPHICS_MODE_ALREADY_IN_MODESET
//
// MessageText:
//
// Specified mode is already in the mode set.
//
#define ERROR_GRAPHICS_MODE_ALREADY_IN_MODESET _HRESULT_TYPEDEF_(0xC0262314L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDEOPRESENTSOURCESET
//
// MessageText:
//
// Specified video present source set is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDEOPRESENTSOURCESET _HRESULT_TYPEDEF_(0xC0262315L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDEOPRESENTTARGETSET
//
// MessageText:
//
// Specified video present target set is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDEOPRESENTTARGETSET _HRESULT_TYPEDEF_(0xC0262316L)

//
// MessageId: ERROR_GRAPHICS_SOURCE_ALREADY_IN_SET
//
// MessageText:
//
// Specified video present source is already in the video present source set.
//
#define ERROR_GRAPHICS_SOURCE_ALREADY_IN_SET _HRESULT_TYPEDEF_(0xC0262317L)

//
// MessageId: ERROR_GRAPHICS_TARGET_ALREADY_IN_SET
//
// MessageText:
//
// Specified video present target is already in the video present target set.
//
#define ERROR_GRAPHICS_TARGET_ALREADY_IN_SET _HRESULT_TYPEDEF_(0xC0262318L)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDPN_PRESENT_PATH
//
// MessageText:
//
// Specified VidPN present path is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDPN_PRESENT_PATH _HRESULT_TYPEDEF_(0xC0262319L)

//
// MessageId: ERROR_GRAPHICS_NO_RECOMMENDED_VIDPN_TOPOLOGY
//
// MessageText:
//
// Miniport has no recommendation for augmentation of the specified VidPN's topology.
//
#define ERROR_GRAPHICS_NO_RECOMMENDED_VIDPN_TOPOLOGY _HRESULT_TYPEDEF_(0xC026231AL)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGESET
//
// MessageText:
//
// Specified monitor frequency range set is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGESET _HRESULT_TYPEDEF_(0xC026231BL)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE
//
// MessageText:
//
// Specified monitor frequency range is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE _HRESULT_TYPEDEF_(0xC026231CL)

//
// MessageId: ERROR_GRAPHICS_FREQUENCYRANGE_NOT_IN_SET
//
// MessageText:
//
// Specified frequency range is not in the specified monitor frequency range set.
//
#define ERROR_GRAPHICS_FREQUENCYRANGE_NOT_IN_SET _HRESULT_TYPEDEF_(0xC026231DL)

//
// MessageId: ERROR_GRAPHICS_NO_PREFERRED_MODE
//
// MessageText:
//
// Specified mode set does not specify preference for one of its modes.
//
#define ERROR_GRAPHICS_NO_PREFERRED_MODE _HRESULT_TYPEDEF_(0x0026231EL)

//
// MessageId: ERROR_GRAPHICS_FREQUENCYRANGE_ALREADY_IN_SET
//
// MessageText:
//
// Specified frequency range is already in the specified monitor frequency range set.
//
#define ERROR_GRAPHICS_FREQUENCYRANGE_ALREADY_IN_SET _HRESULT_TYPEDEF_(0xC026231FL)

//
// MessageId: ERROR_GRAPHICS_STALE_MODESET
//
// MessageText:
//
// Specified mode set is stale. Please reacquire the new mode set.
//
#define ERROR_GRAPHICS_STALE_MODESET     _HRESULT_TYPEDEF_(0xC0262320L)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITOR_SOURCEMODESET
//
// MessageText:
//
// Specified monitor source mode set is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITOR_SOURCEMODESET _HRESULT_TYPEDEF_(0xC0262321L)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITOR_SOURCE_MODE
//
// MessageText:
//
// Specified monitor source mode is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITOR_SOURCE_MODE _HRESULT_TYPEDEF_(0xC0262322L)

//
// MessageId: ERROR_GRAPHICS_NO_RECOMMENDED_FUNCTIONAL_VIDPN
//
// MessageText:
//
// Miniport does not have any recommendation regarding the request to provide a functional VidPN given the current display adapter configuration.
//
#define ERROR_GRAPHICS_NO_RECOMMENDED_FUNCTIONAL_VIDPN _HRESULT_TYPEDEF_(0xC0262323L)

//
// MessageId: ERROR_GRAPHICS_MODE_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified mode is already used by another mode in the set.
//
#define ERROR_GRAPHICS_MODE_ID_MUST_BE_UNIQUE _HRESULT_TYPEDEF_(0xC0262324L)

//
// MessageId: ERROR_GRAPHICS_EMPTY_ADAPTER_MONITOR_MODE_SUPPORT_INTERSECTION
//
// MessageText:
//
// System failed to determine a mode that is supported by both the display adapter and the monitor connected to it.
//
#define ERROR_GRAPHICS_EMPTY_ADAPTER_MONITOR_MODE_SUPPORT_INTERSECTION _HRESULT_TYPEDEF_(0xC0262325L)

//
// MessageId: ERROR_GRAPHICS_VIDEO_PRESENT_TARGETS_LESS_THAN_SOURCES
//
// MessageText:
//
// Number of video present targets must be greater than or equal to the number of video present sources.
//
#define ERROR_GRAPHICS_VIDEO_PRESENT_TARGETS_LESS_THAN_SOURCES _HRESULT_TYPEDEF_(0xC0262326L)

//
// MessageId: ERROR_GRAPHICS_PATH_NOT_IN_TOPOLOGY
//
// MessageText:
//
// Specified present path is not in VidPN's topology.
//
#define ERROR_GRAPHICS_PATH_NOT_IN_TOPOLOGY _HRESULT_TYPEDEF_(0xC0262327L)

//
// MessageId: ERROR_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_SOURCE
//
// MessageText:
//
// Display adapter must have at least one video present source.
//
#define ERROR_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_SOURCE _HRESULT_TYPEDEF_(0xC0262328L)

//
// MessageId: ERROR_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_TARGET
//
// MessageText:
//
// Display adapter must have at least one video present target.
//
#define ERROR_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_TARGET _HRESULT_TYPEDEF_(0xC0262329L)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITORDESCRIPTORSET
//
// MessageText:
//
// Specified monitor descriptor set is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITORDESCRIPTORSET _HRESULT_TYPEDEF_(0xC026232AL)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITORDESCRIPTOR
//
// MessageText:
//
// Specified monitor descriptor is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITORDESCRIPTOR _HRESULT_TYPEDEF_(0xC026232BL)

//
// MessageId: ERROR_GRAPHICS_MONITORDESCRIPTOR_NOT_IN_SET
//
// MessageText:
//
// Specified descriptor is not in the specified monitor descriptor set.
//
#define ERROR_GRAPHICS_MONITORDESCRIPTOR_NOT_IN_SET _HRESULT_TYPEDEF_(0xC026232CL)

//
// MessageId: ERROR_GRAPHICS_MONITORDESCRIPTOR_ALREADY_IN_SET
//
// MessageText:
//
// Specified descriptor is already in the specified monitor descriptor set.
//
#define ERROR_GRAPHICS_MONITORDESCRIPTOR_ALREADY_IN_SET _HRESULT_TYPEDEF_(0xC026232DL)

//
// MessageId: ERROR_GRAPHICS_MONITORDESCRIPTOR_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified monitor descriptor is already used by another descriptor in the set.
//
#define ERROR_GRAPHICS_MONITORDESCRIPTOR_ID_MUST_BE_UNIQUE _HRESULT_TYPEDEF_(0xC026232EL)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDPN_TARGET_SUBSET_TYPE
//
// MessageText:
//
// Specified video present target subset type is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDPN_TARGET_SUBSET_TYPE _HRESULT_TYPEDEF_(0xC026232FL)

//
// MessageId: ERROR_GRAPHICS_RESOURCES_NOT_RELATED
//
// MessageText:
//
// Two or more of the specified resources are not related to each other, as defined by the interface semantics.
//
#define ERROR_GRAPHICS_RESOURCES_NOT_RELATED _HRESULT_TYPEDEF_(0xC0262330L)

//
// MessageId: ERROR_GRAPHICS_SOURCE_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified video present source is already used by another source in the set.
//
#define ERROR_GRAPHICS_SOURCE_ID_MUST_BE_UNIQUE _HRESULT_TYPEDEF_(0xC0262331L)

//
// MessageId: ERROR_GRAPHICS_TARGET_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified video present target is already used by another target in the set.
//
#define ERROR_GRAPHICS_TARGET_ID_MUST_BE_UNIQUE _HRESULT_TYPEDEF_(0xC0262332L)

//
// MessageId: ERROR_GRAPHICS_NO_AVAILABLE_VIDPN_TARGET
//
// MessageText:
//
// Specified VidPN source cannot be used because there is no available VidPN target to connect it to.
//
#define ERROR_GRAPHICS_NO_AVAILABLE_VIDPN_TARGET _HRESULT_TYPEDEF_(0xC0262333L)

//
// MessageId: ERROR_GRAPHICS_MONITOR_COULD_NOT_BE_ASSOCIATED_WITH_ADAPTER
//
// MessageText:
//
// Newly arrived monitor could not be associated with a display adapter.
//
#define ERROR_GRAPHICS_MONITOR_COULD_NOT_BE_ASSOCIATED_WITH_ADAPTER _HRESULT_TYPEDEF_(0xC0262334L)

//
// MessageId: ERROR_GRAPHICS_NO_VIDPNMGR
//
// MessageText:
//
// Display adapter in question does not have an associated VidPN manager.
//
#define ERROR_GRAPHICS_NO_VIDPNMGR       _HRESULT_TYPEDEF_(0xC0262335L)

//
// MessageId: ERROR_GRAPHICS_NO_ACTIVE_VIDPN
//
// MessageText:
//
// VidPN manager of the display adapter in question does not have an active VidPN.
//
#define ERROR_GRAPHICS_NO_ACTIVE_VIDPN   _HRESULT_TYPEDEF_(0xC0262336L)

//
// MessageId: ERROR_GRAPHICS_STALE_VIDPN_TOPOLOGY
//
// MessageText:
//
// Specified VidPN topology is stale. Please reacquire the new topology.
//
#define ERROR_GRAPHICS_STALE_VIDPN_TOPOLOGY _HRESULT_TYPEDEF_(0xC0262337L)

//
// MessageId: ERROR_GRAPHICS_MONITOR_NOT_CONNECTED
//
// MessageText:
//
// There is no monitor connected on the specified video present target.
//
#define ERROR_GRAPHICS_MONITOR_NOT_CONNECTED _HRESULT_TYPEDEF_(0xC0262338L)

//
// MessageId: ERROR_GRAPHICS_SOURCE_NOT_IN_TOPOLOGY
//
// MessageText:
//
// Specified source is not part of the specified VidPN's topology.
//
#define ERROR_GRAPHICS_SOURCE_NOT_IN_TOPOLOGY _HRESULT_TYPEDEF_(0xC0262339L)

//
// MessageId: ERROR_GRAPHICS_INVALID_PRIMARYSURFACE_SIZE
//
// MessageText:
//
// Specified primary surface size is invalid.
//
#define ERROR_GRAPHICS_INVALID_PRIMARYSURFACE_SIZE _HRESULT_TYPEDEF_(0xC026233AL)

//
// MessageId: ERROR_GRAPHICS_INVALID_VISIBLEREGION_SIZE
//
// MessageText:
//
// Specified visible region size is invalid.
//
#define ERROR_GRAPHICS_INVALID_VISIBLEREGION_SIZE _HRESULT_TYPEDEF_(0xC026233BL)

//
// MessageId: ERROR_GRAPHICS_INVALID_STRIDE
//
// MessageText:
//
// Specified stride is invalid.
//
#define ERROR_GRAPHICS_INVALID_STRIDE    _HRESULT_TYPEDEF_(0xC026233CL)

//
// MessageId: ERROR_GRAPHICS_INVALID_PIXELFORMAT
//
// MessageText:
//
// Specified pixel format is invalid.
//
#define ERROR_GRAPHICS_INVALID_PIXELFORMAT _HRESULT_TYPEDEF_(0xC026233DL)

//
// MessageId: ERROR_GRAPHICS_INVALID_COLORBASIS
//
// MessageText:
//
// Specified color basis is invalid.
//
#define ERROR_GRAPHICS_INVALID_COLORBASIS _HRESULT_TYPEDEF_(0xC026233EL)

//
// MessageId: ERROR_GRAPHICS_INVALID_PIXELVALUEACCESSMODE
//
// MessageText:
//
// Specified pixel value access mode is invalid.
//
#define ERROR_GRAPHICS_INVALID_PIXELVALUEACCESSMODE _HRESULT_TYPEDEF_(0xC026233FL)

//
// MessageId: ERROR_GRAPHICS_TARGET_NOT_IN_TOPOLOGY
//
// MessageText:
//
// Specified target is not part of the specified VidPN's topology.
//
#define ERROR_GRAPHICS_TARGET_NOT_IN_TOPOLOGY _HRESULT_TYPEDEF_(0xC0262340L)

//
// MessageId: ERROR_GRAPHICS_NO_DISPLAY_MODE_MANAGEMENT_SUPPORT
//
// MessageText:
//
// Failed to acquire display mode management interface.
//
#define ERROR_GRAPHICS_NO_DISPLAY_MODE_MANAGEMENT_SUPPORT _HRESULT_TYPEDEF_(0xC0262341L)

//
// MessageId: ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE
//
// MessageText:
//
// Specified VidPN source is already owned by a DMM client and cannot be used until that client releases it.
//
#define ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE _HRESULT_TYPEDEF_(0xC0262342L)

//
// MessageId: ERROR_GRAPHICS_CANT_ACCESS_ACTIVE_VIDPN
//
// MessageText:
//
// Specified VidPN is active and cannot be accessed.
//
#define ERROR_GRAPHICS_CANT_ACCESS_ACTIVE_VIDPN _HRESULT_TYPEDEF_(0xC0262343L)

//
// MessageId: ERROR_GRAPHICS_INVALID_PATH_IMPORTANCE_ORDINAL
//
// MessageText:
//
// Specified VidPN present path importance ordinal is invalid.
//
#define ERROR_GRAPHICS_INVALID_PATH_IMPORTANCE_ORDINAL _HRESULT_TYPEDEF_(0xC0262344L)

//
// MessageId: ERROR_GRAPHICS_INVALID_PATH_CONTENT_GEOMETRY_TRANSFORMATION
//
// MessageText:
//
// Specified VidPN present path content geometry transformation is invalid.
//
#define ERROR_GRAPHICS_INVALID_PATH_CONTENT_GEOMETRY_TRANSFORMATION _HRESULT_TYPEDEF_(0xC0262345L)

//
// MessageId: ERROR_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_SUPPORTED
//
// MessageText:
//
// Specified content geometry transformation is not supported on the respective VidPN present path.
//
#define ERROR_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262346L)

//
// MessageId: ERROR_GRAPHICS_INVALID_GAMMA_RAMP
//
// MessageText:
//
// Specified gamma ramp is invalid.
//
#define ERROR_GRAPHICS_INVALID_GAMMA_RAMP _HRESULT_TYPEDEF_(0xC0262347L)

//
// MessageId: ERROR_GRAPHICS_GAMMA_RAMP_NOT_SUPPORTED
//
// MessageText:
//
// Specified gamma ramp is not supported on the respective VidPN present path.
//
#define ERROR_GRAPHICS_GAMMA_RAMP_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262348L)

//
// MessageId: ERROR_GRAPHICS_MULTISAMPLING_NOT_SUPPORTED
//
// MessageText:
//
// Multi-sampling is not supported on the respective VidPN present path.
//
#define ERROR_GRAPHICS_MULTISAMPLING_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262349L)

//
// MessageId: ERROR_GRAPHICS_MODE_NOT_IN_MODESET
//
// MessageText:
//
// Specified mode is not in the specified mode set.
//
#define ERROR_GRAPHICS_MODE_NOT_IN_MODESET _HRESULT_TYPEDEF_(0xC026234AL)

//
// MessageId: ERROR_GRAPHICS_DATASET_IS_EMPTY
//
// MessageText:
//
// Specified data set (e.g. mode set, frequency range set, descriptor set, topology, etc.) is empty.
//
#define ERROR_GRAPHICS_DATASET_IS_EMPTY  _HRESULT_TYPEDEF_(0x0026234BL)

//
// MessageId: ERROR_GRAPHICS_NO_MORE_ELEMENTS_IN_DATASET
//
// MessageText:
//
// Specified data set (e.g. mode set, frequency range set, descriptor set, topology, etc.) does not contain any more elements.
//
#define ERROR_GRAPHICS_NO_MORE_ELEMENTS_IN_DATASET _HRESULT_TYPEDEF_(0x0026234CL)

//
// MessageId: ERROR_GRAPHICS_INVALID_VIDPN_TOPOLOGY_RECOMMENDATION_REASON
//
// MessageText:
//
// Specified VidPN topology recommendation reason is invalid.
//
#define ERROR_GRAPHICS_INVALID_VIDPN_TOPOLOGY_RECOMMENDATION_REASON _HRESULT_TYPEDEF_(0xC026234DL)

//
// MessageId: ERROR_GRAPHICS_INVALID_PATH_CONTENT_TYPE
//
// MessageText:
//
// Specified VidPN present path content type is invalid.
//
#define ERROR_GRAPHICS_INVALID_PATH_CONTENT_TYPE _HRESULT_TYPEDEF_(0xC026234EL)

//
// MessageId: ERROR_GRAPHICS_INVALID_COPYPROTECTION_TYPE
//
// MessageText:
//
// Specified VidPN present path copy protection type is invalid.
//
#define ERROR_GRAPHICS_INVALID_COPYPROTECTION_TYPE _HRESULT_TYPEDEF_(0xC026234FL)

//
// MessageId: ERROR_GRAPHICS_UNASSIGNED_MODESET_ALREADY_EXISTS
//
// MessageText:
//
// No more than one unassigned mode set can exist at any given time for a given VidPN source/target.
//
#define ERROR_GRAPHICS_UNASSIGNED_MODESET_ALREADY_EXISTS _HRESULT_TYPEDEF_(0xC0262350L)

//
// MessageId: ERROR_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_PINNED
//
// MessageText:
//
// Specified content transformation is not pinned on the specified VidPN present path.
//
#define ERROR_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_PINNED _HRESULT_TYPEDEF_(0x00262351L)

//
// MessageId: ERROR_GRAPHICS_INVALID_SCANLINE_ORDERING
//
// MessageText:
//
// Specified scanline ordering type is invalid.
//
#define ERROR_GRAPHICS_INVALID_SCANLINE_ORDERING _HRESULT_TYPEDEF_(0xC0262352L)

//
// MessageId: ERROR_GRAPHICS_TOPOLOGY_CHANGES_NOT_ALLOWED
//
// MessageText:
//
// Topology changes are not allowed for the specified VidPN.
//
#define ERROR_GRAPHICS_TOPOLOGY_CHANGES_NOT_ALLOWED _HRESULT_TYPEDEF_(0xC0262353L)

//
// MessageId: ERROR_GRAPHICS_NO_AVAILABLE_IMPORTANCE_ORDINALS
//
// MessageText:
//
// All available importance ordinals are already used in specified topology.
//
#define ERROR_GRAPHICS_NO_AVAILABLE_IMPORTANCE_ORDINALS _HRESULT_TYPEDEF_(0xC0262354L)

//
// MessageId: ERROR_GRAPHICS_INCOMPATIBLE_PRIVATE_FORMAT
//
// MessageText:
//
// Specified primary surface has a different private format attribute than the current primary surface
//
#define ERROR_GRAPHICS_INCOMPATIBLE_PRIVATE_FORMAT _HRESULT_TYPEDEF_(0xC0262355L)

//
// MessageId: ERROR_GRAPHICS_INVALID_MODE_PRUNING_ALGORITHM
//
// MessageText:
//
// Specified mode pruning algorithm is invalid
//
#define ERROR_GRAPHICS_INVALID_MODE_PRUNING_ALGORITHM _HRESULT_TYPEDEF_(0xC0262356L)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITOR_CAPABILITY_ORIGIN
//
// MessageText:
//
// Specified monitor capability origin is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITOR_CAPABILITY_ORIGIN _HRESULT_TYPEDEF_(0xC0262357L)

//
// MessageId: ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE_CONSTRAINT
//
// MessageText:
//
// Specified monitor frequency range constraint is invalid.
//
#define ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE_CONSTRAINT _HRESULT_TYPEDEF_(0xC0262358L)

//
// MessageId: ERROR_GRAPHICS_MAX_NUM_PATHS_REACHED
//
// MessageText:
//
// Maximum supported number of present paths has been reached.
//
#define ERROR_GRAPHICS_MAX_NUM_PATHS_REACHED _HRESULT_TYPEDEF_(0xC0262359L)

//
// MessageId: ERROR_GRAPHICS_CANCEL_VIDPN_TOPOLOGY_AUGMENTATION
//
// MessageText:
//
// Miniport requested that augmentation be cancelled for the specified source of the specified VidPN's topology.
//
#define ERROR_GRAPHICS_CANCEL_VIDPN_TOPOLOGY_AUGMENTATION _HRESULT_TYPEDEF_(0xC026235AL)

//
// MessageId: ERROR_GRAPHICS_INVALID_CLIENT_TYPE
//
// MessageText:
//
// Specified client type was not recognized.
//
#define ERROR_GRAPHICS_INVALID_CLIENT_TYPE _HRESULT_TYPEDEF_(0xC026235BL)

//
// MessageId: ERROR_GRAPHICS_CLIENTVIDPN_NOT_SET
//
// MessageText:
//
// Client VidPN is not set on this adapter (e.g. no user mode initiated mode changes took place on this adapter yet).
//
#define ERROR_GRAPHICS_CLIENTVIDPN_NOT_SET _HRESULT_TYPEDEF_(0xC026235CL)

//
//   Port specific status codes {0x2400..0x24ff}
//
//
// MessageId: ERROR_GRAPHICS_SPECIFIED_CHILD_ALREADY_CONNECTED
//
// MessageText:
//
// Specified display adapter child device already has an external device connected to it.
//
#define ERROR_GRAPHICS_SPECIFIED_CHILD_ALREADY_CONNECTED _HRESULT_TYPEDEF_(0xC0262400L)    

//
// MessageId: ERROR_GRAPHICS_CHILD_DESCRIPTOR_NOT_SUPPORTED
//
// MessageText:
//
// Specified display adapter child device does not support descriptor exposure.
//
#define ERROR_GRAPHICS_CHILD_DESCRIPTOR_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262401L)    

//
// MessageId: ERROR_GRAPHICS_UNKNOWN_CHILD_STATUS
//
// MessageText:
//
// Child device presence was not reliably detected.
//
#define ERROR_GRAPHICS_UNKNOWN_CHILD_STATUS _HRESULT_TYPEDEF_(0x4026242FL)

//
// MessageId: ERROR_GRAPHICS_NOT_A_LINKED_ADAPTER
//
// MessageText:
//
// The display adapter is not linked to any other adapters.
//
#define ERROR_GRAPHICS_NOT_A_LINKED_ADAPTER _HRESULT_TYPEDEF_(0xC0262430L)

//
// MessageId: ERROR_GRAPHICS_LEADLINK_NOT_ENUMERATED
//
// MessageText:
//
// Lead adapter in a linked configuration was not enumerated yet.
//
#define ERROR_GRAPHICS_LEADLINK_NOT_ENUMERATED _HRESULT_TYPEDEF_(0xC0262431L)

//
// MessageId: ERROR_GRAPHICS_CHAINLINKS_NOT_ENUMERATED
//
// MessageText:
//
// Some chain adapters in a linked configuration were not enumerated yet.
//
#define ERROR_GRAPHICS_CHAINLINKS_NOT_ENUMERATED _HRESULT_TYPEDEF_(0xC0262432L)

//
// MessageId: ERROR_GRAPHICS_ADAPTER_CHAIN_NOT_READY
//
// MessageText:
//
// The chain of linked adapters is not ready to start because of an unknown failure.
//
#define ERROR_GRAPHICS_ADAPTER_CHAIN_NOT_READY _HRESULT_TYPEDEF_(0xC0262433L)

//
// MessageId: ERROR_GRAPHICS_CHAINLINKS_NOT_STARTED
//
// MessageText:
//
// An attempt was made to start a lead link display adapter when the chain links were not started yet.
//
#define ERROR_GRAPHICS_CHAINLINKS_NOT_STARTED _HRESULT_TYPEDEF_(0xC0262434L)

//
// MessageId: ERROR_GRAPHICS_CHAINLINKS_NOT_POWERED_ON
//
// MessageText:
//
// An attempt was made to power up a lead link display adapter when the chain links were powered down.
//
#define ERROR_GRAPHICS_CHAINLINKS_NOT_POWERED_ON _HRESULT_TYPEDEF_(0xC0262435L)

//
// MessageId: ERROR_GRAPHICS_INCONSISTENT_DEVICE_LINK_STATE
//
// MessageText:
//
// The adapter link was found to be in an inconsistent state. Not all adapters are in an expected PNP/Power state.
//
#define ERROR_GRAPHICS_INCONSISTENT_DEVICE_LINK_STATE _HRESULT_TYPEDEF_(0xC0262436L)

//
// MessageId: ERROR_GRAPHICS_LEADLINK_START_DEFERRED
//
// MessageText:
//
// Starting the leadlink adapter has been deferred temporarily.
//
#define ERROR_GRAPHICS_LEADLINK_START_DEFERRED _HRESULT_TYPEDEF_(0x40262437L)

//
// MessageId: ERROR_GRAPHICS_NOT_POST_DEVICE_DRIVER
//
// MessageText:
//
// The driver trying to start is not the same as the driver for the POSTed display adapter.
//
#define ERROR_GRAPHICS_NOT_POST_DEVICE_DRIVER _HRESULT_TYPEDEF_(0xC0262438L)

//
// MessageId: ERROR_GRAPHICS_POLLING_TOO_FREQUENTLY
//
// MessageText:
//
// The display adapter is being polled for children too frequently at the same polling level.
//
#define ERROR_GRAPHICS_POLLING_TOO_FREQUENTLY _HRESULT_TYPEDEF_(0x40262439L)

//
// MessageId: ERROR_GRAPHICS_START_DEFERRED
//
// MessageText:
//
// Starting the adapter has been deferred temporarily.
//
#define ERROR_GRAPHICS_START_DEFERRED    _HRESULT_TYPEDEF_(0x4026243AL)

//
// MessageId: ERROR_GRAPHICS_ADAPTER_ACCESS_NOT_EXCLUDED
//
// MessageText:
//
// An operation is being attempted that requires the display adapter to be in a quiescent state.
//
#define ERROR_GRAPHICS_ADAPTER_ACCESS_NOT_EXCLUDED _HRESULT_TYPEDEF_(0xC026243BL)

//
//   OPM, UAB and PVP specific error codes {0x2500..0x257f}
//
//
// MessageId: ERROR_GRAPHICS_OPM_NOT_SUPPORTED
//
// MessageText:
//
// The driver does not support OPM.
//
#define ERROR_GRAPHICS_OPM_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262500L)    

//
// MessageId: ERROR_GRAPHICS_COPP_NOT_SUPPORTED
//
// MessageText:
//
// The driver does not support COPP.
//
#define ERROR_GRAPHICS_COPP_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262501L)    

//
// MessageId: ERROR_GRAPHICS_UAB_NOT_SUPPORTED
//
// MessageText:
//
// The driver does not support UAB.
//
#define ERROR_GRAPHICS_UAB_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262502L)    

//
// MessageId: ERROR_GRAPHICS_OPM_INVALID_ENCRYPTED_PARAMETERS
//
// MessageText:
//
// The specified encrypted parameters are invalid.
//
#define ERROR_GRAPHICS_OPM_INVALID_ENCRYPTED_PARAMETERS _HRESULT_TYPEDEF_(0xC0262503L)    

//
// MessageId: ERROR_GRAPHICS_OPM_NO_VIDEO_OUTPUTS_EXIST
//
// MessageText:
//
// The GDI display device passed to this function does not have any active video outputs.
//
#define ERROR_GRAPHICS_OPM_NO_VIDEO_OUTPUTS_EXIST _HRESULT_TYPEDEF_(0xC0262505L)

//
// MessageId: ERROR_GRAPHICS_OPM_INTERNAL_ERROR
//
// MessageText:
//
// An internal error caused this operation to fail.
//
#define ERROR_GRAPHICS_OPM_INTERNAL_ERROR _HRESULT_TYPEDEF_(0xC026250BL)

//
// MessageId: ERROR_GRAPHICS_OPM_INVALID_HANDLE
//
// MessageText:
//
// The function failed because the caller passed in an invalid OPM user mode handle.
//
#define ERROR_GRAPHICS_OPM_INVALID_HANDLE _HRESULT_TYPEDEF_(0xC026250CL)

//
// MessageId: ERROR_GRAPHICS_PVP_INVALID_CERTIFICATE_LENGTH
//
// MessageText:
//
// A certificate could not be returned because the certificate buffer passed to the function was too small.
//
#define ERROR_GRAPHICS_PVP_INVALID_CERTIFICATE_LENGTH _HRESULT_TYPEDEF_(0xC026250EL)

//
// MessageId: ERROR_GRAPHICS_OPM_SPANNING_MODE_ENABLED
//
// MessageText:
//
// A video output could not be created because the frame buffer is in spanning mode.
//
#define ERROR_GRAPHICS_OPM_SPANNING_MODE_ENABLED _HRESULT_TYPEDEF_(0xC026250FL)

//
// MessageId: ERROR_GRAPHICS_OPM_THEATER_MODE_ENABLED
//
// MessageText:
//
// A video output could not be created because the frame buffer is in theater mode.
//
#define ERROR_GRAPHICS_OPM_THEATER_MODE_ENABLED _HRESULT_TYPEDEF_(0xC0262510L)

//
// MessageId: ERROR_GRAPHICS_PVP_HFS_FAILED
//
// MessageText:
//
// The function failed because the display adapter's Hardware Functionality Scan failed to validate the graphics hardware.  
//
#define ERROR_GRAPHICS_PVP_HFS_FAILED    _HRESULT_TYPEDEF_(0xC0262511L)

//
// MessageId: ERROR_GRAPHICS_OPM_INVALID_SRM
//
// MessageText:
//
// The HDCP System Renewability Message passed to this function did not comply with section 5 of the HDCP 1.1 specification.
//
#define ERROR_GRAPHICS_OPM_INVALID_SRM   _HRESULT_TYPEDEF_(0xC0262512L)

//
// MessageId: ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_HDCP
//
// MessageText:
//
// The video output cannot enable the High-bandwidth Digital Content Protection (HDCP) System because it does not support HDCP.
//
#define ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_HDCP _HRESULT_TYPEDEF_(0xC0262513L)

//
// MessageId: ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_ACP
//
// MessageText:
//
// The video output cannot enable Analogue Copy Protection (ACP) because it does not support ACP.
//
#define ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_ACP _HRESULT_TYPEDEF_(0xC0262514L)

//
// MessageId: ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_CGMSA
//
// MessageText:
//
// The video output cannot enable the Content Generation Management System Analogue (CGMS-A) protection technology because it does not support CGMS-A.
//
#define ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_CGMSA _HRESULT_TYPEDEF_(0xC0262515L)

//
// MessageId: ERROR_GRAPHICS_OPM_HDCP_SRM_NEVER_SET
//
// MessageText:
//
// The IOPMVideoOutput::GetInformation method cannot return the version of the SRM being used because the application never successfully passed an SRM to the video output.
//
#define ERROR_GRAPHICS_OPM_HDCP_SRM_NEVER_SET _HRESULT_TYPEDEF_(0xC0262516L)

//
// MessageId: ERROR_GRAPHICS_OPM_RESOLUTION_TOO_HIGH
//
// MessageText:
//
// The IOPMVideoOutput::Configure method cannot enable the specified output protection technology because the output's screen resolution is too high.
//
#define ERROR_GRAPHICS_OPM_RESOLUTION_TOO_HIGH _HRESULT_TYPEDEF_(0xC0262517L)

//
// MessageId: ERROR_GRAPHICS_OPM_ALL_HDCP_HARDWARE_ALREADY_IN_USE
//
// MessageText:
//
// The IOPMVideoOutput::Configure method cannot enable HDCP because the display adapter's HDCP hardware is already being used by other physical outputs.
//
#define ERROR_GRAPHICS_OPM_ALL_HDCP_HARDWARE_ALREADY_IN_USE _HRESULT_TYPEDEF_(0xC0262518L)

//
// MessageId: ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_NO_LONGER_EXISTS
//
// MessageText:
//
// The operating system asynchronously destroyed this OPM video output because the operating system's state changed. This error typically occurs because the monitor PDO associated with this video output was removed, the monitor PDO associated with this video output was stopped, the video output's session became a non-console session or the video output's desktop became an inactive desktop.
//
#define ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_NO_LONGER_EXISTS _HRESULT_TYPEDEF_(0xC026251AL)

//
// MessageId: ERROR_GRAPHICS_OPM_SESSION_TYPE_CHANGE_IN_PROGRESS
//
// MessageText:
//
// The method failed because the session is changing its type. No IOPMVideoOutput methods can be called when a session is changing its type. There are currently three types of sessions: console, disconnected and remote (RDP or ICA).
//
#define ERROR_GRAPHICS_OPM_SESSION_TYPE_CHANGE_IN_PROGRESS _HRESULT_TYPEDEF_(0xC026251BL)

//
// MessageId: ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_DOES_NOT_HAVE_COPP_SEMANTICS
//
// MessageText:
//
// Either the IOPMVideoOutput::COPPCompatibleGetInformation, IOPMVideoOutput::GetInformation, or IOPMVideoOutput::Configure method failed.  This error is only returned if a video output has OPM semantics.  IOPMVideoOutput::COPPCompatibleGetInformation always returns this error if a video output has OPM semantics.  IOPMVideoOutput::GetInformation returns this error code if the caller requested COPP specific information.  IOPMVideoOutput::Configure returns this error when the caller tries to use a COPP specific command.  
//
#define ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_DOES_NOT_HAVE_COPP_SEMANTICS _HRESULT_TYPEDEF_(0xC026251CL)

//
// MessageId: ERROR_GRAPHICS_OPM_INVALID_INFORMATION_REQUEST
//
// MessageText:
//
// The IOPMVideoOutput::GetInformation and IOPMVideoOutput::COPPCompatibleGetInformation methods return this error if the passed in sequence number is not the expected sequence number or the passed in OMAC value is invalid.
//
#define ERROR_GRAPHICS_OPM_INVALID_INFORMATION_REQUEST _HRESULT_TYPEDEF_(0xC026251DL)

//
// MessageId: ERROR_GRAPHICS_OPM_DRIVER_INTERNAL_ERROR
//
// MessageText:
//
// The method failed because an unexpected error occurred inside of a display driver.
//
#define ERROR_GRAPHICS_OPM_DRIVER_INTERNAL_ERROR _HRESULT_TYPEDEF_(0xC026251EL)

//
// MessageId: ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_DOES_NOT_HAVE_OPM_SEMANTICS
//
// MessageText:
//
// Either the IOPMVideoOutput::COPPCompatibleGetInformation, IOPMVideoOutput::GetInformation, or IOPMVideoOutput::Configure method failed.  This error is only returned if a video output has COPP semantics.  IOPMVideoOutput::COPPCompatibleGetInformation returns this error code if the caller requested OPM specific information.  IOPMVideoOutput::GetInformation always returns this error if a video output has COPP semantics.  IOPMVideoOutput::Configure returns this error when the caller tries to use an OPM specific command.  
//
#define ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_DOES_NOT_HAVE_OPM_SEMANTICS _HRESULT_TYPEDEF_(0xC026251FL)

//
// MessageId: ERROR_GRAPHICS_OPM_SIGNALING_NOT_SUPPORTED
//
// MessageText:
//
// The IOPMVideoOutput::COPPCompatibleGetInformation or IOPMVideoOutput::Configure method failed because the display driver does not support the OPM_GET_ACP_AND_CGMSA_SIGNALING and OPM_SET_ACP_AND_CGMSA_SIGNALING GUIDs.
//
#define ERROR_GRAPHICS_OPM_SIGNALING_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262520L)

//
// MessageId: ERROR_GRAPHICS_OPM_INVALID_CONFIGURATION_REQUEST
//
// MessageText:
//
// The IOPMVideoOutput::Configure function returns this error code if the passed in sequence number is not the expected sequence number or the passed in OMAC value is invalid.
//
#define ERROR_GRAPHICS_OPM_INVALID_CONFIGURATION_REQUEST _HRESULT_TYPEDEF_(0xC0262521L)

//
//   Monitor Configuration API error codes {0x2580..0x25DF}
//
//
// MessageId: ERROR_GRAPHICS_I2C_NOT_SUPPORTED
//
// MessageText:
//
// The monitor connected to the specified video output does not have an I2C bus.
//
#define ERROR_GRAPHICS_I2C_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262580L)    

//
// MessageId: ERROR_GRAPHICS_I2C_DEVICE_DOES_NOT_EXIST
//
// MessageText:
//
// No device on the I2C bus has the specified address.
//
#define ERROR_GRAPHICS_I2C_DEVICE_DOES_NOT_EXIST _HRESULT_TYPEDEF_(0xC0262581L)    

//
// MessageId: ERROR_GRAPHICS_I2C_ERROR_TRANSMITTING_DATA
//
// MessageText:
//
// An error occurred while transmitting data to the device on the I2C bus.
//
#define ERROR_GRAPHICS_I2C_ERROR_TRANSMITTING_DATA _HRESULT_TYPEDEF_(0xC0262582L)    

//
// MessageId: ERROR_GRAPHICS_I2C_ERROR_RECEIVING_DATA
//
// MessageText:
//
// An error occurred while receiving data from the device on the I2C bus.
//
#define ERROR_GRAPHICS_I2C_ERROR_RECEIVING_DATA _HRESULT_TYPEDEF_(0xC0262583L)    

//
// MessageId: ERROR_GRAPHICS_DDCCI_VCP_NOT_SUPPORTED
//
// MessageText:
//
// The monitor does not support the specified VCP code.
//
#define ERROR_GRAPHICS_DDCCI_VCP_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC0262584L)    

//
// MessageId: ERROR_GRAPHICS_DDCCI_INVALID_DATA
//
// MessageText:
//
// The data received from the monitor is invalid.
//
#define ERROR_GRAPHICS_DDCCI_INVALID_DATA _HRESULT_TYPEDEF_(0xC0262585L)    

//
// MessageId: ERROR_GRAPHICS_DDCCI_MONITOR_RETURNED_INVALID_TIMING_STATUS_BYTE
//
// MessageText:
//
// The function failed because a monitor returned an invalid Timing Status byte when the operating system used the DDC/CI Get Timing Report & Timing Message command to get a timing report from a monitor.
//
#define ERROR_GRAPHICS_DDCCI_MONITOR_RETURNED_INVALID_TIMING_STATUS_BYTE _HRESULT_TYPEDEF_(0xC0262586L)

//
// MessageId: ERROR_GRAPHICS_MCA_INVALID_CAPABILITIES_STRING
//
// MessageText:
//
// The monitor returned a DDC/CI capabilities string which did not comply with the ACCESS.bus 3.0, DDC/CI 1.1, or MCCS 2 Revision 1 specification.
//
#define ERROR_GRAPHICS_MCA_INVALID_CAPABILITIES_STRING _HRESULT_TYPEDEF_(0xC0262587L)

//
// MessageId: ERROR_GRAPHICS_MCA_INTERNAL_ERROR
//
// MessageText:
//
// An internal Monitor Configuration API error occured.
//
#define ERROR_GRAPHICS_MCA_INTERNAL_ERROR _HRESULT_TYPEDEF_(0xC0262588L)

//
// MessageId: ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_COMMAND
//
// MessageText:
//
// An operation failed because a DDC/CI message had an invalid value in its command field.
//
#define ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_COMMAND _HRESULT_TYPEDEF_(0xC0262589L)

//
// MessageId: ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_LENGTH
//
// MessageText:
//
// An error occurred because the field length of a DDC/CI message contained an invalid value.
//
#define ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_LENGTH _HRESULT_TYPEDEF_(0xC026258AL)

//
// MessageId: ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_CHECKSUM
//
// MessageText:
//
// An error occurred because the checksum field in a DDC/CI message did not match the message's computed checksum value.  This error implies that the data was corrupted while it was being transmitted from a monitor to a computer.
//
#define ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_CHECKSUM _HRESULT_TYPEDEF_(0xC026258BL)

//
// MessageId: ERROR_GRAPHICS_INVALID_PHYSICAL_MONITOR_HANDLE
//
// MessageText:
//
// This function failed because an invalid monitor handle was passed to it.
//
#define ERROR_GRAPHICS_INVALID_PHYSICAL_MONITOR_HANDLE _HRESULT_TYPEDEF_(0xC026258CL)

//
// MessageId: ERROR_GRAPHICS_MONITOR_NO_LONGER_EXISTS
//
// MessageText:
//
// The operating system asynchronously destroyed the monitor which corresponds to this handle because the operating system's state changed.  This error typically occurs because the monitor PDO associated with this handle was removed, the monitor PDO associated with this handle was stopped, or a display mode change occurred.  A display mode change occurs when windows sends a WM_DISPLAYCHANGE windows message to applications.
//
#define ERROR_GRAPHICS_MONITOR_NO_LONGER_EXISTS _HRESULT_TYPEDEF_(0xC026258DL)

//
// MessageId: ERROR_GRAPHICS_DDCCI_CURRENT_CURRENT_VALUE_GREATER_THAN_MAXIMUM_VALUE
//
// MessageText:
//
// A continuous VCP code's current value is greater than its maximum value. This error code indicates that a monitor returned an invalid value.
//
#define ERROR_GRAPHICS_DDCCI_CURRENT_CURRENT_VALUE_GREATER_THAN_MAXIMUM_VALUE _HRESULT_TYPEDEF_(0xC02625D8L)

//
// MessageId: ERROR_GRAPHICS_MCA_INVALID_VCP_VERSION
//
// MessageText:
//
// The monitor's VCP Version (0xDF) VCP code returned an invalid version value.
//
#define ERROR_GRAPHICS_MCA_INVALID_VCP_VERSION _HRESULT_TYPEDEF_(0xC02625D9L)

//
// MessageId: ERROR_GRAPHICS_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION
//
// MessageText:
//
// The monitor does not comply with the MCCS specification it claims to support.
//
#define ERROR_GRAPHICS_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION _HRESULT_TYPEDEF_(0xC02625DAL)

//
// MessageId: ERROR_GRAPHICS_MCA_MCCS_VERSION_MISMATCH
//
// MessageText:
//
// The MCCS version in a monitor's mccs_ver capability does not match the MCCS version the monitor reports when the VCP Version (0xDF) VCP code is used.
//
#define ERROR_GRAPHICS_MCA_MCCS_VERSION_MISMATCH _HRESULT_TYPEDEF_(0xC02625DBL)

//
// MessageId: ERROR_GRAPHICS_MCA_UNSUPPORTED_MCCS_VERSION
//
// MessageText:
//
// The Monitor Configuration API only works with monitors which support the MCCS 1.0 specification, MCCS 2.0 specification or the MCCS 2.0 Revision 1 specification.
//
#define ERROR_GRAPHICS_MCA_UNSUPPORTED_MCCS_VERSION _HRESULT_TYPEDEF_(0xC02625DCL)

//
// MessageId: ERROR_GRAPHICS_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED
//
// MessageText:
//
// The monitor returned an invalid monitor technology type. CRT, Plasma and LCD (TFT) are examples of monitor technology types. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
//
#define ERROR_GRAPHICS_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED _HRESULT_TYPEDEF_(0xC02625DEL)

//
// MessageId: ERROR_GRAPHICS_MCA_UNSUPPORTED_COLOR_TEMPERATURE
//
// MessageText:
//
// SetMonitorColorTemperature()'s caller passed a color temperature to it which the current monitor did not support. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
//
#define ERROR_GRAPHICS_MCA_UNSUPPORTED_COLOR_TEMPERATURE _HRESULT_TYPEDEF_(0xC02625DFL)

//
//   OPM, UAB, PVP and DDC/CI shared error codes {0x25E0..0x25ff}
//
//
// MessageId: ERROR_GRAPHICS_ONLY_CONSOLE_SESSION_SUPPORTED
//
// MessageText:
//
// This function can only be used if a program is running in the local console session. It cannot be used if the program is running on a remote desktop session or on a terminal server session.
//
#define ERROR_GRAPHICS_ONLY_CONSOLE_SESSION_SUPPORTED _HRESULT_TYPEDEF_(0xC02625E0L)

//
// MessageId: ERROR_GRAPHICS_NO_DISPLAY_DEVICE_CORRESPONDS_TO_NAME
//
// MessageText:
//
// This function cannot find an actual GDI display device which corresponds to the specified GDI display device name.
//
#define ERROR_GRAPHICS_NO_DISPLAY_DEVICE_CORRESPONDS_TO_NAME _HRESULT_TYPEDEF_(0xC02625E1L)

//
// MessageId: ERROR_GRAPHICS_DISPLAY_DEVICE_NOT_ATTACHED_TO_DESKTOP
//
// MessageText:
//
// The function failed because the specified GDI display device was not attached to the Windows desktop.
//
#define ERROR_GRAPHICS_DISPLAY_DEVICE_NOT_ATTACHED_TO_DESKTOP _HRESULT_TYPEDEF_(0xC02625E2L)

//
// MessageId: ERROR_GRAPHICS_MIRRORING_DEVICES_NOT_SUPPORTED
//
// MessageText:
//
// This function does not support GDI mirroring display devices because GDI mirroring display devices do not have any physical monitors associated with them.
//
#define ERROR_GRAPHICS_MIRRORING_DEVICES_NOT_SUPPORTED _HRESULT_TYPEDEF_(0xC02625E3L)

//
// MessageId: ERROR_GRAPHICS_INVALID_POINTER
//
// MessageText:
//
// The function failed because an invalid pointer parameter was passed to it.  A pointer parameter is invalid if it is NULL, points to an invalid address, points to a kernel mode address, or is not correctly aligned.
//
#define ERROR_GRAPHICS_INVALID_POINTER   _HRESULT_TYPEDEF_(0xC02625E4L)

//
// MessageId: ERROR_GRAPHICS_NO_MONITORS_CORRESPOND_TO_DISPLAY_DEVICE
//
// MessageText:
//
// The function failed because the specified GDI device did not have any monitors associated with it.
//
#define ERROR_GRAPHICS_NO_MONITORS_CORRESPOND_TO_DISPLAY_DEVICE _HRESULT_TYPEDEF_(0xC02625E5L)

//
// MessageId: ERROR_GRAPHICS_PARAMETER_ARRAY_TOO_SMALL
//
// MessageText:
//
// An array passed to the function cannot hold all of the data that the function must copy into the array.
//
#define ERROR_GRAPHICS_PARAMETER_ARRAY_TOO_SMALL _HRESULT_TYPEDEF_(0xC02625E6L)

//
// MessageId: ERROR_GRAPHICS_INTERNAL_ERROR
//
// MessageText:
//
// An internal error caused an operation to fail.
//
#define ERROR_GRAPHICS_INTERNAL_ERROR    _HRESULT_TYPEDEF_(0xC02625E7L)

//
// MessageId: ERROR_GRAPHICS_SESSION_TYPE_CHANGE_IN_PROGRESS
//
// MessageText:
//
// The function failed because the current session is changing its type.  This function cannot be called when the current session is changing its type.  There are currently three types of sessions: console, disconnected and remote (RDP or ICA).
//
#define ERROR_GRAPHICS_SESSION_TYPE_CHANGE_IN_PROGRESS _HRESULT_TYPEDEF_(0xC02605E8L)

//
// ===============================
// TPM Services and TPM Software Error Messages
// ===============================
//
// The TPM services and TPM software facilities are used by the various
// TPM software components. There are two facilities because the services
// errors are within the TCG-defined error space and the software errors
// are not.
//
// The following are the subranges within the TPM Services facility.
// The TPM hardware errors are defined in the document
// TPM Main Specification 1.2 Part 2 TPM Structures.
// The TBS errors are slotted into the TCG error namespace at the TBS layer.
//
// 0x0000 - 0x08ff     TPM hardware errors
// 0x4000 - 0x40ff     TPM Base Services errors (tbssvc.dll)
//
// The following are the subranges within the TPM Software facility. The TBS
// has two classes of errors - those that can be returned (the public errors,
// defined in the TBS spec), which are in the TPM services facility,  and
// those that are internal or implementation specific, which are here in the
// TPM software facility.
//
// 0x0000 - 0x00ff     TPM device driver errors (tpm.sys)
// 0x0100 - 0x01ff     TPM API errors (tpmapi.lib)
// 0x0200 - 0x02ff     TBS internal errors (tbssvc.dll)
// 0x0300 - 0x03ff     TPM Physical Presence errors
//
//
//   TPM hardware error codes {0x0000..0x08ff}
//   This space is further subdivided into hardware errors, vendor-specific
//   errors, and non-fatal errors.
//
//
//  TPM hardware errors {0x0000..0x003ff}
//
//
// MessageId: TPM_E_ERROR_MASK
//
// MessageText:
//
// This is an error mask to convert TPM hardware errors to win errors.
//
#define TPM_E_ERROR_MASK                 _HRESULT_TYPEDEF_(0x80280000L)

//
// MessageId: TPM_E_AUTHFAIL
//
// MessageText:
//
// Authentication failed.
//
#define TPM_E_AUTHFAIL                   _HRESULT_TYPEDEF_(0x80280001L)

//
// MessageId: TPM_E_BADINDEX
//
// MessageText:
//
// The index to a PCR, DIR or other register is incorrect.
//
#define TPM_E_BADINDEX                   _HRESULT_TYPEDEF_(0x80280002L)

//
// MessageId: TPM_E_BAD_PARAMETER
//
// MessageText:
//
// One or more parameter is bad.
//
#define TPM_E_BAD_PARAMETER              _HRESULT_TYPEDEF_(0x80280003L)

//
// MessageId: TPM_E_AUDITFAILURE
//
// MessageText:
//
// An operation completed successfully but the auditing of that operation failed.
//
#define TPM_E_AUDITFAILURE               _HRESULT_TYPEDEF_(0x80280004L)

//
// MessageId: TPM_E_CLEAR_DISABLED
//
// MessageText:
//
// The clear disable flag is set and all clear operations now require physical access.
//
#define TPM_E_CLEAR_DISABLED             _HRESULT_TYPEDEF_(0x80280005L)

//
// MessageId: TPM_E_DEACTIVATED
//
// MessageText:
//
// Activate the Trusted Platform Module (TPM).
//
#define TPM_E_DEACTIVATED                _HRESULT_TYPEDEF_(0x80280006L)

//
// MessageId: TPM_E_DISABLED
//
// MessageText:
//
// Enable the Trusted Platform Module (TPM).
//
#define TPM_E_DISABLED                   _HRESULT_TYPEDEF_(0x80280007L)

//
// MessageId: TPM_E_DISABLED_CMD
//
// MessageText:
//
// The target command has been disabled.
//
#define TPM_E_DISABLED_CMD               _HRESULT_TYPEDEF_(0x80280008L)

//
// MessageId: TPM_E_FAIL
//
// MessageText:
//
// The operation failed.
//
#define TPM_E_FAIL                       _HRESULT_TYPEDEF_(0x80280009L)

//
// MessageId: TPM_E_BAD_ORDINAL
//
// MessageText:
//
// The ordinal was unknown or inconsistent.
//
#define TPM_E_BAD_ORDINAL                _HRESULT_TYPEDEF_(0x8028000AL)

//
// MessageId: TPM_E_INSTALL_DISABLED
//
// MessageText:
//
// The ability to install an owner is disabled.
//
#define TPM_E_INSTALL_DISABLED           _HRESULT_TYPEDEF_(0x8028000BL)

//
// MessageId: TPM_E_INVALID_KEYHANDLE
//
// MessageText:
//
// The key handle cannot be intrepreted.
//
#define TPM_E_INVALID_KEYHANDLE          _HRESULT_TYPEDEF_(0x8028000CL)

//
// MessageId: TPM_E_KEYNOTFOUND
//
// MessageText:
//
// The key handle points to an invalid key.
//
#define TPM_E_KEYNOTFOUND                _HRESULT_TYPEDEF_(0x8028000DL)

//
// MessageId: TPM_E_INAPPROPRIATE_ENC
//
// MessageText:
//
// Unacceptable encryption scheme.
//
#define TPM_E_INAPPROPRIATE_ENC          _HRESULT_TYPEDEF_(0x8028000EL)

//
// MessageId: TPM_E_MIGRATEFAIL
//
// MessageText:
//
// Migration authorization failed.
//
#define TPM_E_MIGRATEFAIL                _HRESULT_TYPEDEF_(0x8028000FL)

//
// MessageId: TPM_E_INVALID_PCR_INFO
//
// MessageText:
//
// PCR information could not be interpreted.
//
#define TPM_E_INVALID_PCR_INFO           _HRESULT_TYPEDEF_(0x80280010L)

//
// MessageId: TPM_E_NOSPACE
//
// MessageText:
//
// No room to load key.
//
#define TPM_E_NOSPACE                    _HRESULT_TYPEDEF_(0x80280011L)

//
// MessageId: TPM_E_NOSRK
//
// MessageText:
//
// There is no Storage Root Key (SRK) set.
//
#define TPM_E_NOSRK                      _HRESULT_TYPEDEF_(0x80280012L)

//
// MessageId: TPM_E_NOTSEALED_BLOB
//
// MessageText:
//
// An encrypted blob is invalid or was not created by this TPM.
//
#define TPM_E_NOTSEALED_BLOB             _HRESULT_TYPEDEF_(0x80280013L)

//
// MessageId: TPM_E_OWNER_SET
//
// MessageText:
//
// The Trusted Platform Module (TPM) already has an owner.
//
#define TPM_E_OWNER_SET                  _HRESULT_TYPEDEF_(0x80280014L)

//
// MessageId: TPM_E_RESOURCES
//
// MessageText:
//
// The TPM has insufficient internal resources to perform the requested action.
//
#define TPM_E_RESOURCES                  _HRESULT_TYPEDEF_(0x80280015L)

//
// MessageId: TPM_E_SHORTRANDOM
//
// MessageText:
//
// A random string was too short.
//
#define TPM_E_SHORTRANDOM                _HRESULT_TYPEDEF_(0x80280016L)

//
// MessageId: TPM_E_SIZE
//
// MessageText:
//
// The TPM does not have the space to perform the operation.
//
#define TPM_E_SIZE                       _HRESULT_TYPEDEF_(0x80280017L)

//
// MessageId: TPM_E_WRONGPCRVAL
//
// MessageText:
//
// The named PCR value does not match the current PCR value.
//
#define TPM_E_WRONGPCRVAL                _HRESULT_TYPEDEF_(0x80280018L)

//
// MessageId: TPM_E_BAD_PARAM_SIZE
//
// MessageText:
//
// The paramSize argument to the command has the incorrect value .
//
#define TPM_E_BAD_PARAM_SIZE             _HRESULT_TYPEDEF_(0x80280019L)

//
// MessageId: TPM_E_SHA_THREAD
//
// MessageText:
//
// There is no existing SHA-1 thread.
//
#define TPM_E_SHA_THREAD                 _HRESULT_TYPEDEF_(0x8028001AL)

//
// MessageId: TPM_E_SHA_ERROR
//
// MessageText:
//
// The calculation is unable to proceed because the existing SHA-1 thread has already encountered an error.
//
#define TPM_E_SHA_ERROR                  _HRESULT_TYPEDEF_(0x8028001BL)

//
// MessageId: TPM_E_FAILEDSELFTEST
//
// MessageText:
//
// Self-test has failed and the TPM has shutdown.
//
#define TPM_E_FAILEDSELFTEST             _HRESULT_TYPEDEF_(0x8028001CL)

//
// MessageId: TPM_E_AUTH2FAIL
//
// MessageText:
//
// The authorization for the second key in a 2 key function failed authorization.
//
#define TPM_E_AUTH2FAIL                  _HRESULT_TYPEDEF_(0x8028001DL)

//
// MessageId: TPM_E_BADTAG
//
// MessageText:
//
// The tag value sent to for a command is invalid.
//
#define TPM_E_BADTAG                     _HRESULT_TYPEDEF_(0x8028001EL)

//
// MessageId: TPM_E_IOERROR
//
// MessageText:
//
// An IO error occurred transmitting information to the TPM.
//
#define TPM_E_IOERROR                    _HRESULT_TYPEDEF_(0x8028001FL)

//
// MessageId: TPM_E_ENCRYPT_ERROR
//
// MessageText:
//
// The encryption process had a problem.
//
#define TPM_E_ENCRYPT_ERROR              _HRESULT_TYPEDEF_(0x80280020L)

//
// MessageId: TPM_E_DECRYPT_ERROR
//
// MessageText:
//
// The decryption process did not complete.
//
#define TPM_E_DECRYPT_ERROR              _HRESULT_TYPEDEF_(0x80280021L)

//
// MessageId: TPM_E_INVALID_AUTHHANDLE
//
// MessageText:
//
// An invalid handle was used.
//
#define TPM_E_INVALID_AUTHHANDLE         _HRESULT_TYPEDEF_(0x80280022L)

//
// MessageId: TPM_E_NO_ENDORSEMENT
//
// MessageText:
//
// The TPM does not have an Endorsement Key (EK) installed.
//
#define TPM_E_NO_ENDORSEMENT             _HRESULT_TYPEDEF_(0x80280023L)

//
// MessageId: TPM_E_INVALID_KEYUSAGE
//
// MessageText:
//
// The usage of a key is not allowed.
//
#define TPM_E_INVALID_KEYUSAGE           _HRESULT_TYPEDEF_(0x80280024L)

//
// MessageId: TPM_E_WRONG_ENTITYTYPE
//
// MessageText:
//
// The submitted entity type is not allowed.
//
#define TPM_E_WRONG_ENTITYTYPE           _HRESULT_TYPEDEF_(0x80280025L)

//
// MessageId: TPM_E_INVALID_POSTINIT
//
// MessageText:
//
// The command was received in the wrong sequence relative to TPM_Init and a subsequent TPM_Startup.
//
#define TPM_E_INVALID_POSTINIT           _HRESULT_TYPEDEF_(0x80280026L)

//
// MessageId: TPM_E_INAPPROPRIATE_SIG
//
// MessageText:
//
// Signed data cannot include additional DER information.
//
#define TPM_E_INAPPROPRIATE_SIG          _HRESULT_TYPEDEF_(0x80280027L)

//
// MessageId: TPM_E_BAD_KEY_PROPERTY
//
// MessageText:
//
// The key properties in TPM_KEY_PARMs are not supported by this TPM.
//
#define TPM_E_BAD_KEY_PROPERTY           _HRESULT_TYPEDEF_(0x80280028L)

//
// MessageId: TPM_E_BAD_MIGRATION
//
// MessageText:
//
// The migration properties of this key are incorrect.
//
#define TPM_E_BAD_MIGRATION              _HRESULT_TYPEDEF_(0x80280029L)

//
// MessageId: TPM_E_BAD_SCHEME
//
// MessageText:
//
// The signature or encryption scheme for this key is incorrect or not permitted in this situation.
//
#define TPM_E_BAD_SCHEME                 _HRESULT_TYPEDEF_(0x8028002AL)

//
// MessageId: TPM_E_BAD_DATASIZE
//
// MessageText:
//
// The size of the data (or blob) parameter is bad or inconsistent with the referenced key.
//
#define TPM_E_BAD_DATASIZE               _HRESULT_TYPEDEF_(0x8028002BL)

//
// MessageId: TPM_E_BAD_MODE
//
// MessageText:
//
// A mode parameter is bad, such as capArea or subCapArea for TPM_GetCapability, phsicalPresence parameter for TPM_PhysicalPresence, or migrationType for TPM_CreateMigrationBlob.
//
#define TPM_E_BAD_MODE                   _HRESULT_TYPEDEF_(0x8028002CL)

//
// MessageId: TPM_E_BAD_PRESENCE
//
// MessageText:
//
// Either the physicalPresence or physicalPresenceLock bits have the wrong value.
//
#define TPM_E_BAD_PRESENCE               _HRESULT_TYPEDEF_(0x8028002DL)

//
// MessageId: TPM_E_BAD_VERSION
//
// MessageText:
//
// The TPM cannot perform this version of the capability.
//
#define TPM_E_BAD_VERSION                _HRESULT_TYPEDEF_(0x8028002EL)

//
// MessageId: TPM_E_NO_WRAP_TRANSPORT
//
// MessageText:
//
// The TPM does not allow for wrapped transport sessions.
//
#define TPM_E_NO_WRAP_TRANSPORT          _HRESULT_TYPEDEF_(0x8028002FL)

//
// MessageId: TPM_E_AUDITFAIL_UNSUCCESSFUL
//
// MessageText:
//
// TPM audit construction failed and the underlying command was returning a failure code also.
//
#define TPM_E_AUDITFAIL_UNSUCCESSFUL     _HRESULT_TYPEDEF_(0x80280030L)

//
// MessageId: TPM_E_AUDITFAIL_SUCCESSFUL
//
// MessageText:
//
// TPM audit construction failed and the underlying command was returning success.
//
#define TPM_E_AUDITFAIL_SUCCESSFUL       _HRESULT_TYPEDEF_(0x80280031L)

//
// MessageId: TPM_E_NOTRESETABLE
//
// MessageText:
//
// Attempt to reset a PCR register that does not have the resettable attribute.
//
#define TPM_E_NOTRESETABLE               _HRESULT_TYPEDEF_(0x80280032L)

//
// MessageId: TPM_E_NOTLOCAL
//
// MessageText:
//
// Attempt to reset a PCR register that requires locality and locality modifier not part of command transport.
//
#define TPM_E_NOTLOCAL                   _HRESULT_TYPEDEF_(0x80280033L)

//
// MessageId: TPM_E_BAD_TYPE
//
// MessageText:
//
// Make identity blob not properly typed.
//
#define TPM_E_BAD_TYPE                   _HRESULT_TYPEDEF_(0x80280034L)

//
// MessageId: TPM_E_INVALID_RESOURCE
//
// MessageText:
//
// When saving context identified resource type does not match actual resource.
//
#define TPM_E_INVALID_RESOURCE           _HRESULT_TYPEDEF_(0x80280035L)

//
// MessageId: TPM_E_NOTFIPS
//
// MessageText:
//
// The TPM is attempting to execute a command only available when in FIPS mode.
//
#define TPM_E_NOTFIPS                    _HRESULT_TYPEDEF_(0x80280036L)

//
// MessageId: TPM_E_INVALID_FAMILY
//
// MessageText:
//
// The command is attempting to use an invalid family ID.
//
#define TPM_E_INVALID_FAMILY             _HRESULT_TYPEDEF_(0x80280037L)

//
// MessageId: TPM_E_NO_NV_PERMISSION
//
// MessageText:
//
// The permission to manipulate the NV storage is not available.
//
#define TPM_E_NO_NV_PERMISSION           _HRESULT_TYPEDEF_(0x80280038L)

//
// MessageId: TPM_E_REQUIRES_SIGN
//
// MessageText:
//
// The operation requires a signed command.
//
#define TPM_E_REQUIRES_SIGN              _HRESULT_TYPEDEF_(0x80280039L)

//
// MessageId: TPM_E_KEY_NOTSUPPORTED
//
// MessageText:
//
// Wrong operation to load an NV key.
//
#define TPM_E_KEY_NOTSUPPORTED           _HRESULT_TYPEDEF_(0x8028003AL)

//
// MessageId: TPM_E_AUTH_CONFLICT
//
// MessageText:
//
// NV_LoadKey blob requires both owner and blob authorization.
//
#define TPM_E_AUTH_CONFLICT              _HRESULT_TYPEDEF_(0x8028003BL)

//
// MessageId: TPM_E_AREA_LOCKED
//
// MessageText:
//
// The NV area is locked and not writtable.
//
#define TPM_E_AREA_LOCKED                _HRESULT_TYPEDEF_(0x8028003CL)

//
// MessageId: TPM_E_BAD_LOCALITY
//
// MessageText:
//
// The locality is incorrect for the attempted operation.
//
#define TPM_E_BAD_LOCALITY               _HRESULT_TYPEDEF_(0x8028003DL)

//
// MessageId: TPM_E_READ_ONLY
//
// MessageText:
//
// The NV area is read only and can't be written to.
//
#define TPM_E_READ_ONLY                  _HRESULT_TYPEDEF_(0x8028003EL)

//
// MessageId: TPM_E_PER_NOWRITE
//
// MessageText:
//
// There is no protection on the write to the NV area.
//
#define TPM_E_PER_NOWRITE                _HRESULT_TYPEDEF_(0x8028003FL)

//
// MessageId: TPM_E_FAMILYCOUNT
//
// MessageText:
//
// The family count value does not match.
//
#define TPM_E_FAMILYCOUNT                _HRESULT_TYPEDEF_(0x80280040L)

//
// MessageId: TPM_E_WRITE_LOCKED
//
// MessageText:
//
// The NV area has already been written to.
//
#define TPM_E_WRITE_LOCKED               _HRESULT_TYPEDEF_(0x80280041L)

//
// MessageId: TPM_E_BAD_ATTRIBUTES
//
// MessageText:
//
// The NV area attributes conflict.
//
#define TPM_E_BAD_ATTRIBUTES             _HRESULT_TYPEDEF_(0x80280042L)

//
// MessageId: TPM_E_INVALID_STRUCTURE
//
// MessageText:
//
// The structure tag and version are invalid or inconsistent.
//
#define TPM_E_INVALID_STRUCTURE          _HRESULT_TYPEDEF_(0x80280043L)

//
// MessageId: TPM_E_KEY_OWNER_CONTROL
//
// MessageText:
//
// The key is under control of the TPM Owner and can only be evicted by the TPM Owner.
//
#define TPM_E_KEY_OWNER_CONTROL          _HRESULT_TYPEDEF_(0x80280044L)

//
// MessageId: TPM_E_BAD_COUNTER
//
// MessageText:
//
// The counter handle is incorrect.
//
#define TPM_E_BAD_COUNTER                _HRESULT_TYPEDEF_(0x80280045L)

//
// MessageId: TPM_E_NOT_FULLWRITE
//
// MessageText:
//
// The write is not a complete write of the area.
//
#define TPM_E_NOT_FULLWRITE              _HRESULT_TYPEDEF_(0x80280046L)

//
// MessageId: TPM_E_CONTEXT_GAP
//
// MessageText:
//
// The gap between saved context counts is too large.
//
#define TPM_E_CONTEXT_GAP                _HRESULT_TYPEDEF_(0x80280047L)

//
// MessageId: TPM_E_MAXNVWRITES
//
// MessageText:
//
// The maximum number of NV writes without an owner has been exceeded.
//
#define TPM_E_MAXNVWRITES                _HRESULT_TYPEDEF_(0x80280048L)

//
// MessageId: TPM_E_NOOPERATOR
//
// MessageText:
//
// No operator AuthData value is set.
//
#define TPM_E_NOOPERATOR                 _HRESULT_TYPEDEF_(0x80280049L)

//
// MessageId: TPM_E_RESOURCEMISSING
//
// MessageText:
//
// The resource pointed to by context is not loaded.
//
#define TPM_E_RESOURCEMISSING            _HRESULT_TYPEDEF_(0x8028004AL)

//
// MessageId: TPM_E_DELEGATE_LOCK
//
// MessageText:
//
// The delegate administration is locked.
//
#define TPM_E_DELEGATE_LOCK              _HRESULT_TYPEDEF_(0x8028004BL)

//
// MessageId: TPM_E_DELEGATE_FAMILY
//
// MessageText:
//
// Attempt to manage a family other then the delegated family.
//
#define TPM_E_DELEGATE_FAMILY            _HRESULT_TYPEDEF_(0x8028004CL)

//
// MessageId: TPM_E_DELEGATE_ADMIN
//
// MessageText:
//
// Delegation table management not enabled.
//
#define TPM_E_DELEGATE_ADMIN             _HRESULT_TYPEDEF_(0x8028004DL)

//
// MessageId: TPM_E_TRANSPORT_NOTEXCLUSIVE
//
// MessageText:
//
// There was a command executed outside of an exclusive transport session.
//
#define TPM_E_TRANSPORT_NOTEXCLUSIVE     _HRESULT_TYPEDEF_(0x8028004EL)

//
// MessageId: TPM_E_OWNER_CONTROL
//
// MessageText:
//
// Attempt to context save a owner evict controlled key.
//
#define TPM_E_OWNER_CONTROL              _HRESULT_TYPEDEF_(0x8028004FL)

//
// MessageId: TPM_E_DAA_RESOURCES
//
// MessageText:
//
// The DAA command has no resources availble to execute the command.
//
#define TPM_E_DAA_RESOURCES              _HRESULT_TYPEDEF_(0x80280050L)

//
// MessageId: TPM_E_DAA_INPUT_DATA0
//
// MessageText:
//
// The consistency check on DAA parameter inputData0 has failed.
//
#define TPM_E_DAA_INPUT_DATA0            _HRESULT_TYPEDEF_(0x80280051L)

//
// MessageId: TPM_E_DAA_INPUT_DATA1
//
// MessageText:
//
// The consistency check on DAA parameter inputData1 has failed.
//
#define TPM_E_DAA_INPUT_DATA1            _HRESULT_TYPEDEF_(0x80280052L)

//
// MessageId: TPM_E_DAA_ISSUER_SETTINGS
//
// MessageText:
//
// The consistency check on DAA_issuerSettings has failed.
//
#define TPM_E_DAA_ISSUER_SETTINGS        _HRESULT_TYPEDEF_(0x80280053L)

//
// MessageId: TPM_E_DAA_TPM_SETTINGS
//
// MessageText:
//
// The consistency check on DAA_tpmSpecific has failed.
//
#define TPM_E_DAA_TPM_SETTINGS           _HRESULT_TYPEDEF_(0x80280054L)

//
// MessageId: TPM_E_DAA_STAGE
//
// MessageText:
//
// The atomic process indicated by the submitted DAA command is not the expected process.
//
#define TPM_E_DAA_STAGE                  _HRESULT_TYPEDEF_(0x80280055L)

//
// MessageId: TPM_E_DAA_ISSUER_VALIDITY
//
// MessageText:
//
// The issuer's validity check has detected an inconsistency.
//
#define TPM_E_DAA_ISSUER_VALIDITY        _HRESULT_TYPEDEF_(0x80280056L)

//
// MessageId: TPM_E_DAA_WRONG_W
//
// MessageText:
//
// The consistency check on w has failed.
//
#define TPM_E_DAA_WRONG_W                _HRESULT_TYPEDEF_(0x80280057L)

//
// MessageId: TPM_E_BAD_HANDLE
//
// MessageText:
//
// The handle is incorrect.
//
#define TPM_E_BAD_HANDLE                 _HRESULT_TYPEDEF_(0x80280058L)

//
// MessageId: TPM_E_BAD_DELEGATE
//
// MessageText:
//
// Delegation is not correct.
//
#define TPM_E_BAD_DELEGATE               _HRESULT_TYPEDEF_(0x80280059L)

//
// MessageId: TPM_E_BADCONTEXT
//
// MessageText:
//
// The context blob is invalid.
//
#define TPM_E_BADCONTEXT                 _HRESULT_TYPEDEF_(0x8028005AL)

//
// MessageId: TPM_E_TOOMANYCONTEXTS
//
// MessageText:
//
// Too many contexts held by the TPM.
//
#define TPM_E_TOOMANYCONTEXTS            _HRESULT_TYPEDEF_(0x8028005BL)

//
// MessageId: TPM_E_MA_TICKET_SIGNATURE
//
// MessageText:
//
// Migration authority signature validation failure.
//
#define TPM_E_MA_TICKET_SIGNATURE        _HRESULT_TYPEDEF_(0x8028005CL)

//
// MessageId: TPM_E_MA_DESTINATION
//
// MessageText:
//
// Migration destination not authenticated.
//
#define TPM_E_MA_DESTINATION             _HRESULT_TYPEDEF_(0x8028005DL)

//
// MessageId: TPM_E_MA_SOURCE
//
// MessageText:
//
// Migration source incorrect.
//
#define TPM_E_MA_SOURCE                  _HRESULT_TYPEDEF_(0x8028005EL)

//
// MessageId: TPM_E_MA_AUTHORITY
//
// MessageText:
//
// Incorrect migration authority.
//
#define TPM_E_MA_AUTHORITY               _HRESULT_TYPEDEF_(0x8028005FL)

//
// MessageId: TPM_E_PERMANENTEK
//
// MessageText:
//
// Attempt to revoke the EK and the EK is not revocable.
//
#define TPM_E_PERMANENTEK                _HRESULT_TYPEDEF_(0x80280061L)

//
// MessageId: TPM_E_BAD_SIGNATURE
//
// MessageText:
//
// Bad signature of CMK ticket.
//
#define TPM_E_BAD_SIGNATURE              _HRESULT_TYPEDEF_(0x80280062L)

//
// MessageId: TPM_E_NOCONTEXTSPACE
//
// MessageText:
//
// There is no room in the context list for additional contexts.
//
#define TPM_E_NOCONTEXTSPACE             _HRESULT_TYPEDEF_(0x80280063L)

//
//  TPM vendor specific hardware errors {0x0400..0x04ff}
//
//
// MessageId: TPM_E_COMMAND_BLOCKED
//
// MessageText:
//
// The command was blocked.
//
#define TPM_E_COMMAND_BLOCKED            _HRESULT_TYPEDEF_(0x80280400L)

//
// MessageId: TPM_E_INVALID_HANDLE
//
// MessageText:
//
// The specified handle was not found.
//
#define TPM_E_INVALID_HANDLE             _HRESULT_TYPEDEF_(0x80280401L)

//
// MessageId: TPM_E_DUPLICATE_VHANDLE
//
// MessageText:
//
// The TPM returned a duplicate handle and the command needs to be resubmitted.
//
#define TPM_E_DUPLICATE_VHANDLE          _HRESULT_TYPEDEF_(0x80280402L)

//
// MessageId: TPM_E_EMBEDDED_COMMAND_BLOCKED
//
// MessageText:
//
// The command within the transport was blocked.
//
#define TPM_E_EMBEDDED_COMMAND_BLOCKED   _HRESULT_TYPEDEF_(0x80280403L)

//
// MessageId: TPM_E_EMBEDDED_COMMAND_UNSUPPORTED
//
// MessageText:
//
// The command within the transport is not supported.
//
#define TPM_E_EMBEDDED_COMMAND_UNSUPPORTED _HRESULT_TYPEDEF_(0x80280404L)

//
//  TPM non-fatal hardware errors {0x0800..0x08ff}
//
//
// MessageId: TPM_E_RETRY
//
// MessageText:
//
// The TPM is too busy to respond to the command immediately, but the command could be resubmitted at a later time.
//
#define TPM_E_RETRY                      _HRESULT_TYPEDEF_(0x80280800L)

//
// MessageId: TPM_E_NEEDS_SELFTEST
//
// MessageText:
//
// SelfTestFull has not been run.
//
#define TPM_E_NEEDS_SELFTEST             _HRESULT_TYPEDEF_(0x80280801L)

//
// MessageId: TPM_E_DOING_SELFTEST
//
// MessageText:
//
// The TPM is currently executing a full selftest.
//
#define TPM_E_DOING_SELFTEST             _HRESULT_TYPEDEF_(0x80280802L)

//
// MessageId: TPM_E_DEFEND_LOCK_RUNNING
//
// MessageText:
//
// The TPM is defending against dictionary attacks and is in a time-out period.
//
#define TPM_E_DEFEND_LOCK_RUNNING        _HRESULT_TYPEDEF_(0x80280803L)

//
//   TPM Base Services error codes {0x4000..0x40ff}
//
//
// MessageId: TBS_E_INTERNAL_ERROR
//
// MessageText:
//
// An internal software error has been detected.
//
#define TBS_E_INTERNAL_ERROR             _HRESULT_TYPEDEF_(0x80284001L)

//
// MessageId: TBS_E_BAD_PARAMETER
//
// MessageText:
//
// One or more input parameters is bad.
//
#define TBS_E_BAD_PARAMETER              _HRESULT_TYPEDEF_(0x80284002L)

//
// MessageId: TBS_E_INVALID_OUTPUT_POINTER
//
// MessageText:
//
// A specified output pointer is bad.
//
#define TBS_E_INVALID_OUTPUT_POINTER     _HRESULT_TYPEDEF_(0x80284003L)

//
// MessageId: TBS_E_INVALID_CONTEXT
//
// MessageText:
//
// The specified context handle does not refer to a valid context.
//
#define TBS_E_INVALID_CONTEXT            _HRESULT_TYPEDEF_(0x80284004L)

//
// MessageId: TBS_E_INSUFFICIENT_BUFFER
//
// MessageText:
//
// A specified output buffer is too small.
//
#define TBS_E_INSUFFICIENT_BUFFER        _HRESULT_TYPEDEF_(0x80284005L)

//
// MessageId: TBS_E_IOERROR
//
// MessageText:
//
// An error occurred while communicating with the TPM.
//
#define TBS_E_IOERROR                    _HRESULT_TYPEDEF_(0x80284006L)

//
// MessageId: TBS_E_INVALID_CONTEXT_PARAM
//
// MessageText:
//
// One or more context parameters is invalid.
//
#define TBS_E_INVALID_CONTEXT_PARAM      _HRESULT_TYPEDEF_(0x80284007L)

//
// MessageId: TBS_E_SERVICE_NOT_RUNNING
//
// MessageText:
//
// The TBS service is not running and could not be started.
//
#define TBS_E_SERVICE_NOT_RUNNING        _HRESULT_TYPEDEF_(0x80284008L)

//
// MessageId: TBS_E_TOO_MANY_TBS_CONTEXTS
//
// MessageText:
//
// A new context could not be created because there are too many open contexts.
//
#define TBS_E_TOO_MANY_TBS_CONTEXTS      _HRESULT_TYPEDEF_(0x80284009L)

//
// MessageId: TBS_E_TOO_MANY_RESOURCES
//
// MessageText:
//
// A new virtual resource could not be created because there are too many open
// virtual resources.
//
#define TBS_E_TOO_MANY_RESOURCES         _HRESULT_TYPEDEF_(0x8028400AL)

//
// MessageId: TBS_E_SERVICE_START_PENDING
//
// MessageText:
//
// The TBS service has been started but is not yet running.
//
#define TBS_E_SERVICE_START_PENDING      _HRESULT_TYPEDEF_(0x8028400BL)

//
// MessageId: TBS_E_PPI_NOT_SUPPORTED
//
// MessageText:
//
// The physical presence interface is not supported.
//
#define TBS_E_PPI_NOT_SUPPORTED          _HRESULT_TYPEDEF_(0x8028400CL)

//
// MessageId: TBS_E_COMMAND_CANCELED
//
// MessageText:
//
// The command was canceled.
//
#define TBS_E_COMMAND_CANCELED           _HRESULT_TYPEDEF_(0x8028400DL)

//
// MessageId: TBS_E_BUFFER_TOO_LARGE
//
// MessageText:
//
// The input or output buffer is too large.
//
#define TBS_E_BUFFER_TOO_LARGE           _HRESULT_TYPEDEF_(0x8028400EL)

//
// MessageId: TBS_E_TPM_NOT_FOUND
//
// MessageText:
//
// A compatible Trusted Platform Module (TPM) Security Device cannot be found on this computer.
//
#define TBS_E_TPM_NOT_FOUND              _HRESULT_TYPEDEF_(0x8028400FL)

//
// MessageId: TBS_E_SERVICE_DISABLED
//
// MessageText:
//
// The TBS service has been disabled.
//
#define TBS_E_SERVICE_DISABLED           _HRESULT_TYPEDEF_(0x80284010L)

//
//   TPM API error codes {0x0100..0x01ff}
//
//
// MessageId: TPMAPI_E_INVALID_STATE
//
// MessageText:
//
// The command buffer is not in the correct state.
//
#define TPMAPI_E_INVALID_STATE           _HRESULT_TYPEDEF_(0x80290100L)

//
// MessageId: TPMAPI_E_NOT_ENOUGH_DATA
//
// MessageText:
//
// The command buffer does not contain enough data to satisfy the request.
//
#define TPMAPI_E_NOT_ENOUGH_DATA         _HRESULT_TYPEDEF_(0x80290101L)

//
// MessageId: TPMAPI_E_TOO_MUCH_DATA
//
// MessageText:
//
// The command buffer cannot contain any more data.
//
#define TPMAPI_E_TOO_MUCH_DATA           _HRESULT_TYPEDEF_(0x80290102L)

//
// MessageId: TPMAPI_E_INVALID_OUTPUT_POINTER
//
// MessageText:
//
// One or more output parameters was NULL or invalid.
//
#define TPMAPI_E_INVALID_OUTPUT_POINTER  _HRESULT_TYPEDEF_(0x80290103L)

//
// MessageId: TPMAPI_E_INVALID_PARAMETER
//
// MessageText:
//
// One or more input parameters is invalid.
//
#define TPMAPI_E_INVALID_PARAMETER       _HRESULT_TYPEDEF_(0x80290104L)

//
// MessageId: TPMAPI_E_OUT_OF_MEMORY
//
// MessageText:
//
// Not enough memory was available to satisfy the request.
//
#define TPMAPI_E_OUT_OF_MEMORY           _HRESULT_TYPEDEF_(0x80290105L)

//
// MessageId: TPMAPI_E_BUFFER_TOO_SMALL
//
// MessageText:
//
// The specified buffer was too small.
//
#define TPMAPI_E_BUFFER_TOO_SMALL        _HRESULT_TYPEDEF_(0x80290106L)

//
// MessageId: TPMAPI_E_INTERNAL_ERROR
//
// MessageText:
//
// An internal error was detected.
//
#define TPMAPI_E_INTERNAL_ERROR          _HRESULT_TYPEDEF_(0x80290107L)

//
// MessageId: TPMAPI_E_ACCESS_DENIED
//
// MessageText:
//
// The caller does not have the appropriate rights to perform the requested
// operation.
//
#define TPMAPI_E_ACCESS_DENIED           _HRESULT_TYPEDEF_(0x80290108L)

//
// MessageId: TPMAPI_E_AUTHORIZATION_FAILED
//
// MessageText:
//
// The specified authorization information was invalid.
//
#define TPMAPI_E_AUTHORIZATION_FAILED    _HRESULT_TYPEDEF_(0x80290109L)

//
// MessageId: TPMAPI_E_INVALID_CONTEXT_HANDLE
//
// MessageText:
//
// The specified context handle was not valid.
//
#define TPMAPI_E_INVALID_CONTEXT_HANDLE  _HRESULT_TYPEDEF_(0x8029010AL)

//
// MessageId: TPMAPI_E_TBS_COMMUNICATION_ERROR
//
// MessageText:
//
// An error occurred while communicating with the TBS.
//
#define TPMAPI_E_TBS_COMMUNICATION_ERROR _HRESULT_TYPEDEF_(0x8029010BL)

//
// MessageId: TPMAPI_E_TPM_COMMAND_ERROR
//
// MessageText:
//
// The TPM returned an unexpected result.
//
#define TPMAPI_E_TPM_COMMAND_ERROR       _HRESULT_TYPEDEF_(0x8029010CL)

//
// MessageId: TPMAPI_E_MESSAGE_TOO_LARGE
//
// MessageText:
//
// The message was too large for the encoding scheme.
//
#define TPMAPI_E_MESSAGE_TOO_LARGE       _HRESULT_TYPEDEF_(0x8029010DL)

//
// MessageId: TPMAPI_E_INVALID_ENCODING
//
// MessageText:
//
// The encoding in the blob was not recognized.
//
#define TPMAPI_E_INVALID_ENCODING        _HRESULT_TYPEDEF_(0x8029010EL)

//
// MessageId: TPMAPI_E_INVALID_KEY_SIZE
//
// MessageText:
//
// The key size is not valid.
//
#define TPMAPI_E_INVALID_KEY_SIZE        _HRESULT_TYPEDEF_(0x8029010FL)

//
// MessageId: TPMAPI_E_ENCRYPTION_FAILED
//
// MessageText:
//
// The encryption operation failed.
//
#define TPMAPI_E_ENCRYPTION_FAILED       _HRESULT_TYPEDEF_(0x80290110L)

//
// MessageId: TPMAPI_E_INVALID_KEY_PARAMS
//
// MessageText:
//
// The key parameters structure was not valid
//
#define TPMAPI_E_INVALID_KEY_PARAMS      _HRESULT_TYPEDEF_(0x80290111L)

//
// MessageId: TPMAPI_E_INVALID_MIGRATION_AUTHORIZATION_BLOB
//
// MessageText:
//
// The requested supplied data does not appear to be a valid migration authorization blob.
//
#define TPMAPI_E_INVALID_MIGRATION_AUTHORIZATION_BLOB _HRESULT_TYPEDEF_(0x80290112L)

//
// MessageId: TPMAPI_E_INVALID_PCR_INDEX
//
// MessageText:
//
// The specified PCR index was invalid
//
#define TPMAPI_E_INVALID_PCR_INDEX       _HRESULT_TYPEDEF_(0x80290113L)

//
// MessageId: TPMAPI_E_INVALID_DELEGATE_BLOB
//
// MessageText:
//
// The data given does not appear to be a valid delegate blob.
//
#define TPMAPI_E_INVALID_DELEGATE_BLOB   _HRESULT_TYPEDEF_(0x80290114L)

//
// MessageId: TPMAPI_E_INVALID_CONTEXT_PARAMS
//
// MessageText:
//
// One or more of the specified context parameters was not valid.
//
#define TPMAPI_E_INVALID_CONTEXT_PARAMS  _HRESULT_TYPEDEF_(0x80290115L)

//
// MessageId: TPMAPI_E_INVALID_KEY_BLOB
//
// MessageText:
//
// The data given does not appear to be a valid key blob
//
#define TPMAPI_E_INVALID_KEY_BLOB        _HRESULT_TYPEDEF_(0x80290116L)

//
// MessageId: TPMAPI_E_INVALID_PCR_DATA
//
// MessageText:
//
// The specified PCR data was invalid.
//
#define TPMAPI_E_INVALID_PCR_DATA        _HRESULT_TYPEDEF_(0x80290117L)

//
// MessageId: TPMAPI_E_INVALID_OWNER_AUTH
//
// MessageText:
//
// The format of the owner auth data was invalid.
//
#define TPMAPI_E_INVALID_OWNER_AUTH      _HRESULT_TYPEDEF_(0x80290118L)

//
// MessageId: TPMAPI_E_FIPS_RNG_CHECK_FAILED
//
// MessageText:
//
// The random number generated did not pass FIPS RNG check.
//
#define TPMAPI_E_FIPS_RNG_CHECK_FAILED   _HRESULT_TYPEDEF_(0x80290119L)

//
//   TBS implementation error codes {0x0200..0x02ff}
//
//
// MessageId: TBSIMP_E_BUFFER_TOO_SMALL
//
// MessageText:
//
// The specified buffer was too small.
//
#define TBSIMP_E_BUFFER_TOO_SMALL        _HRESULT_TYPEDEF_(0x80290200L)

//
// MessageId: TBSIMP_E_CLEANUP_FAILED
//
// MessageText:
//
// The context could not be cleaned up.
//
#define TBSIMP_E_CLEANUP_FAILED          _HRESULT_TYPEDEF_(0x80290201L)

//
// MessageId: TBSIMP_E_INVALID_CONTEXT_HANDLE
//
// MessageText:
//
// The specified context handle is invalid.
//
#define TBSIMP_E_INVALID_CONTEXT_HANDLE  _HRESULT_TYPEDEF_(0x80290202L)

//
// MessageId: TBSIMP_E_INVALID_CONTEXT_PARAM
//
// MessageText:
//
// An invalid context parameter was specified.
//
#define TBSIMP_E_INVALID_CONTEXT_PARAM   _HRESULT_TYPEDEF_(0x80290203L)

//
// MessageId: TBSIMP_E_TPM_ERROR
//
// MessageText:
//
// An error occurred while communicating with the TPM
//
#define TBSIMP_E_TPM_ERROR               _HRESULT_TYPEDEF_(0x80290204L)

//
// MessageId: TBSIMP_E_HASH_BAD_KEY
//
// MessageText:
//
// No entry with the specified key was found.
//
#define TBSIMP_E_HASH_BAD_KEY            _HRESULT_TYPEDEF_(0x80290205L)

//
// MessageId: TBSIMP_E_DUPLICATE_VHANDLE
//
// MessageText:
//
// The specified virtual handle matches a virtual handle already in use.
//
#define TBSIMP_E_DUPLICATE_VHANDLE       _HRESULT_TYPEDEF_(0x80290206L)

//
// MessageId: TBSIMP_E_INVALID_OUTPUT_POINTER
//
// MessageText:
//
// The pointer to the returned handle location was NULL or invalid
//
#define TBSIMP_E_INVALID_OUTPUT_POINTER  _HRESULT_TYPEDEF_(0x80290207L)

//
// MessageId: TBSIMP_E_INVALID_PARAMETER
//
// MessageText:
//
// One or more parameters is invalid
//
#define TBSIMP_E_INVALID_PARAMETER       _HRESULT_TYPEDEF_(0x80290208L)

//
// MessageId: TBSIMP_E_RPC_INIT_FAILED
//
// MessageText:
//
// The RPC subsystem could not be initialized.
//
#define TBSIMP_E_RPC_INIT_FAILED         _HRESULT_TYPEDEF_(0x80290209L)

//
// MessageId: TBSIMP_E_SCHEDULER_NOT_RUNNING
//
// MessageText:
//
// The TBS scheduler is not running.
//
#define TBSIMP_E_SCHEDULER_NOT_RUNNING   _HRESULT_TYPEDEF_(0x8029020AL)

//
// MessageId: TBSIMP_E_COMMAND_CANCELED
//
// MessageText:
//
// The command was canceled.
//
#define TBSIMP_E_COMMAND_CANCELED        _HRESULT_TYPEDEF_(0x8029020BL)

//
// MessageId: TBSIMP_E_OUT_OF_MEMORY
//
// MessageText:
//
// There was not enough memory to fulfill the request
//
#define TBSIMP_E_OUT_OF_MEMORY           _HRESULT_TYPEDEF_(0x8029020CL)

//
// MessageId: TBSIMP_E_LIST_NO_MORE_ITEMS
//
// MessageText:
//
// The specified list is empty, or the iteration has reached the end of the list.
//
#define TBSIMP_E_LIST_NO_MORE_ITEMS      _HRESULT_TYPEDEF_(0x8029020DL)

//
// MessageId: TBSIMP_E_LIST_NOT_FOUND
//
// MessageText:
//
// The specified item was not found in the list.
//
#define TBSIMP_E_LIST_NOT_FOUND          _HRESULT_TYPEDEF_(0x8029020EL)

//
// MessageId: TBSIMP_E_NOT_ENOUGH_SPACE
//
// MessageText:
//
// The TPM does not have enough space to load the requested resource.
//
#define TBSIMP_E_NOT_ENOUGH_SPACE        _HRESULT_TYPEDEF_(0x8029020FL)

//
// MessageId: TBSIMP_E_NOT_ENOUGH_TPM_CONTEXTS
//
// MessageText:
//
// There are too many TPM contexts in use.
//
#define TBSIMP_E_NOT_ENOUGH_TPM_CONTEXTS _HRESULT_TYPEDEF_(0x80290210L)

//
// MessageId: TBSIMP_E_COMMAND_FAILED
//
// MessageText:
//
// The TPM command failed.
//
#define TBSIMP_E_COMMAND_FAILED          _HRESULT_TYPEDEF_(0x80290211L)

//
// MessageId: TBSIMP_E_UNKNOWN_ORDINAL
//
// MessageText:
//
// The TBS does not recognize the specified ordinal.
//
#define TBSIMP_E_UNKNOWN_ORDINAL         _HRESULT_TYPEDEF_(0x80290212L)

//
// MessageId: TBSIMP_E_RESOURCE_EXPIRED
//
// MessageText:
//
// The requested resource is no longer available.
//
#define TBSIMP_E_RESOURCE_EXPIRED        _HRESULT_TYPEDEF_(0x80290213L)

//
// MessageId: TBSIMP_E_INVALID_RESOURCE
//
// MessageText:
//
// The resource type did not match.
//
#define TBSIMP_E_INVALID_RESOURCE        _HRESULT_TYPEDEF_(0x80290214L)

//
// MessageId: TBSIMP_E_NOTHING_TO_UNLOAD
//
// MessageText:
//
// No resources can be unloaded.
//
#define TBSIMP_E_NOTHING_TO_UNLOAD       _HRESULT_TYPEDEF_(0x80290215L)

//
// MessageId: TBSIMP_E_HASH_TABLE_FULL
//
// MessageText:
//
// No new entries can be added to the hash table.
//
#define TBSIMP_E_HASH_TABLE_FULL         _HRESULT_TYPEDEF_(0x80290216L)

//
// MessageId: TBSIMP_E_TOO_MANY_TBS_CONTEXTS
//
// MessageText:
//
// A new TBS context could not be created because there are too many open contexts.
//
#define TBSIMP_E_TOO_MANY_TBS_CONTEXTS   _HRESULT_TYPEDEF_(0x80290217L)

//
// MessageId: TBSIMP_E_TOO_MANY_RESOURCES
//
// MessageText:
//
// A new virtual resource could not be created because there are too many open virtual resources.
//
#define TBSIMP_E_TOO_MANY_RESOURCES      _HRESULT_TYPEDEF_(0x80290218L)

//
// MessageId: TBSIMP_E_PPI_NOT_SUPPORTED
//
// MessageText:
//
// The physical presence interface is not supported.
//
#define TBSIMP_E_PPI_NOT_SUPPORTED       _HRESULT_TYPEDEF_(0x80290219L)

//
// MessageId: TBSIMP_E_TPM_INCOMPATIBLE
//
// MessageText:
//
// TBS is not compatible with the version of TPM found on the system.
//
#define TBSIMP_E_TPM_INCOMPATIBLE        _HRESULT_TYPEDEF_(0x8029021AL)

//
//   TPM Physical Presence implementation error codes {0x0300..0x03ff}
//
//
// MessageId: TPM_E_PPI_ACPI_FAILURE
//
// MessageText:
//
// A general error was detected when attempting to acquire the BIOS's response to a Physical Presence command.
//
#define TPM_E_PPI_ACPI_FAILURE           _HRESULT_TYPEDEF_(0x80290300L)

//
// MessageId: TPM_E_PPI_USER_ABORT
//
// MessageText:
//
// The user failed to confirm the TPM operation request.
//
#define TPM_E_PPI_USER_ABORT             _HRESULT_TYPEDEF_(0x80290301L)

//
// MessageId: TPM_E_PPI_BIOS_FAILURE
//
// MessageText:
//
// The BIOS failure prevented the successful execution of the requested TPM operation (e.g. invalid TPM operation request, BIOS communication error with the TPM).
//
#define TPM_E_PPI_BIOS_FAILURE           _HRESULT_TYPEDEF_(0x80290302L)

//
// MessageId: TPM_E_PPI_NOT_SUPPORTED
//
// MessageText:
//
// The BIOS does not support the physical presence interface.
//
#define TPM_E_PPI_NOT_SUPPORTED          _HRESULT_TYPEDEF_(0x80290303L)

//
// =======================================================
// Facility Performance Logs & Alerts (PLA) Error Messages
// =======================================================
//
//
// MessageId: PLA_E_DCS_NOT_FOUND
//
// MessageText:
//
// Data Collector Set was not found.
//
#define PLA_E_DCS_NOT_FOUND              _HRESULT_TYPEDEF_(0x80300002L)

//
// MessageId: PLA_E_DCS_IN_USE
//
// MessageText:
//
// The Data Collector Set or one of its dependencies is already in use.
//
#define PLA_E_DCS_IN_USE                 _HRESULT_TYPEDEF_(0x803000AAL)

//
// MessageId: PLA_E_TOO_MANY_FOLDERS
//
// MessageText:
//
// Unable to start Data Collector Set because there are too many folders.
//
#define PLA_E_TOO_MANY_FOLDERS           _HRESULT_TYPEDEF_(0x80300045L)

//
// MessageId: PLA_E_NO_MIN_DISK
//
// MessageText:
//
// Not enough free disk space to start Data Collector Set.
//
#define PLA_E_NO_MIN_DISK                _HRESULT_TYPEDEF_(0x80300070L)

//
// MessageId: PLA_E_DCS_ALREADY_EXISTS
//
// MessageText:
//
// Data Collector Set already exists.
//
#define PLA_E_DCS_ALREADY_EXISTS         _HRESULT_TYPEDEF_(0x803000B7L)

//
// MessageId: PLA_S_PROPERTY_IGNORED
//
// MessageText:
//
// Property value will be ignored.
//
#define PLA_S_PROPERTY_IGNORED           _HRESULT_TYPEDEF_(0x00300100L)

//
// MessageId: PLA_E_PROPERTY_CONFLICT
//
// MessageText:
//
// Property value conflict.
//
#define PLA_E_PROPERTY_CONFLICT          _HRESULT_TYPEDEF_(0x80300101L)

//
// MessageId: PLA_E_DCS_SINGLETON_REQUIRED
//
// MessageText:
//
// The current configuration for this Data Collector Set requires that it contain exactly one Data Collector.
//
#define PLA_E_DCS_SINGLETON_REQUIRED     _HRESULT_TYPEDEF_(0x80300102L)

//
// MessageId: PLA_E_CREDENTIALS_REQUIRED
//
// MessageText:
//
// A user account is required in order to commit the current Data Collector Set properties.
//
#define PLA_E_CREDENTIALS_REQUIRED       _HRESULT_TYPEDEF_(0x80300103L)

//
// MessageId: PLA_E_DCS_NOT_RUNNING
//
// MessageText:
//
// Data Collector Set is not running.
//
#define PLA_E_DCS_NOT_RUNNING            _HRESULT_TYPEDEF_(0x80300104L)

//
// MessageId: PLA_E_CONFLICT_INCL_EXCL_API
//
// MessageText:
//
// A conflict was detected in the list of include/exclude APIs. Do not specify the same API in both the include list and the exclude list.
//
#define PLA_E_CONFLICT_INCL_EXCL_API     _HRESULT_TYPEDEF_(0x80300105L)

//
// MessageId: PLA_E_NETWORK_EXE_NOT_VALID
//
// MessageText:
//
// The executable path you have specified refers to a network share or UNC path.
//
#define PLA_E_NETWORK_EXE_NOT_VALID      _HRESULT_TYPEDEF_(0x80300106L)

//
// MessageId: PLA_E_EXE_ALREADY_CONFIGURED
//
// MessageText:
//
// The executable path you have specified is already configured for API tracing.
//
#define PLA_E_EXE_ALREADY_CONFIGURED     _HRESULT_TYPEDEF_(0x80300107L)

//
// MessageId: PLA_E_EXE_PATH_NOT_VALID
//
// MessageText:
//
// The executable path you have specified does not exist. Verify that the specified path is correct.
//
#define PLA_E_EXE_PATH_NOT_VALID         _HRESULT_TYPEDEF_(0x80300108L)

//
// MessageId: PLA_E_DC_ALREADY_EXISTS
//
// MessageText:
//
// Data Collector already exists.
//
#define PLA_E_DC_ALREADY_EXISTS          _HRESULT_TYPEDEF_(0x80300109L)

//
// MessageId: PLA_E_DCS_START_WAIT_TIMEOUT
//
// MessageText:
//
// The wait for the Data Collector Set start notification has timed out.
//
#define PLA_E_DCS_START_WAIT_TIMEOUT     _HRESULT_TYPEDEF_(0x8030010AL)

//
// MessageId: PLA_E_DC_START_WAIT_TIMEOUT
//
// MessageText:
//
// The wait for the Data Collector to start has timed out.
//
#define PLA_E_DC_START_WAIT_TIMEOUT      _HRESULT_TYPEDEF_(0x8030010BL)

//
// MessageId: PLA_E_REPORT_WAIT_TIMEOUT
//
// MessageText:
//
// The wait for the report generation tool to finish has timed out.
//
#define PLA_E_REPORT_WAIT_TIMEOUT        _HRESULT_TYPEDEF_(0x8030010CL)

//
// MessageId: PLA_E_NO_DUPLICATES
//
// MessageText:
//
// Duplicate items are not allowed.
//
#define PLA_E_NO_DUPLICATES              _HRESULT_TYPEDEF_(0x8030010DL)

//
// MessageId: PLA_E_EXE_FULL_PATH_REQUIRED
//
// MessageText:
//
// When specifying the executable that you want to trace, you must specify a full path to the executable and not just a filename.
//
#define PLA_E_EXE_FULL_PATH_REQUIRED     _HRESULT_TYPEDEF_(0x8030010EL)

//
// MessageId: PLA_E_INVALID_SESSION_NAME
//
// MessageText:
//
// The session name provided is invalid.
//
#define PLA_E_INVALID_SESSION_NAME       _HRESULT_TYPEDEF_(0x8030010FL)

//
// MessageId: PLA_E_PLA_CHANNEL_NOT_ENABLED
//
// MessageText:
//
// The Event Log channel Microsoft-Windows-Diagnosis-PLA/Operational must be enabled to perform this operation.
//
#define PLA_E_PLA_CHANNEL_NOT_ENABLED    _HRESULT_TYPEDEF_(0x80300110L)

//
// MessageId: PLA_E_TASKSCHED_CHANNEL_NOT_ENABLED
//
// MessageText:
//
// The Event Log channel Microsoft-Windows-TaskScheduler must be enabled to perform this operation.
//
#define PLA_E_TASKSCHED_CHANNEL_NOT_ENABLED _HRESULT_TYPEDEF_(0x80300111L)

//
// MessageId: PLA_E_RULES_MANAGER_FAILED
//
// MessageText:
//
// The execution of the Rules Manager failed.
//
#define PLA_E_RULES_MANAGER_FAILED       _HRESULT_TYPEDEF_(0x80300112L)

//
// MessageId: PLA_E_CABAPI_FAILURE
//
// MessageText:
//
// An error occured while attemption to compress or extract the data.
//
#define PLA_E_CABAPI_FAILURE             _HRESULT_TYPEDEF_(0x80300113L)

//
// =======================================================
// Full Volume Encryption Error Messages
// =======================================================
//
//
// MessageId: FVE_E_LOCKED_VOLUME
//
// MessageText:
//
// This volume is locked by BitLocker Drive Encryption. Return to the control panel to unlock volume.
//
#define FVE_E_LOCKED_VOLUME              _HRESULT_TYPEDEF_(0x80310000L)

//
// MessageId: FVE_E_NOT_ENCRYPTED
//
// MessageText:
//
// The volume is not encrypted, no key is available.
//
#define FVE_E_NOT_ENCRYPTED              _HRESULT_TYPEDEF_(0x80310001L)

//
// MessageId: FVE_E_NO_TPM_BIOS
//
// MessageText:
//
// The BIOS did not correctly communicate with the TPM. Contact the computer manufacturer for BIOS upgrade instructions.
//
#define FVE_E_NO_TPM_BIOS                _HRESULT_TYPEDEF_(0x80310002L)

//
// MessageId: FVE_E_NO_MBR_METRIC
//
// MessageText:
//
// The BIOS did not correctly communicate with the Master Boot Record (MBR). Contact the computer manufacturer for BIOS upgrade instructions.
//
#define FVE_E_NO_MBR_METRIC              _HRESULT_TYPEDEF_(0x80310003L)

//
// MessageId: FVE_E_NO_BOOTSECTOR_METRIC
//
// MessageText:
//
// If there is a bootable CD or DVD in your computer, remove it, restart the computer and turn on BitLocker again. If the problem persists contact the computer manufacturer for BIOS upgrade instructions.
//
#define FVE_E_NO_BOOTSECTOR_METRIC       _HRESULT_TYPEDEF_(0x80310004L)

//
// MessageId: FVE_E_NO_BOOTMGR_METRIC
//
// MessageText:
//
// You have an incompatible boot sector.  Update the boot manager (BOOTMGR).
//
#define FVE_E_NO_BOOTMGR_METRIC          _HRESULT_TYPEDEF_(0x80310005L)

//
// MessageId: FVE_E_WRONG_BOOTMGR
//
// MessageText:
//
// You have an incompatible boot manager. Update the boot manager (BOOTMGR).
//
#define FVE_E_WRONG_BOOTMGR              _HRESULT_TYPEDEF_(0x80310006L)

//
// MessageId: FVE_E_SECURE_KEY_REQUIRED
//
// MessageText:
//
// No secure key protector has been defined.
//
#define FVE_E_SECURE_KEY_REQUIRED        _HRESULT_TYPEDEF_(0x80310007L)

//
// MessageId: FVE_E_NOT_ACTIVATED
//
// MessageText:
//
// BitLocker Drive Encryption is not enabled on this volume. Turn on BitLocker.
//
#define FVE_E_NOT_ACTIVATED              _HRESULT_TYPEDEF_(0x80310008L)

//
// MessageId: FVE_E_ACTION_NOT_ALLOWED
//
// MessageText:
//
// BitLocker Drive Encryption could not perform requested action. This condition may occur when two requests are issued at the same time.
//
#define FVE_E_ACTION_NOT_ALLOWED         _HRESULT_TYPEDEF_(0x80310009L)

//
// MessageId: FVE_E_AD_SCHEMA_NOT_INSTALLED
//
// MessageText:
//
// The Active Directory Domain Services forest does not contain the required attributes and classes to host BitLocker Drive Encryption or Trusted Platform Module information.
//
#define FVE_E_AD_SCHEMA_NOT_INSTALLED    _HRESULT_TYPEDEF_(0x8031000AL)

//
// MessageId: FVE_E_AD_INVALID_DATATYPE
//
// MessageText:
//
// The type of the data obtained from Active Directory was not expected.
//
#define FVE_E_AD_INVALID_DATATYPE        _HRESULT_TYPEDEF_(0x8031000BL)

//
// MessageId: FVE_E_AD_INVALID_DATASIZE
//
// MessageText:
//
// The size of the data obtained from Active Directory was not expected.
//
#define FVE_E_AD_INVALID_DATASIZE        _HRESULT_TYPEDEF_(0x8031000CL)

//
// MessageId: FVE_E_AD_NO_VALUES
//
// MessageText:
//
// The attribute read from Active Directory has no (zero) values.
//
#define FVE_E_AD_NO_VALUES               _HRESULT_TYPEDEF_(0x8031000DL)

//
// MessageId: FVE_E_AD_ATTR_NOT_SET
//
// MessageText:
//
// The attribute was not set.
//
#define FVE_E_AD_ATTR_NOT_SET            _HRESULT_TYPEDEF_(0x8031000EL)

//
// MessageId: FVE_E_AD_GUID_NOT_FOUND
//
// MessageText:
//
// The specified GUID could not be found.
//
#define FVE_E_AD_GUID_NOT_FOUND          _HRESULT_TYPEDEF_(0x8031000FL)

//
// MessageId: FVE_E_BAD_INFORMATION
//
// MessageText:
//
// The control block for the encrypted volume is not valid.
//
#define FVE_E_BAD_INFORMATION            _HRESULT_TYPEDEF_(0x80310010L)

//
// MessageId: FVE_E_TOO_SMALL
//
// MessageText:
//
// The volume cannot be encrypted because it does not have enough free space.
//
#define FVE_E_TOO_SMALL                  _HRESULT_TYPEDEF_(0x80310011L)

//
// MessageId: FVE_E_SYSTEM_VOLUME
//
// MessageText:
//
// The volume cannot be encrypted because it contains system boot information.
//
#define FVE_E_SYSTEM_VOLUME              _HRESULT_TYPEDEF_(0x80310012L)

//
// MessageId: FVE_E_FAILED_WRONG_FS
//
// MessageText:
//
// The volume cannot be encrypted because the file system is not supported.
//
#define FVE_E_FAILED_WRONG_FS            _HRESULT_TYPEDEF_(0x80310013L)

//
// MessageId: FVE_E_FAILED_BAD_FS
//
// MessageText:
//
// The file system is corrupt. Run CHKDSK.
//
#define FVE_E_FAILED_BAD_FS              _HRESULT_TYPEDEF_(0x80310014L)

//
// MessageId: FVE_E_NOT_SUPPORTED
//
// MessageText:
//
// This volume cannot be encrypted.
//
#define FVE_E_NOT_SUPPORTED              _HRESULT_TYPEDEF_(0x80310015L)

//
// MessageId: FVE_E_BAD_DATA
//
// MessageText:
//
// Data supplied is malformed.
//
#define FVE_E_BAD_DATA                   _HRESULT_TYPEDEF_(0x80310016L)

//
// MessageId: FVE_E_VOLUME_NOT_BOUND
//
// MessageText:
//
// Volume is not bound to the system.
//
#define FVE_E_VOLUME_NOT_BOUND           _HRESULT_TYPEDEF_(0x80310017L)

//
// MessageId: FVE_E_TPM_NOT_OWNED
//
// MessageText:
//
// You must take ownership of the Trusted Platform Module (TPM).
//
#define FVE_E_TPM_NOT_OWNED              _HRESULT_TYPEDEF_(0x80310018L)

//
// MessageId: FVE_E_NOT_DATA_VOLUME
//
// MessageText:
//
// The volume specified is not a data volume.
//
#define FVE_E_NOT_DATA_VOLUME            _HRESULT_TYPEDEF_(0x80310019L)

//
// MessageId: FVE_E_AD_INSUFFICIENT_BUFFER
//
// MessageText:
//
// The buffer supplied to a function was insufficient to contain the returned data.
//
#define FVE_E_AD_INSUFFICIENT_BUFFER     _HRESULT_TYPEDEF_(0x8031001AL)

//
// MessageId: FVE_E_CONV_READ
//
// MessageText:
//
// A read operation failed while converting the volume.
//
#define FVE_E_CONV_READ                  _HRESULT_TYPEDEF_(0x8031001BL)

//
// MessageId: FVE_E_CONV_WRITE
//
// MessageText:
//
// A write operation failed while converting the volume.
//
#define FVE_E_CONV_WRITE                 _HRESULT_TYPEDEF_(0x8031001CL)

//
// MessageId: FVE_E_KEY_REQUIRED
//
// MessageText:
//
// One or more key protectors are required for this volume.
//
#define FVE_E_KEY_REQUIRED               _HRESULT_TYPEDEF_(0x8031001DL)

//
// MessageId: FVE_E_CLUSTERING_NOT_SUPPORTED
//
// MessageText:
//
// Cluster configurations are not supported.
//
#define FVE_E_CLUSTERING_NOT_SUPPORTED   _HRESULT_TYPEDEF_(0x8031001EL)

//
// MessageId: FVE_E_VOLUME_BOUND_ALREADY
//
// MessageText:
//
// The volume is already bound to the system.
//
#define FVE_E_VOLUME_BOUND_ALREADY       _HRESULT_TYPEDEF_(0x8031001FL)

//
// MessageId: FVE_E_OS_NOT_PROTECTED
//
// MessageText:
//
// The operating system volume is not protected by BitLocker Drive Encryption.
//
#define FVE_E_OS_NOT_PROTECTED           _HRESULT_TYPEDEF_(0x80310020L)

//
// MessageId: FVE_E_PROTECTION_DISABLED
//
// MessageText:
//
// All protectors are effectively disabled (clear key exists).
//
#define FVE_E_PROTECTION_DISABLED        _HRESULT_TYPEDEF_(0x80310021L)

//
// MessageId: FVE_E_RECOVERY_KEY_REQUIRED
//
// MessageText:
//
// A recovery key protector is required.
//
#define FVE_E_RECOVERY_KEY_REQUIRED      _HRESULT_TYPEDEF_(0x80310022L)

//
// MessageId: FVE_E_FOREIGN_VOLUME
//
// MessageText:
//
// This volume cannot be bound to a TPM.
//
#define FVE_E_FOREIGN_VOLUME             _HRESULT_TYPEDEF_(0x80310023L)

//
// MessageId: FVE_E_OVERLAPPED_UPDATE
//
// MessageText:
//
// The control block for the encrypted volume was updated by another thread. Try again.
//
#define FVE_E_OVERLAPPED_UPDATE          _HRESULT_TYPEDEF_(0x80310024L)

//
// MessageId: FVE_E_TPM_SRK_AUTH_NOT_ZERO
//
// MessageText:
//
// The authorization data for the Storage Root Key (SRK) of the Trusted Platform Module (TPM) is not zero and is therefore incompatible with BitLocker.
//
#define FVE_E_TPM_SRK_AUTH_NOT_ZERO      _HRESULT_TYPEDEF_(0x80310025L)

//
// MessageId: FVE_E_FAILED_SECTOR_SIZE
//
// MessageText:
//
// The volume encryption algorithm cannot be used on this sector size.
//
#define FVE_E_FAILED_SECTOR_SIZE         _HRESULT_TYPEDEF_(0x80310026L)

//
// MessageId: FVE_E_FAILED_AUTHENTICATION
//
// MessageText:
//
// The recovery information provided does not match required recovery information to unlock the volume. Confirm the information and try again.
//
#define FVE_E_FAILED_AUTHENTICATION      _HRESULT_TYPEDEF_(0x80310027L)

//
// MessageId: FVE_E_NOT_OS_VOLUME
//
// MessageText:
//
// The volume specified is not the operating system volume.
//
#define FVE_E_NOT_OS_VOLUME              _HRESULT_TYPEDEF_(0x80310028L)

//
// MessageId: FVE_E_AUTOUNLOCK_ENABLED
//
// MessageText:
//
// BitLocker Drive Encryption cannot be turned off. Please turn off the auto unlock on all other volumes before turning off BitLocker on the current volume.
//
#define FVE_E_AUTOUNLOCK_ENABLED         _HRESULT_TYPEDEF_(0x80310029L)

//
// MessageId: FVE_E_WRONG_BOOTSECTOR
//
// MessageText:
//
// The system partition boot sector does not perform TPM measurements.
//
#define FVE_E_WRONG_BOOTSECTOR           _HRESULT_TYPEDEF_(0x8031002AL)

//
// MessageId: FVE_E_WRONG_SYSTEM_FS
//
// MessageText:
//
// BitLocker requires the file system to be NTFS. Convert the volume to NTFS, then enable BitLocker.
//
#define FVE_E_WRONG_SYSTEM_FS            _HRESULT_TYPEDEF_(0x8031002BL)

//
// MessageId: FVE_E_POLICY_PASSWORD_REQUIRED
//
// MessageText:
//
// Group policy requires a recovery password before encryption may begin.
//
#define FVE_E_POLICY_PASSWORD_REQUIRED   _HRESULT_TYPEDEF_(0x8031002CL)

//
// MessageId: FVE_E_CANNOT_SET_FVEK_ENCRYPTED
//
// MessageText:
//
// The volume encryption algorithm and key cannot be set on an encrypted volume.
//
#define FVE_E_CANNOT_SET_FVEK_ENCRYPTED  _HRESULT_TYPEDEF_(0x8031002DL)

//
// MessageId: FVE_E_CANNOT_ENCRYPT_NO_KEY
//
// MessageText:
//
// A key must be specified before encryption may begin.
//
#define FVE_E_CANNOT_ENCRYPT_NO_KEY      _HRESULT_TYPEDEF_(0x8031002EL)

//
// MessageId: FVE_E_BOOTABLE_CDDVD
//
// MessageText:
//
// BitLocker Drive Encryption detected bootable media (CD, DVD, or USB) in the computer. Remove the media and restart the computer.
//
#define FVE_E_BOOTABLE_CDDVD             _HRESULT_TYPEDEF_(0x80310030L)

//
// MessageId: FVE_E_PROTECTOR_EXISTS
//
// MessageText:
//
// An instance of this key protector already exists on the volume.
//
#define FVE_E_PROTECTOR_EXISTS           _HRESULT_TYPEDEF_(0x80310031L)

//
// MessageId: FVE_E_RELATIVE_PATH
//
// MessageText:
//
// The file cannot be saved to a relative path.
//
#define FVE_E_RELATIVE_PATH              _HRESULT_TYPEDEF_(0x80310032L)

//
// MessageId: FVE_E_PROTECTOR_NOT_FOUND
//
// MessageText:
//
// The specified key protector was not found on the volume. Try another key protector.
//
#define FVE_E_PROTECTOR_NOT_FOUND        _HRESULT_TYPEDEF_(0x80310033L)

//
// MessageId: FVE_E_INVALID_KEY_FORMAT
//
// MessageText:
//
// The recovery password file on the USB device is corrupt. Try another USB device.
//
#define FVE_E_INVALID_KEY_FORMAT         _HRESULT_TYPEDEF_(0x80310034L)

//
// MessageId: FVE_E_INVALID_PASSWORD_FORMAT
//
// MessageText:
//
// The format of the recovery password file is invalid. Select another recovery password and try again.
//
#define FVE_E_INVALID_PASSWORD_FORMAT    _HRESULT_TYPEDEF_(0x80310035L)

//
// MessageId: FVE_E_FIPS_RNG_CHECK_FAILED
//
// MessageText:
//
// The random number generator check test failed.
//
#define FVE_E_FIPS_RNG_CHECK_FAILED      _HRESULT_TYPEDEF_(0x80310036L)

//
// MessageId: FVE_E_FIPS_PREVENTS_RECOVERY_PASSWORD
//
// MessageText:
//
// The group policy setting requiring FIPS compliance prevented the recovery password from being generated or used. Please contact your domain administrator for more information.
//
#define FVE_E_FIPS_PREVENTS_RECOVERY_PASSWORD _HRESULT_TYPEDEF_(0x80310037L)

//
// MessageId: FVE_E_FIPS_PREVENTS_EXTERNAL_KEY_EXPORT
//
// MessageText:
//
// The group policy setting requiring FIPS compliance prevented the recovery password from being saved. Please contact your domain administrator for more information.
//
#define FVE_E_FIPS_PREVENTS_EXTERNAL_KEY_EXPORT _HRESULT_TYPEDEF_(0x80310038L)

//
// MessageId: FVE_E_NOT_DECRYPTED
//
// MessageText:
//
// The volume must be fully decrypted to complete this operation.
//
#define FVE_E_NOT_DECRYPTED              _HRESULT_TYPEDEF_(0x80310039L)

//
// MessageId: FVE_E_INVALID_PROTECTOR_TYPE
//
// MessageText:
//
// The specified key protector is not of the correct type.
//
#define FVE_E_INVALID_PROTECTOR_TYPE     _HRESULT_TYPEDEF_(0x8031003AL)

//
// MessageId: FVE_E_NO_PROTECTORS_TO_TEST
//
// MessageText:
//
// No TPM protectors exist on the volume to perform the hardware test.
//
#define FVE_E_NO_PROTECTORS_TO_TEST      _HRESULT_TYPEDEF_(0x8031003BL)

//
// MessageId: FVE_E_KEYFILE_NOT_FOUND
//
// MessageText:
//
// The BitLocker startup key or recovery password could not be read from the USB device. Ensure the USB device is plugged into the computer, then turn on BitLocker and try again. If the problem persists contact the computer manufacturer for BIOS upgrade instructions.
//
#define FVE_E_KEYFILE_NOT_FOUND          _HRESULT_TYPEDEF_(0x8031003CL)

//
// MessageId: FVE_E_KEYFILE_INVALID
//
// MessageText:
//
// The BitLocker startup key or recovery password file is corrupt or invalid.
//
#define FVE_E_KEYFILE_INVALID            _HRESULT_TYPEDEF_(0x8031003DL)

//
// MessageId: FVE_E_KEYFILE_NO_VMK
//
// MessageText:
//
// The BitLocker encryption key could not be obtained from the startup key or recovery password.
//
#define FVE_E_KEYFILE_NO_VMK             _HRESULT_TYPEDEF_(0x8031003EL)

//
// MessageId: FVE_E_TPM_DISABLED
//
// MessageText:
//
// The Trusted Platform Module (TPM) is disabled.
//
#define FVE_E_TPM_DISABLED               _HRESULT_TYPEDEF_(0x8031003FL)

//
// MessageId: FVE_E_NOT_ALLOWED_IN_SAFE_MODE
//
// MessageText:
//
// BitLocker Drive Encryption can only be used for recovery purposes in Safe-Mode.
//
#define FVE_E_NOT_ALLOWED_IN_SAFE_MODE   _HRESULT_TYPEDEF_(0x80310040L)

//
// MessageId: FVE_E_TPM_INVALID_PCR
//
// MessageText:
//
// The Trusted Platform Module (TPM) was not able to unlock the volume because the system boot information changed.
//
#define FVE_E_TPM_INVALID_PCR            _HRESULT_TYPEDEF_(0x80310041L)

//
// MessageId: FVE_E_TPM_NO_VMK
//
// MessageText:
//
// The BitLocker encryption key could not be obtained from the Trusted Platform Module (TPM).
//
#define FVE_E_TPM_NO_VMK                 _HRESULT_TYPEDEF_(0x80310042L)

//
// MessageId: FVE_E_PIN_INVALID
//
// MessageText:
//
// The BitLocker encryption key could not be obtained from the Trusted Platform Module (TPM) and PIN.
//
#define FVE_E_PIN_INVALID                _HRESULT_TYPEDEF_(0x80310043L)

//
// MessageId: FVE_E_AUTH_INVALID_APPLICATION
//
// MessageText:
//
// A boot application has changed since BitLocker was enabled.
//
#define FVE_E_AUTH_INVALID_APPLICATION   _HRESULT_TYPEDEF_(0x80310044L)

//
// MessageId: FVE_E_AUTH_INVALID_CONFIG
//
// MessageText:
//
// The Boot Configuration Data (BCD) settings have changed since BitLocker was enabled.
//
#define FVE_E_AUTH_INVALID_CONFIG        _HRESULT_TYPEDEF_(0x80310045L)

//
// MessageId: FVE_E_FIPS_DISABLE_PROTECTION_NOT_ALLOWED
//
// MessageText:
//
// The group policy setting requiring FIPS compliance prevented BitLocker from being disabled. Please contact your domain administrator for more information.
//
#define FVE_E_FIPS_DISABLE_PROTECTION_NOT_ALLOWED _HRESULT_TYPEDEF_(0x80310046L)

//
// MessageId: FVE_E_FS_NOT_EXTENDED
//
// MessageText:
//
// The file system does not extend to the end of the volume.
//
#define FVE_E_FS_NOT_EXTENDED            _HRESULT_TYPEDEF_(0x80310047L)

//
// MessageId: FVE_E_FIRMWARE_TYPE_NOT_SUPPORTED
//
// MessageText:
//
// BitLocker Drive Encryption cannot be enabled on this computer. Contact the computer manufacturer for BIOS upgrade instructions.
//
#define FVE_E_FIRMWARE_TYPE_NOT_SUPPORTED _HRESULT_TYPEDEF_(0x80310048L)

//
// MessageId: FVE_E_NO_LICENSE
//
// MessageText:
//
// This Windows license does not support BitLocker Drive Encryption. To use BitLocker Drive Encryption, please upgrade your Windows license.
//
#define FVE_E_NO_LICENSE                 _HRESULT_TYPEDEF_(0x80310049L)

//
// MessageId: FVE_E_NOT_ON_STACK
//
// MessageText:
//
// Critical BitLocker Drive Encryption system files are not available. Use Windows Startup Repair to restore files.
//
#define FVE_E_NOT_ON_STACK               _HRESULT_TYPEDEF_(0x8031004AL)

//
// MessageId: FVE_E_FS_MOUNTED
//
// MessageText:
//
// This operation cannot be performed while the volume is in use.
//
#define FVE_E_FS_MOUNTED                 _HRESULT_TYPEDEF_(0x8031004BL)

//
// MessageId: FVE_E_TOKEN_NOT_IMPERSONATED
//
// MessageText:
//
// The access token associated with the current thread is not an impersonated token.
//
#define FVE_E_TOKEN_NOT_IMPERSONATED     _HRESULT_TYPEDEF_(0x8031004CL)

//
// MessageId: FVE_E_DRY_RUN_FAILED
//
// MessageText:
//
// The BitLocker encryption key could not be obtained.
//
#define FVE_E_DRY_RUN_FAILED             _HRESULT_TYPEDEF_(0x8031004DL)

//
// MessageId: FVE_E_REBOOT_REQUIRED
//
// MessageText:
//
// No action was taken as a system reboot is required.
//
#define FVE_E_REBOOT_REQUIRED            _HRESULT_TYPEDEF_(0x8031004EL)

//
// MessageId: FVE_E_DEBUGGER_ENABLED
//
// MessageText:
//
// Boot debugging is enabled.  Run bcdedit to turn it off.
//
#define FVE_E_DEBUGGER_ENABLED           _HRESULT_TYPEDEF_(0x8031004FL)

//
// MessageId: FVE_E_RAW_ACCESS
//
// MessageText:
//
// No action was taken as BitLocker Drive Encryption is in raw access mode.
//
#define FVE_E_RAW_ACCESS                 _HRESULT_TYPEDEF_(0x80310050L)

//
// MessageId: FVE_E_RAW_BLOCKED
//
// MessageText:
//
// BitLocker Drive Encryption cannot enter raw access mode for this volume.
//
#define FVE_E_RAW_BLOCKED                _HRESULT_TYPEDEF_(0x80310051L)

//
// MessageId: FVE_E_BCD_APPLICATIONS_PATH_INCORRECT
//
// MessageText:
//
// The path specified in the Boot Configuration Data (BCD) for a BitLocker Drive Encryption integrity-protected application is incorrect. Please verify and correct your BCD settings and try again.
//
#define FVE_E_BCD_APPLICATIONS_PATH_INCORRECT _HRESULT_TYPEDEF_(0x80310052L)

//
// MessageId: FVE_E_NOT_ALLOWED_IN_VERSION
//
// MessageText:
//
// BitLocker Drive Encryption can only be used for recovery purposes in this version of Windows.
//
#define FVE_E_NOT_ALLOWED_IN_VERSION     _HRESULT_TYPEDEF_(0x80310053L)

//
// =======================================================
// Windows Filtering Platform Error Messages
// =======================================================
//
//
// MessageId: FWP_E_CALLOUT_NOT_FOUND
//
// MessageText:
//
// The callout does not exist.
//
#define FWP_E_CALLOUT_NOT_FOUND          _HRESULT_TYPEDEF_(0x80320001L)

//
// MessageId: FWP_E_CONDITION_NOT_FOUND
//
// MessageText:
//
// The filter condition does not exist.
//
#define FWP_E_CONDITION_NOT_FOUND        _HRESULT_TYPEDEF_(0x80320002L)

//
// MessageId: FWP_E_FILTER_NOT_FOUND
//
// MessageText:
//
// The filter does not exist.
//
#define FWP_E_FILTER_NOT_FOUND           _HRESULT_TYPEDEF_(0x80320003L)

//
// MessageId: FWP_E_LAYER_NOT_FOUND
//
// MessageText:
//
// The layer does not exist.
//
#define FWP_E_LAYER_NOT_FOUND            _HRESULT_TYPEDEF_(0x80320004L)

//
// MessageId: FWP_E_PROVIDER_NOT_FOUND
//
// MessageText:
//
// The provider does not exist.
//
#define FWP_E_PROVIDER_NOT_FOUND         _HRESULT_TYPEDEF_(0x80320005L)

//
// MessageId: FWP_E_PROVIDER_CONTEXT_NOT_FOUND
//
// MessageText:
//
// The provider context does not exist.
//
#define FWP_E_PROVIDER_CONTEXT_NOT_FOUND _HRESULT_TYPEDEF_(0x80320006L)

//
// MessageId: FWP_E_SUBLAYER_NOT_FOUND
//
// MessageText:
//
// The sublayer does not exist.
//
#define FWP_E_SUBLAYER_NOT_FOUND         _HRESULT_TYPEDEF_(0x80320007L)

//
// MessageId: FWP_E_NOT_FOUND
//
// MessageText:
//
// The object does not exist.
//
#define FWP_E_NOT_FOUND                  _HRESULT_TYPEDEF_(0x80320008L)

//
// MessageId: FWP_E_ALREADY_EXISTS
//
// MessageText:
//
// An object with that GUID or LUID already exists.
//
#define FWP_E_ALREADY_EXISTS             _HRESULT_TYPEDEF_(0x80320009L)

//
// MessageId: FWP_E_IN_USE
//
// MessageText:
//
// The object is referenced by other objects so cannot be deleted.
//
#define FWP_E_IN_USE                     _HRESULT_TYPEDEF_(0x8032000AL)

//
// MessageId: FWP_E_DYNAMIC_SESSION_IN_PROGRESS
//
// MessageText:
//
// The call is not allowed from within a dynamic session.
//
#define FWP_E_DYNAMIC_SESSION_IN_PROGRESS _HRESULT_TYPEDEF_(0x8032000BL)

//
// MessageId: FWP_E_WRONG_SESSION
//
// MessageText:
//
// The call was made from the wrong session so cannot be completed.
//
#define FWP_E_WRONG_SESSION              _HRESULT_TYPEDEF_(0x8032000CL)

//
// MessageId: FWP_E_NO_TXN_IN_PROGRESS
//
// MessageText:
//
// The call must be made from within an explicit transaction.
//
#define FWP_E_NO_TXN_IN_PROGRESS         _HRESULT_TYPEDEF_(0x8032000DL)

//
// MessageId: FWP_E_TXN_IN_PROGRESS
//
// MessageText:
//
// The call is not allowed from within an explicit transaction.
//
#define FWP_E_TXN_IN_PROGRESS            _HRESULT_TYPEDEF_(0x8032000EL)

//
// MessageId: FWP_E_TXN_ABORTED
//
// MessageText:
//
// The explicit transaction has been forcibly cancelled.
//
#define FWP_E_TXN_ABORTED                _HRESULT_TYPEDEF_(0x8032000FL)

//
// MessageId: FWP_E_SESSION_ABORTED
//
// MessageText:
//
// The session has been cancelled.
//
#define FWP_E_SESSION_ABORTED            _HRESULT_TYPEDEF_(0x80320010L)

//
// MessageId: FWP_E_INCOMPATIBLE_TXN
//
// MessageText:
//
// The call is not allowed from within a read-only transaction.
//
#define FWP_E_INCOMPATIBLE_TXN           _HRESULT_TYPEDEF_(0x80320011L)

//
// MessageId: FWP_E_TIMEOUT
//
// MessageText:
//
// The call timed out while waiting to acquire the transaction lock.
//
#define FWP_E_TIMEOUT                    _HRESULT_TYPEDEF_(0x80320012L)

//
// MessageId: FWP_E_NET_EVENTS_DISABLED
//
// MessageText:
//
// Collection of network diagnostic events is disabled.
//
#define FWP_E_NET_EVENTS_DISABLED        _HRESULT_TYPEDEF_(0x80320013L)

//
// MessageId: FWP_E_INCOMPATIBLE_LAYER
//
// MessageText:
//
// The operation is not supported by the specified layer.
//
#define FWP_E_INCOMPATIBLE_LAYER         _HRESULT_TYPEDEF_(0x80320014L)

//
// MessageId: FWP_E_KM_CLIENTS_ONLY
//
// MessageText:
//
// The call is allowed for kernel-mode callers only.
//
#define FWP_E_KM_CLIENTS_ONLY            _HRESULT_TYPEDEF_(0x80320015L)

//
// MessageId: FWP_E_LIFETIME_MISMATCH
//
// MessageText:
//
// The call tried to associate two objects with incompatible lifetimes.
//
#define FWP_E_LIFETIME_MISMATCH          _HRESULT_TYPEDEF_(0x80320016L)

//
// MessageId: FWP_E_BUILTIN_OBJECT
//
// MessageText:
//
// The object is built in so cannot be deleted.
//
#define FWP_E_BUILTIN_OBJECT             _HRESULT_TYPEDEF_(0x80320017L)

//
// MessageId: FWP_E_TOO_MANY_CALLOUTS
//
// MessageText:
//
// The maximum number of callouts has been reached.
//
#define FWP_E_TOO_MANY_CALLOUTS          _HRESULT_TYPEDEF_(0x80320018L)

//
// MessageId: FWP_E_NOTIFICATION_DROPPED
//
// MessageText:
//
// A notification could not be delivered because a message queue is at its maximum capacity.
//
#define FWP_E_NOTIFICATION_DROPPED       _HRESULT_TYPEDEF_(0x80320019L)

//
// MessageId: FWP_E_TRAFFIC_MISMATCH
//
// MessageText:
//
// The traffic parameters do not match those for the security association context.
//
#define FWP_E_TRAFFIC_MISMATCH           _HRESULT_TYPEDEF_(0x8032001AL)

//
// MessageId: FWP_E_INCOMPATIBLE_SA_STATE
//
// MessageText:
//
// The call is not allowed for the current security association state.
//
#define FWP_E_INCOMPATIBLE_SA_STATE      _HRESULT_TYPEDEF_(0x8032001BL)

//
// MessageId: FWP_E_NULL_POINTER
//
// MessageText:
//
// A required pointer is null.
//
#define FWP_E_NULL_POINTER               _HRESULT_TYPEDEF_(0x8032001CL)

//
// MessageId: FWP_E_INVALID_ENUMERATOR
//
// MessageText:
//
// An enumerator is not valid.
//
#define FWP_E_INVALID_ENUMERATOR         _HRESULT_TYPEDEF_(0x8032001DL)

//
// MessageId: FWP_E_INVALID_FLAGS
//
// MessageText:
//
// The flags field contains an invalid value.
//
#define FWP_E_INVALID_FLAGS              _HRESULT_TYPEDEF_(0x8032001EL)

//
// MessageId: FWP_E_INVALID_NET_MASK
//
// MessageText:
//
// A network mask is not valid.
//
#define FWP_E_INVALID_NET_MASK           _HRESULT_TYPEDEF_(0x8032001FL)

//
// MessageId: FWP_E_INVALID_RANGE
//
// MessageText:
//
// An FWP_RANGE is not valid.
//
#define FWP_E_INVALID_RANGE              _HRESULT_TYPEDEF_(0x80320020L)

//
// MessageId: FWP_E_INVALID_INTERVAL
//
// MessageText:
//
// The time interval is not valid.
//
#define FWP_E_INVALID_INTERVAL           _HRESULT_TYPEDEF_(0x80320021L)

//
// MessageId: FWP_E_ZERO_LENGTH_ARRAY
//
// MessageText:
//
// An array that must contain at least one element is zero length.
//
#define FWP_E_ZERO_LENGTH_ARRAY          _HRESULT_TYPEDEF_(0x80320022L)

//
// MessageId: FWP_E_NULL_DISPLAY_NAME
//
// MessageText:
//
// The displayData.name field cannot be null.
//
#define FWP_E_NULL_DISPLAY_NAME          _HRESULT_TYPEDEF_(0x80320023L)

//
// MessageId: FWP_E_INVALID_ACTION_TYPE
//
// MessageText:
//
// The action type is not one of the allowed action types for a filter.
//
#define FWP_E_INVALID_ACTION_TYPE        _HRESULT_TYPEDEF_(0x80320024L)

//
// MessageId: FWP_E_INVALID_WEIGHT
//
// MessageText:
//
// The filter weight is not valid.
//
#define FWP_E_INVALID_WEIGHT             _HRESULT_TYPEDEF_(0x80320025L)

//
// MessageId: FWP_E_MATCH_TYPE_MISMATCH
//
// MessageText:
//
// A filter condition contains a match type that is not compatible with the operands.
//
#define FWP_E_MATCH_TYPE_MISMATCH        _HRESULT_TYPEDEF_(0x80320026L)

//
// MessageId: FWP_E_TYPE_MISMATCH
//
// MessageText:
//
// An FWP_VALUE or FWPM_CONDITION_VALUE is of the wrong type.
//
#define FWP_E_TYPE_MISMATCH              _HRESULT_TYPEDEF_(0x80320027L)

//
// MessageId: FWP_E_OUT_OF_BOUNDS
//
// MessageText:
//
// An integer value is outside the allowed range.
//
#define FWP_E_OUT_OF_BOUNDS              _HRESULT_TYPEDEF_(0x80320028L)

//
// MessageId: FWP_E_RESERVED
//
// MessageText:
//
// A reserved field is non-zero.
//
#define FWP_E_RESERVED                   _HRESULT_TYPEDEF_(0x80320029L)

//
// MessageId: FWP_E_DUPLICATE_CONDITION
//
// MessageText:
//
// A filter cannot contain multiple conditions operating on a single field.
//
#define FWP_E_DUPLICATE_CONDITION        _HRESULT_TYPEDEF_(0x8032002AL)

//
// MessageId: FWP_E_DUPLICATE_KEYMOD
//
// MessageText:
//
// A policy cannot contain the same keying module more than once.
//
#define FWP_E_DUPLICATE_KEYMOD           _HRESULT_TYPEDEF_(0x8032002BL)

//
// MessageId: FWP_E_ACTION_INCOMPATIBLE_WITH_LAYER
//
// MessageText:
//
// The action type is not compatible with the layer.
//
#define FWP_E_ACTION_INCOMPATIBLE_WITH_LAYER _HRESULT_TYPEDEF_(0x8032002CL)

//
// MessageId: FWP_E_ACTION_INCOMPATIBLE_WITH_SUBLAYER
//
// MessageText:
//
// The action type is not compatible with the sublayer.
//
#define FWP_E_ACTION_INCOMPATIBLE_WITH_SUBLAYER _HRESULT_TYPEDEF_(0x8032002DL)

//
// MessageId: FWP_E_CONTEXT_INCOMPATIBLE_WITH_LAYER
//
// MessageText:
//
// The raw context or the provider context is not compatible with the layer.
//
#define FWP_E_CONTEXT_INCOMPATIBLE_WITH_LAYER _HRESULT_TYPEDEF_(0x8032002EL)

//
// MessageId: FWP_E_CONTEXT_INCOMPATIBLE_WITH_CALLOUT
//
// MessageText:
//
// The raw context or the provider context is not compatible with the callout.
//
#define FWP_E_CONTEXT_INCOMPATIBLE_WITH_CALLOUT _HRESULT_TYPEDEF_(0x8032002FL)

//
// MessageId: FWP_E_INCOMPATIBLE_AUTH_METHOD
//
// MessageText:
//
// The authentication method is not compatible with the policy type.
//
#define FWP_E_INCOMPATIBLE_AUTH_METHOD   _HRESULT_TYPEDEF_(0x80320030L)

//
// MessageId: FWP_E_INCOMPATIBLE_DH_GROUP
//
// MessageText:
//
// The Diffie-Hellman group is not compatible with the policy type.
//
#define FWP_E_INCOMPATIBLE_DH_GROUP      _HRESULT_TYPEDEF_(0x80320031L)

//
// MessageId: FWP_E_EM_NOT_SUPPORTED
//
// MessageText:
//
// An IKE policy cannot contain an Extended Mode policy.
//
#define FWP_E_EM_NOT_SUPPORTED           _HRESULT_TYPEDEF_(0x80320032L)

//
// MessageId: FWP_E_NEVER_MATCH
//
// MessageText:
//
// The enumeration template or subscription will never match any objects.
//
#define FWP_E_NEVER_MATCH                _HRESULT_TYPEDEF_(0x80320033L)

//
// MessageId: FWP_E_PROVIDER_CONTEXT_MISMATCH
//
// MessageText:
//
// The provider context is of the wrong type.
//
#define FWP_E_PROVIDER_CONTEXT_MISMATCH  _HRESULT_TYPEDEF_(0x80320034L)

//
// MessageId: FWP_E_INVALID_PARAMETER
//
// MessageText:
//
// The parameter is incorrect.
//
#define FWP_E_INVALID_PARAMETER          _HRESULT_TYPEDEF_(0x80320035L)

//
// MessageId: FWP_E_TOO_MANY_SUBLAYERS
//
// MessageText:
//
// The maximum number of sublayers has been reached.
//
#define FWP_E_TOO_MANY_SUBLAYERS         _HRESULT_TYPEDEF_(0x80320036L)

//
// MessageId: FWP_E_CALLOUT_NOTIFICATION_FAILED
//
// MessageText:
//
// The notification function for a callout returned an error.
//
#define FWP_E_CALLOUT_NOTIFICATION_FAILED _HRESULT_TYPEDEF_(0x80320037L)

//
// MessageId: FWP_E_INVALID_AUTH_TRANSFORM
//
// MessageText:
//
// The IPsec authentication transform is not valid.
//
#define FWP_E_INVALID_AUTH_TRANSFORM     _HRESULT_TYPEDEF_(0x80320038L)

//
// MessageId: FWP_E_INVALID_CIPHER_TRANSFORM
//
// MessageText:
//
// The IPsec cipher transform is not valid.
//
#define FWP_E_INVALID_CIPHER_TRANSFORM   _HRESULT_TYPEDEF_(0x80320039L)


//
// NDIS error codes (ndis.sys)
//


#ifdef RC_INVOKED
#define _NDIS_ERROR_TYPEDEF_(_sc)  _sc
#else // RC_INVOKED
#define _NDIS_ERROR_TYPEDEF_(_sc)  (DWORD)(_sc)
#endif // RC_INVOKED

//
// MessageId: ERROR_NDIS_INTERFACE_CLOSING
//
// MessageText:
//
// The binding to the network interface is being closed.
//
#define ERROR_NDIS_INTERFACE_CLOSING     _NDIS_ERROR_TYPEDEF_(0x80340002L)

//
// MessageId: ERROR_NDIS_BAD_VERSION
//
// MessageText:
//
// An invalid version was specified.
//
#define ERROR_NDIS_BAD_VERSION           _NDIS_ERROR_TYPEDEF_(0x80340004L)

//
// MessageId: ERROR_NDIS_BAD_CHARACTERISTICS
//
// MessageText:
//
// An invalid characteristics table was used.
//
#define ERROR_NDIS_BAD_CHARACTERISTICS   _NDIS_ERROR_TYPEDEF_(0x80340005L)

//
// MessageId: ERROR_NDIS_ADAPTER_NOT_FOUND
//
// MessageText:
//
// Failed to find the network interface or network interface is not ready.
//
#define ERROR_NDIS_ADAPTER_NOT_FOUND     _NDIS_ERROR_TYPEDEF_(0x80340006L)

//
// MessageId: ERROR_NDIS_OPEN_FAILED
//
// MessageText:
//
// Failed to open the network interface.
//
#define ERROR_NDIS_OPEN_FAILED           _NDIS_ERROR_TYPEDEF_(0x80340007L)

//
// MessageId: ERROR_NDIS_DEVICE_FAILED
//
// MessageText:
//
// Network interface has encountered an internal unrecoverable failure.
//
#define ERROR_NDIS_DEVICE_FAILED         _NDIS_ERROR_TYPEDEF_(0x80340008L)

//
// MessageId: ERROR_NDIS_MULTICAST_FULL
//
// MessageText:
//
// The multicast list on the network interface is full.
//
#define ERROR_NDIS_MULTICAST_FULL        _NDIS_ERROR_TYPEDEF_(0x80340009L)

//
// MessageId: ERROR_NDIS_MULTICAST_EXISTS
//
// MessageText:
//
// An attempt was made to add a duplicate multicast address to the list.
//
#define ERROR_NDIS_MULTICAST_EXISTS      _NDIS_ERROR_TYPEDEF_(0x8034000AL)

//
// MessageId: ERROR_NDIS_MULTICAST_NOT_FOUND
//
// MessageText:
//
// At attempt was made to remove a multicast address that was never added.
//
#define ERROR_NDIS_MULTICAST_NOT_FOUND   _NDIS_ERROR_TYPEDEF_(0x8034000BL)

//
// MessageId: ERROR_NDIS_REQUEST_ABORTED
//
// MessageText:
//
// Netowork interface aborted the request.
//
#define ERROR_NDIS_REQUEST_ABORTED       _NDIS_ERROR_TYPEDEF_(0x8034000CL)

//
// MessageId: ERROR_NDIS_RESET_IN_PROGRESS
//
// MessageText:
//
// Network interface can not process the request because it is being reset.
//
#define ERROR_NDIS_RESET_IN_PROGRESS     _NDIS_ERROR_TYPEDEF_(0x8034000DL)

//
// MessageId: ERROR_NDIS_NOT_SUPPORTED
//
// MessageText:
//
// Netword interface does not support this request.
//
#define ERROR_NDIS_NOT_SUPPORTED         _NDIS_ERROR_TYPEDEF_(0x803400BBL)

//
// MessageId: ERROR_NDIS_INVALID_PACKET
//
// MessageText:
//
// An attempt was made to send an invalid packet on a network interface.
//
#define ERROR_NDIS_INVALID_PACKET        _NDIS_ERROR_TYPEDEF_(0x8034000FL)

//
// MessageId: ERROR_NDIS_ADAPTER_NOT_READY
//
// MessageText:
//
// Network interface is not ready to complete this operation.
//
#define ERROR_NDIS_ADAPTER_NOT_READY     _NDIS_ERROR_TYPEDEF_(0x80340011L)

//
// MessageId: ERROR_NDIS_INVALID_LENGTH
//
// MessageText:
//
// The length of the buffer submitted for this operation is not valid.
//
#define ERROR_NDIS_INVALID_LENGTH        _NDIS_ERROR_TYPEDEF_(0x80340014L)

//
// MessageId: ERROR_NDIS_INVALID_DATA
//
// MessageText:
//
// The data used for this operation is not valid.
//
#define ERROR_NDIS_INVALID_DATA          _NDIS_ERROR_TYPEDEF_(0x80340015L)

//
// MessageId: ERROR_NDIS_BUFFER_TOO_SHORT
//
// MessageText:
//
// The length of buffer submitted for this operation is too small.
//
#define ERROR_NDIS_BUFFER_TOO_SHORT      _NDIS_ERROR_TYPEDEF_(0x80340016L)

//
// MessageId: ERROR_NDIS_INVALID_OID
//
// MessageText:
//
// Network interface does not support this OID (Object Identifier)
//
#define ERROR_NDIS_INVALID_OID           _NDIS_ERROR_TYPEDEF_(0x80340017L)

//
// MessageId: ERROR_NDIS_ADAPTER_REMOVED
//
// MessageText:
//
// The network interface has been removed.
//
#define ERROR_NDIS_ADAPTER_REMOVED       _NDIS_ERROR_TYPEDEF_(0x80340018L)

//
// MessageId: ERROR_NDIS_UNSUPPORTED_MEDIA
//
// MessageText:
//
// Network interface does not support this media type.
//
#define ERROR_NDIS_UNSUPPORTED_MEDIA     _NDIS_ERROR_TYPEDEF_(0x80340019L)

//
// MessageId: ERROR_NDIS_GROUP_ADDRESS_IN_USE
//
// MessageText:
//
// An attempt was made to remove a token ring group address that is in use by other components.
//
#define ERROR_NDIS_GROUP_ADDRESS_IN_USE  _NDIS_ERROR_TYPEDEF_(0x8034001AL)

//
// MessageId: ERROR_NDIS_FILE_NOT_FOUND
//
// MessageText:
//
// An attempt was made to map a file that can not be found.
//
#define ERROR_NDIS_FILE_NOT_FOUND        _NDIS_ERROR_TYPEDEF_(0x8034001BL)

//
// MessageId: ERROR_NDIS_ERROR_READING_FILE
//
// MessageText:
//
// An error occured while NDIS tried to map the file.
//
#define ERROR_NDIS_ERROR_READING_FILE    _NDIS_ERROR_TYPEDEF_(0x8034001CL)

//
// MessageId: ERROR_NDIS_ALREADY_MAPPED
//
// MessageText:
//
// An attempt was made to map a file that is alreay mapped.
//
#define ERROR_NDIS_ALREADY_MAPPED        _NDIS_ERROR_TYPEDEF_(0x8034001DL)

//
// MessageId: ERROR_NDIS_RESOURCE_CONFLICT
//
// MessageText:
//
// An attempt to allocate a hardware resource failed because the resource is used by another component.
//
#define ERROR_NDIS_RESOURCE_CONFLICT     _NDIS_ERROR_TYPEDEF_(0x8034001EL)

//
// MessageId: ERROR_NDIS_MEDIA_DISCONNECTED
//
// MessageText:
//
// The I/O operation failed because network media is disconnected or wireless access point is out of range.
//
#define ERROR_NDIS_MEDIA_DISCONNECTED    _NDIS_ERROR_TYPEDEF_(0x8034001FL)

//
// MessageId: ERROR_NDIS_INVALID_ADDRESS
//
// MessageText:
//
// The network address used in the request is invalid.
//
#define ERROR_NDIS_INVALID_ADDRESS       _NDIS_ERROR_TYPEDEF_(0x80340022L)

//
// MessageId: ERROR_NDIS_INVALID_DEVICE_REQUEST
//
// MessageText:
//
// The specified request is not a valid operation for the target device.
//
#define ERROR_NDIS_INVALID_DEVICE_REQUEST _NDIS_ERROR_TYPEDEF_(0x80340010L)

//
// MessageId: ERROR_NDIS_PAUSED
//
// MessageText:
//
// The offload operation on the network interface has been paused.
//
#define ERROR_NDIS_PAUSED                _NDIS_ERROR_TYPEDEF_(0x8034002AL)

//
// MessageId: ERROR_NDIS_INTERFACE_NOT_FOUND
//
// MessageText:
//
// Network interface was not found.
//
#define ERROR_NDIS_INTERFACE_NOT_FOUND   _NDIS_ERROR_TYPEDEF_(0x8034002BL)

//
// MessageId: ERROR_NDIS_UNSUPPORTED_REVISION
//
// MessageText:
//
// The revision number specified in the structure is not supported.
//
#define ERROR_NDIS_UNSUPPORTED_REVISION  _NDIS_ERROR_TYPEDEF_(0x8034002CL)

//
// MessageId: ERROR_NDIS_INVALID_PORT
//
// MessageText:
//
// The specified port does not exist on this network interface.
//
#define ERROR_NDIS_INVALID_PORT          _NDIS_ERROR_TYPEDEF_(0x8034002DL)

//
// MessageId: ERROR_NDIS_INVALID_PORT_STATE
//
// MessageText:
//
// The current state of the specified port on this network interface does not support the requested operation.
//
#define ERROR_NDIS_INVALID_PORT_STATE    _NDIS_ERROR_TYPEDEF_(0x8034002EL)

//
// MessageId: ERROR_NDIS_LOW_POWER_STATE
//
// MessageText:
//
// The miniport adapter is in low power state.
//
#define ERROR_NDIS_LOW_POWER_STATE       _NDIS_ERROR_TYPEDEF_(0x8034002FL)


//
// NDIS error codes (802.11 wireless LAN)
//

//
// MessageId: ERROR_NDIS_DOT11_AUTO_CONFIG_ENABLED
//
// MessageText:
//
// The wireless local area network interface is in auto configuration mode and doesn't support the requested parameter change operation.
//
#define ERROR_NDIS_DOT11_AUTO_CONFIG_ENABLED _NDIS_ERROR_TYPEDEF_(0x80342000L)

//
// MessageId: ERROR_NDIS_DOT11_MEDIA_IN_USE
//
// MessageText:
//
// The wireless local area network interface is busy and can not perform the requested operation.
//
#define ERROR_NDIS_DOT11_MEDIA_IN_USE    _NDIS_ERROR_TYPEDEF_(0x80342001L)

//
// MessageId: ERROR_NDIS_DOT11_POWER_STATE_INVALID
//
// MessageText:
//
// The wireless local area network interface is power down and doesn't support the requested operation.
//
#define ERROR_NDIS_DOT11_POWER_STATE_INVALID _NDIS_ERROR_TYPEDEF_(0x80342002L)

//
// NDIS informational code (ndis.sys)
//

//
// MessageId: ERROR_NDIS_INDICATION_REQUIRED
//
// MessageText:
//
// The request will be completed later by NDIS status indication.
//
#define ERROR_NDIS_INDICATION_REQUIRED   _NDIS_ERROR_TYPEDEF_(0x00340001L)

