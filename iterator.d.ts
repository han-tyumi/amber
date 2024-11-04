declare module "$/gleam_stdlib/gleam/iterator.mjs" {
  import type { CustomType } from "$/prelude.mjs";
  export * from "$/gleam_stdlib/gleam/iterator.mjs";

  export class Stop extends CustomType {}

  export class Continue<T> extends CustomType {
    constructor(element: T, continuation: () => Action$<T>);

    0: T;
    1: () => Action$<T>;
  }

  export type Action$<T> = Stop | Continue<T>;

  export class Iterator<T> extends CustomType {
    constructor(continuation: () => Action$<T>);

    continuation: () => Action$<T>;
  }
}
