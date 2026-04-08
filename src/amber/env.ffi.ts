import type * as $env from "$/amber/amber/env.mjs";
import Dict from "$/gleam_stdlib/dict.mjs";
import { fromThrows } from "~/amber/error.ts";
import { toResult } from "~/utils/result.ts";

export const get: typeof $env.get = (key) => {
  return toResult(Deno.env.get(key), undefined);
};

export const set: typeof $env.set = (key, value) => {
  return fromThrows(() => {
    Deno.env.set(key, value);
  });
};

export const delete_: typeof $env.delete$ = (key) => {
  return fromThrows(() => {
    Deno.env.delete(key);
  });
};

export const has: typeof $env.has = (key) => {
  return Deno.env.has(key);
};

export const to_dict: typeof $env.to_dict = () => {
  return Dict.fromObject(Deno.env.toObject());
};
