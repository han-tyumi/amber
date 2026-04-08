import type * as $tlsConn from "$/amber/amber/conn/tls_conn.mjs";
import { fromPromise } from "~/amber/error.ts";
import { toTlsHandshakeInfo } from "~/amber/tls_handshake_info.ts";

export type TlsConn$ = Deno.TlsConn;

export const handshake: typeof $tlsConn.handshake = (conn) => {
  return fromPromise(conn.handshake().then(toTlsHandshakeInfo));
};

export const to_conn: typeof $tlsConn.to_conn = (conn) => {
  return conn;
};
