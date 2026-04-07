import amber/conn.{type Conn}

@external(javascript, "./tcp_conn.type.ts", "TcpConn$")
pub type TcpConn

/// Enable/disable the use of Nagle's algorithm.
///
@external(javascript, "./tcp_conn.ffi.mjs", "set_no_delay")
pub fn set_no_delay(conn: TcpConn, no_delay: Bool) -> Nil

/// Enable/disable keep-alive functionality.
///
@external(javascript, "./tcp_conn.ffi.mjs", "set_keep_alive")
pub fn set_keep_alive(conn: TcpConn, keep_alive: Bool) -> Nil

/// Converts a TcpConn to a Conn for use with generic connection functions.
///
@external(javascript, "./tcp_conn.ffi.mjs", "to_conn")
pub fn to_conn(conn: TcpConn) -> Conn
