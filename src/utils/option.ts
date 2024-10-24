import { None, type Option$, Some } from "gleam/option.mjs";

import { isNullish } from "./nullish.ts";

export function toOption<T>(value: T | null | undefined): Option$<T> {
  return isNullish(value) ? new None() : new Some(value);
}
