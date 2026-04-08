import type * as $tcpConn from "$/amber/amber/conn/tcp_conn.mjs";
import { fromThrows } from "~/amber/error.ts";

export type TcpConn$ = Deno.TcpConn;

export const set_no_delay: typeof $tcpConn.set_no_delay = (conn, noDelay) => {
  return fromThrows(() => {
    conn.setNoDelay(noDelay);
  });
};

export const set_keep_alive: typeof $tcpConn.set_keep_alive = (
  conn,
  keepAlive,
) => {
  return fromThrows(() => {
    conn.setKeepAlive(keepAlive);
  });
};

export const to_conn: typeof $tcpConn.to_conn = (conn) => {
  return conn;
};
