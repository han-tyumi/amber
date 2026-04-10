import amber/error.{type Error}
import gossamer/promise.{type Promise}
import gossamer/uint8_array.{type Uint8Array}
import gossamer/writable_stream.{type WritableStream}

/// Write the contents of the array buffer (`p`) to `stderr`.
///
/// Resolves to the number of bytes written.
///
/// **It is not guaranteed that the full buffer will be written in a single
/// call.**
///
/// ## Examples
///
/// ```gleam
/// let data = text_encoder.encode("Hello world")
/// use result <- promise.then(stderr.write(data))
/// let assert Ok(bytes_written) = result
/// // bytes_written == 11
/// ```
///
@external(javascript, "./stderr.ffi.mjs", "write")
pub fn write(p: Uint8Array) -> Promise(Result(Int, Error))

/// Synchronously write the contents of the array buffer (`p`) to `stderr`.
///
/// Returns the number of bytes written.
///
/// **It is not guaranteed that the full buffer will be written in a single
/// call.**
///
/// ## Examples
///
/// ```gleam
/// let data = text_encoder.encode("Hello world")
/// let assert Ok(bytes_written) = stderr.write_sync(data)
/// // bytes_written == 11
/// ```
///
@external(javascript, "./stderr.ffi.mjs", "write_sync")
pub fn write_sync(p: Uint8Array) -> Result(Int, Error)

/// Closes `stderr`, freeing the resource.
///
/// ## Examples
///
/// ```gleam
/// stderr.close()
/// ```
///
@external(javascript, "./stderr.ffi.mjs", "close")
pub fn close() -> Nil

/// A writable stream interface to `stderr`.
///
@external(javascript, "./stderr.ffi.mjs", "writable")
pub fn writable() -> WritableStream(Uint8Array)

/// Checks if `stderr` is a TTY (terminal).
///
/// ## Examples
///
/// ```gleam
/// // This example is system and context specific
/// stderr.is_terminal() // True
/// ```
///
@external(javascript, "./stderr.ffi.mjs", "is_terminal")
pub fn is_terminal() -> Bool
