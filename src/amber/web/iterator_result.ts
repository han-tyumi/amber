import * as $iteratorResult from "$/amber/amber/web/iterator_result.mjs";

export function toIteratorResult<T, TReturn>(
  result: $iteratorResult.IteratorResult$<TReturn, T>,
): IteratorResult<T, TReturn> {
  if (result instanceof $iteratorResult.Return) {
    // @ts-ignore: Gleam generates the order of generics indeterminately.
    return { done: true, value: result.value };
  }
  // @ts-ignore: Gleam generates the order of generics indeterminately.
  return { done: false, value: result.value };
}

export function toGleamIteratorResult<T, TReturn>(
  result: IteratorResult<T, TReturn>,
): $iteratorResult.IteratorResult$<TReturn, T> {
  if (result.done) {
    return new $iteratorResult.Return(result.value);
  }
  return new $iteratorResult.Yield(result.value);
}
