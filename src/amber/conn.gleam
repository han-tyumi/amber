import amber/error.{type Error}
import amber/net_addr.{type NetAddr}
import gleam/option.{type Option}
import gossamer/promise.{type Promise}
import gossamer/readable_stream.{type ReadableStream}
import gossamer/uint8_array.{type Uint8Array}
import gossamer/writable_stream.{type WritableStream}

@external(javascript, "./conn.type.ts", "Conn$")
pub type Conn

/// Read the incoming data from the connection into an array buffer (`p`).
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
@external(javascript, "./conn.ffi.mjs", "read")
pub fn read(
  conn: Conn,
  into p: Uint8Array,
) -> Promise(Result(Option(Int), Error))

/// Write the contents of the array buffer (`p`) to the connection.
///
/// Resolves to the number of bytes written.
///
/// **It is not guaranteed that the full buffer will be written in a single
/// call.**
///
@external(javascript, "./conn.ffi.mjs", "write")
pub fn write(conn: Conn, from p: Uint8Array) -> Promise(Result(Int, Error))

/// Closes the connection, freeing the resource.
///
@external(javascript, "./conn.ffi.mjs", "close")
pub fn close(conn: Conn) -> Result(Nil, Error)

/// The local address of the connection.
///
@external(javascript, "./conn.ffi.mjs", "local_addr")
pub fn local_addr(of conn: Conn) -> NetAddr

/// The remote address of the connection.
///
@external(javascript, "./conn.ffi.mjs", "remote_addr")
pub fn remote_addr(of conn: Conn) -> NetAddr

/// Shuts down (`shutdown(2)`) the write side of the connection. Most
/// callers should just use `close()`.
///
@external(javascript, "./conn.ffi.mjs", "close_write")
pub fn close_write(conn: Conn) -> Promise(Result(Nil, Error))

/// Make the connection block the event loop from finishing.
///
@external(javascript, "./conn.ffi.mjs", "ref")
pub fn ref(conn: Conn) -> Nil

/// Make the connection not block the event loop from finishing.
///
@external(javascript, "./conn.ffi.mjs", "unref")
pub fn unref(conn: Conn) -> Nil

@external(javascript, "./conn.ffi.mjs", "readable")
pub fn readable(of conn: Conn) -> ReadableStream(Uint8Array)

@external(javascript, "./conn.ffi.mjs", "writable")
pub fn writable(of conn: Conn) -> WritableStream(Uint8Array)
