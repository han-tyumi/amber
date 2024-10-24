pub type Error {
  /// Raised when attempting to open a server listener on an address and port
  /// that already has a listener.
  ///
  AddrInUse

  /// Raised when the underlying operating system reports an EADDRNOTAVAIL
  /// error.
  ///
  AddrNotAvailable

  /// Raised when trying to create a resource, like a file, that already exists.
  ///
  AlreadyExists

  /// The underlying IO resource is invalid or closed, and so the operation
  /// could not be performed.
  ///
  BadResource

  /// Raised when trying to write to a resource and a broken pipe error occurs.
  /// This can happen when trying to write directly to stdout or stderr
  /// and the operating system is unable to pipe the output for a reason
  /// external to the Deno runtime.
  ///
  BrokenPipe

  /// Raised when the underlying IO resource is not available because it is
  /// being awaited on in another block of code.
  ///
  Busy

  /// Raised when the underlying operating system reports an ECONNABORTED
  /// error.
  ///
  ConnectionAborted

  /// Raised when the underlying operating system reports that a connection to
  /// a resource is refused.
  ///
  ConnectionRefused

  /// Raised when the underlying operating system reports that a connection has
  /// been reset. With network servers, it can be a normal occurrence where a
  /// client will abort a connection instead of properly shutting it down.
  ///
  ConnectionReset

  /// Raised when too many symbolic links were encountered when resolving the
  /// filename.
  ///
  FilesystemLoop

  /// Raised in situations where when attempting to load a dynamic import,
  /// too many redirects were encountered.
  ///
  Http

  /// Raised when the underlying operating system reports an EINTR error. In
  /// many cases, this underlying IO error will be handled internally within
  /// Deno, or result in an @{link BadResource} error instead.
  ///
  Interrupted

  /// Raised when an operation to returns data that is invalid for the
  /// operation being performed.
  ///
  InvalidData

  /// Raised when trying to open, create or write to a directory.
  ///
  IsADirectory

  /// Raised when performing a socket operation but the remote host is
  /// not reachable.
  ///
  NetworkUnreachable

  /// Raised when trying to perform an operation on a path that is not a
  /// directory, when directory is required.
  ///
  NotADirectory

  /// Raised when trying to perform an operation while the relevant Deno
  /// permission (like --allow-read) has not been granted.
  ///
  NotCapable

  /// Raised when the underlying operating system reports an ENOTCONN error.
  ///
  NotConnected

  /// Raised when the underlying operating system indicates that the file
  /// was not found.
  ///
  NotFound

  /// Raised when the underlying Deno API is asked to perform a function that
  /// is not currently supported.
  ///
  NotSupported

  /// Raised when the underlying operating system indicates the current user
  /// which the Deno process is running under does not have the appropriate
  /// permissions to a file or resource.
  ///
  PermissionDenied

  /// Raised when the underlying operating system reports that an I/O operation
  /// has timed out (ETIMEDOUT).
  ///
  TimedOut

  /// Raised when attempting to read bytes from a resource, but the EOF was
  /// unexpectedly encountered.
  ///
  UnexpectedEof

  /// Raised when the underlying operating system would need to block to
  /// complete but an asynchronous (non-blocking) API is used.
  ///
  WouldBlock

  /// Raised when expecting to write to a IO buffer resulted in zero bytes
  /// being written.
  ///
  WriteZero
}
