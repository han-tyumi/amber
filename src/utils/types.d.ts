// deno-lint-ignore-file no-explicit-any

export type Constructor<T, Arguments extends unknown[] = any[]> = new (
  ...arguments_: Arguments
) => T;
