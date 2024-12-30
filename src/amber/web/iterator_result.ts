import * as $iteratorResult from "$/amber/amber/web/iterator_result.mjs";

export function toIteratorResult<T, TReturn>(
  result: $iteratorResult.IteratorResult$<TReturn, T>,
): IteratorResult<T, TReturn> {
  if (result instanceof $iteratorResult.Return) {
    return { done: true, value: result.value };
  }
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
