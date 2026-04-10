import type * as $env from "$/amber/amber/env.mjs";
import * as $error from "$/amber/amber/error.mjs";
import { Result$Error, Result$Ok } from "$/prelude.mjs";
import Dict from "$/gleam_stdlib/dict.mjs";
import { fromThrows, toError$ } from "~/amber/error.ts";

export const get: typeof $env.get = (key) => {
  try {
    const value = Deno.env.get(key);
    if (value === undefined) {
      return Result$Error($error.Error$NotFound());
    }
    return Result$Ok(value);
  } catch (error) {
    return Result$Error(toError$(error));
  }
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
  return fromThrows(() => Deno.env.has(key));
};

export const to_dict: typeof $env.to_dict = () => {
  return fromThrows(() => Dict.fromObject(Deno.env.toObject()));
};
