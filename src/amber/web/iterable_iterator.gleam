import amber/web/iterator.{type Iterator}

/// Describes a user-defined [`Iterator`](./iterator.html#Iterator) that is also
/// iterable.
///
pub type IterableIterator(a, return, next)

@external(javascript, "../../amber__web__iterable_iterator_ffi.mjs", "iterableIterator")
pub fn iterable_iterator(
  iterable_iterator: IterableIterator(a, return, next),
) -> IterableIterator(a, return, next)

@external(javascript, "../../amber__web__iterable_iterator_ffi.mjs", "iterator")
pub fn iterator(
  iterable_iterator: IterableIterator(a, return, next),
) -> Iterator(a, return, next)
