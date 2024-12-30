import type * as $env from "$/amber/amber/deno/env.mjs";
import { toOption } from "~/utils/option.ts";
import Dict from "../../../build/prod/javascript/gleam_stdlib/dict.mjs";

export const get: typeof $env.get = (key) => {
  return toOption(Deno.env.get(key));
};

export const set: typeof $env.set = (key, value) => {
  Deno.env.set(key, value);
};

export const delete_: typeof $env.delete$ = (key) => {
  Deno.env.delete(key);
};

export const has: typeof $env.has = (key) => {
  return Deno.env.has(key);
};

export const to_dict: typeof $env.to_dict = () => {
  return Dict.fromObject(Deno.env.toObject());
};
