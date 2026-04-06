import type * as $conn from "$/amber/amber/deno/conn.mjs";
import { toNetAddr } from "~/amber/deno/net_addr.ts";
import { toOption } from "~/utils/option.ts";

export type Conn$ = Deno.Conn<Deno.NetAddr>;

export const read: typeof $conn.read = (conn, p) => {
  return conn.read(p).then(toOption);
};

export const write: typeof $conn.write = (conn, p) => {
  return conn.write(p);
};

export const close: typeof $conn.close = (conn) => {
  conn.close();
};

export const local_addr: typeof $conn.local_addr = (conn) => {
  return toNetAddr(conn.localAddr as Deno.NetAddr);
};

export const remote_addr: typeof $conn.remote_addr = (conn) => {
  return toNetAddr(conn.remoteAddr as Deno.NetAddr);
};

export const close_write: typeof $conn.close_write = (conn) => {
  return conn.closeWrite().then(() => undefined);
};

export const ref: typeof $conn.ref = (conn) => {
  conn.ref();
};

export const unref: typeof $conn.unref = (conn) => {
  conn.unref();
};

export const readable: typeof $conn.readable = (conn) => {
  return conn.readable;
};

export const writable: typeof $conn.writable = (conn) => {
  return conn.writable as unknown as WritableStream<Uint8Array>;
};
