import amber/web/promise.{type Promise}
import amber/web/request.{type Request}
import amber/web/request_init.{type RequestInit}
import amber/web/response.{type Response}
import gleam/option.{type Option}

@external(javascript, "./web.ffi.ts", "Date$")
pub type Date

/// Fetch a resource from the network. It returns a `Promise` that resolves to
/// the `Response` to that `Request`, whether it is successful or not.
///
@external(javascript, "./web.ffi.mjs", "fetch_")
pub fn fetch(url: String) -> Promise(Response)

/// Fetch a resource from the network with options.
///
@external(javascript, "./web.ffi.mjs", "fetch_with_init")
pub fn fetch_with_init(
  url: String,
  init: List(RequestInit),
) -> Promise(Response)

/// Fetch a resource from the network using a `Request` object.
///
@external(javascript, "./web.ffi.mjs", "fetch_request")
pub fn fetch_request(request: Request) -> Promise(Response)

@external(javascript, "./web.ffi.mjs", "alert")
pub fn alert(message: String) -> Nil

@external(javascript, "./web.ffi.mjs", "clear_interval")
pub fn clear_interval(id: Int) -> Nil

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
@external(javascript, "./web.ffi.mjs", "clear_timeout")
pub fn clear_timeout(id: Int) -> Nil

@external(javascript, "./web.ffi.mjs", "close")
pub fn close() -> Nil

@external(javascript, "./web.ffi.mjs", "confirm")
pub fn confirm(message: String) -> Bool

@external(javascript, "./web.ffi.mjs", "prompt")
pub fn prompt(message: String, default: String) -> Option(String)

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
@external(javascript, "./web.ffi.mjs", "queue_microtask")
pub fn queue_microtask(func: fn() -> Nil) -> Nil

@external(javascript, "./web.ffi.mjs", "report_error")
pub fn report_error(error: e) -> Nil

@external(javascript, "./web.ffi.mjs", "set_interval")
pub fn set_interval(delay: Int, callback: fn() -> Nil) -> Int

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
@external(javascript, "./web.ffi.mjs", "set_timeout")
pub fn set_timeout(delay: Int, callback: fn() -> Nil) -> Int
