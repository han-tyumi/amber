import type * as $stdout from "$/amber/amber/deno/stdout.mjs";

export const write: typeof $stdout.write = (p) => {
  return Deno.stdout.write(p);
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
