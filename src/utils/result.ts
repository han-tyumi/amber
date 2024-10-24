import { Error as Error$, Ok, type Result } from "prelude";

import { isNullish } from "./nullish.ts";

export function toResult<T, E>(
  value: T | null | undefined,
  errorValue: E,
): Result<T, E> {
  return isNullish(value) ? new Error$(errorValue) : new Ok(value);
}

toResult.fromThrows = function <T, E>(
  throws: () => T,
  mapError: (error: unknown) => E,
): Result<T, E> {
  try {
    return new Ok(throws());
  } catch (error) {
    return new Error$(mapError(error));
  }
};
