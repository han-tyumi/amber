import amber/web/iterator.{type Iterator}

pub type Iterable(a, return, next)

@external(javascript, "../../amber__web__iterable_ffi.mjs", "iterator")
pub fn iterator(
  iterable: Iterable(a, return, next),
) -> Iterator(a, return, next)
