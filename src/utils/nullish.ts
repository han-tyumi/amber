export type Nullish = null | undefined;

export function isNullish(value: unknown): value is Nullish {
  // deno-lint-ignore eqeqeq
  return value == null;
}
