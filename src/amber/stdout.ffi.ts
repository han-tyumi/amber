import type * as $stdout from "$/amber/amber/stdout.mjs";
import { fromPromise } from "~/amber/error.ts";

export const write: typeof $stdout.write = (p) => {
  return fromPromise(Deno.stdout.write(p));
};

export const write_sync: typeof $stdout.write_sync = (p) => {
  return Deno.stdout.writeSync(p);
};

export const close: typeof $stdout.close = () => {
  Deno.stdout.close();
};

export const writable: typeof $stdout.writable = () => {
  return Deno.stdout.writable;
};

export const is_terminal: typeof $stdout.is_terminal = () => {
  return Deno.stdout.isTerminal();
};
