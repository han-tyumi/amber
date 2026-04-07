import type * as $stdin from "$/amber/amber/stdin.mjs";
import { toArray } from "~/utils/list.ts";
import { toOption } from "~/utils/option.ts";
import { toSetRawOptions } from "./set_raw.ts";

export const read: typeof $stdin.read = (p) => {
  return Deno.stdin.read(p).then(toOption);
};

export const read_sync: typeof $stdin.read_sync = (p) => {
  return toOption(Deno.stdin.readSync(p));
};

export const close: typeof $stdin.close = () => {
  Deno.stdin.close();
};

export const readable: typeof $stdin.readable = () => {
  return Deno.stdin.readable;
};

export const set_raw: typeof $stdin.set_raw = (mode, options) => {
  Deno.stdin.setRaw(
    mode,
    toSetRawOptions(toArray(options)) as Deno.SetRawOptions,
  );
};

export const is_terminal: typeof $stdin.is_terminal = () => {
  return Deno.stdin.isTerminal();
};
