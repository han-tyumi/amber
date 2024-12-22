import type * as $iterator from "$/amber/amber/web/iterator.mjs";
import * as $iteratorResult from "$/amber/amber/web/iterator_result.mjs";
import * as $option from "$/gleam_stdlib/gleam/option.d.mts";
import { Error, Ok } from "$/prelude.mjs";
import { toOption } from "~/utils/option.ts";

export const new_: typeof $iterator.new$ = <T, TReturn, TNext>(
  ...[next]: Parameters<typeof $iterator.new$<TNext, T, TReturn>>
) => {
  const iterator: Iterator<T, TReturn, TNext> = {
    next: (...[value]) => toIteratorResult(next(toOption(value))),
  };
  return iterator;
};

export const with_return: typeof $iterator.with_return = <T, TReturn, TNext>(
  iterator: Iterator<T, TReturn, TNext>,
  return_: Parameters<typeof $iterator.with_return<T, TReturn, TNext>>[1],
) => {
  const newIterator: Iterator<T, TReturn, TNext> = {
    ...iterator,
    return: (value) => toIteratorResult(return_(toOption(value))),
  };
  return newIterator;
};

export const with_throw: typeof $iterator.with_throw = <T, TReturn, TNext>(
  iterator: Iterator<T, TReturn, TNext>,
  throw_: Parameters<typeof $iterator.with_throw<T, TReturn, TNext>>[1],
) => {
  const newIterator: Iterator<T, TReturn, TNext> = {
    ...iterator,
    throw: (value) => toIteratorResult(throw_(toOption(value))),
  };
  return newIterator;
};

function toIteratorResult<T, TReturn>(
  result: $iteratorResult.IteratorResult$<T, TReturn>,
): IteratorResult<T, TReturn> {
  if (result instanceof $iteratorResult.Return) {
    return { done: true, value: result.value };
  }
  return { done: false, value: result.value };
}

export const next: typeof $iterator.next = <T, TReturn, TNext>(
  iterator: Iterator<T, TReturn, TNext>,
) => {
  const result = iterator.next();
  return toGleamIteratorResult(result);
};

export const next_with: typeof $iterator.next_with = <T, TReturn, TNext>(
  iterator: Iterator<T, TReturn, TNext>,
  value: Parameters<typeof $iterator.next_with<T, TReturn, TNext>>[1],
) => {
  const result = iterator.next(value);
  return toGleamIteratorResult(result);
};

export const return_: typeof $iterator.return$ = <T, TReturn, TNext>(
  iterator: Iterator<T, TReturn, TNext>,
) => {
  if (!iterator.return) {
    return new Error(undefined);
  }

  const result = iterator.return();
  return new Ok(toGleamIteratorResult(result));
};

export const return_with: typeof $iterator.return_with = <T, TReturn, TNext>(
  iterator: Iterator<T, TReturn, TNext>,
  value: Parameters<typeof $iterator.return_with<T, TReturn>>[1],
) => {
  if (!iterator.return) {
    return new Error(undefined);
  }

  const result = iterator.return(value);
  return new Ok(toGleamIteratorResult(result));
};

export const throw_: typeof $iterator.throw$ = <T, TReturn, TNext>(
  iterator: Iterator<T, TReturn, TNext>,
  value: Parameters<typeof $iterator.throw$<T, TReturn>>[1],
) => {
  if (!iterator.throw) {
    return new Error(undefined);
  }

  const result = iterator.throw($option.unwrap(value, undefined));
  return new Ok(toGleamIteratorResult(result));
};

function toGleamIteratorResult<T, TReturn>(
  result: IteratorResult<T, TReturn>,
): $iteratorResult.IteratorResult$<TReturn, T> {
  if (result.done) {
    return new $iteratorResult.Return(result.value);
  }
  return new $iteratorResult.Yield(result.value);
}
