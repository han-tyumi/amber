import type * as $tlsListener from "$/amber/amber/tls_listener.mjs";
import { fromPromise, fromThrows } from "~/amber/error.ts";
import { toNetAddr } from "~/amber/net_addr.ts";

export type TlsListener$ = Deno.TlsListener;

export const accept: typeof $tlsListener.accept = (listener) => {
  return fromPromise(listener.accept());
};

export const close: typeof $tlsListener.close = (listener) => {
  return fromThrows(() => {
    listener.close();
  });
};

export const addr: typeof $tlsListener.addr = (listener) => {
  const addrWithTransport = {
    ...listener.addr,
    transport: "tcp" as const,
  };
  return toNetAddr(addrWithTransport);
};

export const ref: typeof $tlsListener.ref = (listener) => {
  listener.ref();
};

export const unref: typeof $tlsListener.unref = (listener) => {
  listener.unref();
};
