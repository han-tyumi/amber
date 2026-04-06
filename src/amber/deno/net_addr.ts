import { NetAddr$NetAddr } from "$/amber/amber/deno/net_addr.mjs";

export function toNetAddr(addr: Deno.NetAddr) {
  return NetAddr$NetAddr(addr.transport, addr.hostname, addr.port);
}
