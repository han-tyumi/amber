import type * as $stderr from "$/amber/amber/stderr.mjs";
import { fromPromise } from "~/amber/error.ts";

export const write: typeof $stderr.write = (p) => {
  return fromPromise(Deno.stderr.write(p));
};

export const write_sync: typeof $stderr.write_sync = (p) => {
  return Deno.stderr.writeSync(p);
};

export const close: typeof $stderr.close = () => {
  Deno.stderr.close();
};

export const writable: typeof $stderr.writable = () => {
  return Deno.stderr.writable;
};

export const is_terminal: typeof $stderr.is_terminal = () => {
  return Deno.stderr.isTerminal();
};
