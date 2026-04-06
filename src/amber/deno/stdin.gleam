import amber/deno/set_raw.{type SetRawOption}
import amber/web/promise.{type Promise}
import amber/web/readable_stream.{type ReadableStream}
import amber/web/uint8_array.{type Uint8Array}
import gleam/option.{type Option}

/// Read the incoming data from `stdin` into an array buffer (`p`).
///
/// Resolves to either the number of bytes read during the operation or EOF
/// (`None`) if there was nothing more to read.
///
/// It is possible for a read to successfully return with `0` bytes. This
/// does not indicate EOF.
///
/// **It is not guaranteed that the full buffer will be read in a single
/// call.**
///
/// ## Examples
///
/// ```gleam
/// // If the text "hello world" is piped into the script:
/// let buf = uint8_array.from_length(100)
/// use bytes_read <- promise.then(stdin.read(buf))
/// // bytes_read == Some(11)
/// let text = text_decoder.decode(uint8_array.buffer(buf))
/// // text == "hello world"
/// ```
///
@external(javascript, "./stdin.ffi.mjs", "read")
pub fn read(p: Uint8Array) -> Promise(Option(Int))

/// Synchronously read from the incoming data from `stdin` into an array
/// buffer (`p`).
///
/// Returns either the number of bytes read during the operation or EOF
/// (`None`) if there was nothing more to read.
///
/// It is possible for a read to successfully return with `0` bytes. This
/// does not indicate EOF.
///
/// **It is not guaranteed that the full buffer will be read in a single
/// call.**
///
/// ## Examples
///
/// ```gleam
/// // If the text "hello world" is piped into the script:
/// let buf = uint8_array.from_length(100)
/// let bytes_read = stdin.read_sync(buf)
/// // bytes_read == Some(11)
/// let text = text_decoder.decode(uint8_array.buffer(buf))
/// // text == "hello world"
/// ```
///
@external(javascript, "./stdin.ffi.mjs", "read_sync")
pub fn read_sync(p: Uint8Array) -> Option(Int)

/// Closes `stdin`, freeing the resource.
///
/// ## Examples
///
/// ```gleam
/// stdin.close()
/// ```
///
@external(javascript, "./stdin.ffi.mjs", "close")
pub fn close() -> Nil

/// A readable stream interface to `stdin`.
///
@external(javascript, "./stdin.ffi.mjs", "readable")
pub fn readable() -> ReadableStream(Uint8Array)

/// Set TTY to be under raw mode or not. In raw mode, characters are read and
/// returned as is, without being processed. All special processing of
/// characters by the terminal is disabled, including echoing input
/// characters. Reading from a TTY device in raw mode is faster than reading
/// from a TTY device in canonical mode.
///
/// ## Examples
///
/// ```gleam
/// stdin.set_raw(True, [set_raw.Cbreak(True)])
/// ```
///
@external(javascript, "./stdin.ffi.mjs", "set_raw")
pub fn set_raw(mode: Bool, options: List(SetRawOption)) -> Nil

/// Checks if `stdin` is a TTY (terminal).
///
/// ## Examples
///
/// ```gleam
/// // This example is system and context specific
/// stdin.is_terminal() // True
/// ```
///
@external(javascript, "./stdin.ffi.mjs", "is_terminal")
pub fn is_terminal() -> Bool
