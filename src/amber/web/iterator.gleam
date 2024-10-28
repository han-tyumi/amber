import amber/web/iterator_result.{type IteratorResult}
import gleam/option.{type Option}

pub type Iterator(a, return, next)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "new_")
pub fn new(
  next: fn(Option(next)) -> IteratorResult(a, return),
) -> Iterator(a, return, next)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "withReturn")
pub fn with_return(
  iterator: Iterator(a, return, next),
  return: fn(Option(return)) -> IteratorResult(a, return),
) -> Iterator(a, return, next)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "withThrow")
pub fn with_throw(
  iterator: Iterator(a, return, next),
  throw: fn(e) -> IteratorResult(a, return),
) -> Iterator(a, return, next)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "next")
pub fn next(iterator: Iterator(a, return, next)) -> IteratorResult(a, return)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "nextWith")
pub fn next_with(
  iterator: Iterator(a, return, next),
  value: next,
) -> IteratorResult(a, return)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "return_")
pub fn return(
  iterator: Iterator(a, return, next),
) -> Result(IteratorResult(a, return), Nil)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "returnWith")
pub fn return_with(
  iterator: Iterator(a, return, next),
  value: return,
) -> Result(IteratorResult(a, return), Nil)

@external(javascript, "../../amber__web__iterator_ffi.mjs", "throw_")
pub fn throw(
  iterator: Iterator(a, return, next),
  e: e,
) -> Result(IteratorResult(a, return), Nil)
