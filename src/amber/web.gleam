pub type Date

/// A microtask is a short function which is executed after the function or
/// module which created it exits and only if the JavaScript execution stack is
/// empty, but before returning control to the event loop being used to drive the
/// script's execution environment. This event loop may be either the main event
/// loop or the event loop driving a web worker.
///
/// ```gleam
/// web.queue_microtask(fn() { io.println("This event loop stack is complete") })
/// ```
///
@external(javascript, "../amber__web.ffi.mjs", "queue_microtask")
pub fn queue_microtask(func: fn() -> Nil) -> Nil

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
