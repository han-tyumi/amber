import type * as $iterable from "amber/web/iterable.mjs";

export const iterator: typeof $iterable.iterator = <T, TReturn, TNext>(
  iterable: Iterable<T, TReturn, TNext>,
): Iterator<T, TReturn, TNext> => {
  return iterable[Symbol.iterator]();
};
