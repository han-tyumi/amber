import type * as $tcpConn from "$/amber/amber/deno/conn/tcp_conn.mjs";

export type TcpConn$ = Deno.TcpConn;

export const set_no_delay: typeof $tcpConn.set_no_delay = (conn, noDelay) => {
  conn.setNoDelay(noDelay);
};

export const set_keep_alive: typeof $tcpConn.set_keep_alive = (
  conn,
  keepAlive,
) => {
  conn.setKeepAlive(keepAlive);
};

export const to_conn: typeof $tcpConn.to_conn = (conn) => {
  return conn;
};
