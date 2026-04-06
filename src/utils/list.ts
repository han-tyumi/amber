import { type List, List$Empty, List$NonEmpty } from "$/prelude.mjs";

export function fromArrayMapped<T, U>(
  array: T[],
  map: (v: T, k: number) => U,
): List<U> {
  let t: List<U> = List$Empty();
  for (let i = array.length - 1; i >= 0; --i) {
    t = List$NonEmpty(map(array[i], i), t);
  }
  return t;
}
