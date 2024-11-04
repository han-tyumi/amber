pub type AbortSignal

pub type Date

pub type ReadableStream(r)

pub type WritableStream(w)

/// Sets a timer which executes a function once after the delay
/// (in milliseconds) elapses. Returns an id which may be used to cancel the
/// timeout.
///
/// ## Examples
///
/// ```gleam
/// web.set_timeout(500, fn() { io.println("hello") })
/// ```
///
@external(javascript, "../amber__web.ffi.mjs", "set_timeout")
pub fn set_timeout(delay: Int, callback: fn() -> Nil) -> Int

/// Cancels a scheduled action initiated by `set_timeout`.
///
/// ## Examples
///
/// ```gleam
/// let id = web.set_timeout(500, fn() { io.println("hello") })
/// // ...
/// web.clear_timeout(id)
/// ```
///
@external(javascript, "../amber__web.ffi.mjs", "clear_timeout")
pub fn clear_timeout(id: Int) -> Nil
