import type * as $listener from "$/amber/amber/listener.mjs";
import { toNetAddr } from "~/amber/net_addr.ts";

export type Listener$ = Deno.TcpListener;

export const accept: typeof $listener.accept = (listener) => {
  return listener.accept();
};

export const close: typeof $listener.close = (listener) => {
  listener.close();
};

export const addr: typeof $listener.addr = (listener) => {
  return toNetAddr(listener.addr);
};

export const ref: typeof $listener.ref = (listener) => {
  listener.ref();
};

export const unref: typeof $listener.unref = (listener) => {
  listener.unref();
};
