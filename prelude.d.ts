declare module "prelude" {
  import type { List } from "prelude-types";
  export * from "prelude-types";

  export class NonEmpty<T> extends List<T> {
    constructor(head: T, tail: List<T>);
  }
}
