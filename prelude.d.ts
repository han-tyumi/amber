declare module "$/prelude.mjs" {
  import type { List } from "$/prelude.d.mts";
  export * from "$/prelude.d.mts";

  export class NonEmpty<T> extends List<T> {
    constructor(head: T, tail: List<T>);
  }
}
