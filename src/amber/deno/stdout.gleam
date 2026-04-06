import amber/web/promise.{type Promise}
import amber/web/uint8_array.{type Uint8Array}
import amber/web/writable_stream.{type WritableStream}

/// Write the contents of the array buffer (`p`) to `stdout`.
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
/// use bytes_written <- promise.then(stdout.write(data))
/// // bytes_written == 11
/// ```
///
@external(javascript, "./stdout.ffi.mjs", "write")
pub fn write(p: Uint8Array) -> Promise(Int)

/// Synchronously write the contents of the array buffer (`p`) to `stdout`.
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
/// let bytes_written = stdout.write_sync(data)
/// // bytes_written == 11
/// ```
///
@external(javascript, "./stdout.ffi.mjs", "write_sync")
pub fn write_sync(p: Uint8Array) -> Int

/// Closes `stdout`, freeing the resource.
///
/// ## Examples
///
/// ```gleam
/// stdout.close()
/// ```
///
@external(javascript, "./stdout.ffi.mjs", "close")
pub fn close() -> Nil

/// A writable stream interface to `stdout`.
///
@external(javascript, "./stdout.ffi.mjs", "writable")
pub fn writable() -> WritableStream(Uint8Array)

/// Checks if `stdout` is a TTY (terminal).
///
/// ## Examples
///
/// ```gleam
/// // This example is system and context specific
/// stdout.is_terminal() // True
/// ```
///
@external(javascript, "./stdout.ffi.mjs", "is_terminal")
pub fn is_terminal() -> Bool
