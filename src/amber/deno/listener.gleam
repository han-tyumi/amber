import amber/deno/conn/tcp_conn.{type TcpConn}
import amber/deno/net_addr.{type NetAddr}
import amber/web/promise.{type Promise}

@external(javascript, "./listener.ffi.ts", "Listener$")
pub type Listener

/// Waits for and resolves to the next connection to the `Listener`.
///
@external(javascript, "./listener.ffi.mjs", "accept")
pub fn accept(listener: Listener) -> Promise(TcpConn)

/// Close closes the listener. Any pending accept promises will be rejected
/// with errors.
///
@external(javascript, "./listener.ffi.mjs", "close")
pub fn close(listener: Listener) -> Nil

/// Return the address of the `Listener`.
///
@external(javascript, "./listener.ffi.mjs", "addr")
pub fn addr(listener: Listener) -> NetAddr

/// Make the listener block the event loop from finishing.
///
@external(javascript, "./listener.ffi.mjs", "ref")
pub fn ref(listener: Listener) -> Nil

/// Make the listener not block the event loop from finishing.
///
@external(javascript, "./listener.ffi.mjs", "unref")
pub fn unref(listener: Listener) -> Nil
