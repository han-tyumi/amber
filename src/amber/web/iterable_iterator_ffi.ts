import type * as $iterableIterator from "amber/web/iterable_iterator.mjs";

export const iterableIterator: typeof $iterableIterator.iterable_iterator = <
  T,
  TReturn,
  TNext,
>(
  iterableIterator: IterableIterator<T, TReturn, TNext>,
): IterableIterator<T, TReturn, TNext> => {
  return iterableIterator[Symbol.iterator]();
};

export const iterator: typeof $iterableIterator.iterator = <T, TReturn, TNext>(
  iterableIterator: IterableIterator<T, TReturn, TNext>,
): Iterator<T, TNext, TReturn> => {
  return iterableIterator as Iterator<T, TNext, TReturn>;
};
