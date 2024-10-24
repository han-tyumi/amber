import { Empty, type List, NonEmpty } from "prelude";

export function fromArrayMapped<T, U>(
  array: T[],
  map: (v: T, k: number) => U,
): List<U> {
  let t = new Empty<U>();
  for (let i = array.length - 1; i >= 0; --i) {
    t = new NonEmpty(map(array[i], i), t);
  }
  return t;
}
