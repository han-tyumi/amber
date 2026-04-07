import amber/deno/conn/tls_conn.{type TlsConn}
import amber/deno/net_addr.{type NetAddr}
import amber/web/promise.{type Promise}

/// Specialized listener that accepts TLS connections.
///
@external(javascript, "./tls_listener.ffi.ts", "TlsListener$")
pub type TlsListener

/// Waits for and resolves to the next connection to the `TlsListener`.
///
@external(javascript, "./tls_listener.ffi.mjs", "accept")
pub fn accept(listener: TlsListener) -> Promise(TlsConn)

/// Close closes the listener. Any pending accept promises will be rejected
/// with errors.
///
@external(javascript, "./tls_listener.ffi.mjs", "close")
pub fn close(listener: TlsListener) -> Nil

/// Return the address of the `TlsListener`.
///
@external(javascript, "./tls_listener.ffi.mjs", "addr")
pub fn addr(listener: TlsListener) -> NetAddr

/// Make the listener block the event loop from finishing.
///
@external(javascript, "./tls_listener.ffi.mjs", "ref")
pub fn ref(listener: TlsListener) -> Nil

/// Make the listener not block the event loop from finishing.
///
@external(javascript, "./tls_listener.ffi.mjs", "unref")
pub fn unref(listener: TlsListener) -> Nil
