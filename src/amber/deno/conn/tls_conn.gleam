import amber/deno/conn.{type Conn}
import amber/deno/tls_handshake_info.{type TlsHandshakeInfo}
import amber/web/promise.{type Promise}

@external(javascript, "./tls_conn.ffi.ts", "TlsConn$")
pub type TlsConn

/// Runs the client or server handshake protocol to completion if that has
/// not happened yet. Calling this method is optional; the TLS handshake
/// will be completed automatically as soon as data is sent or received.
///
@external(javascript, "./tls_conn.ffi.mjs", "handshake")
pub fn handshake(conn: TlsConn) -> Promise(TlsHandshakeInfo)

/// Converts a TlsConn to a Conn for use with generic connection functions.
///
@external(javascript, "./tls_conn.ffi.mjs", "to_conn")
pub fn to_conn(conn: TlsConn) -> Conn
