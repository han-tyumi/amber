import amber/net_addr.{type NetAddr}
import amber/serve/serve_handler_info.{type ServeHandlerInfo}
import amber/serve/serve_option.{type ServeOption}
import gossamer/promise.{type Promise}
import gossamer/request.{type Request}
import gossamer/response.{type Response}

@external(javascript, "./serve.type.ts", "HttpServer$")
pub type HttpServer

/// A promise that resolves once server finishes - eg. when aborted using
/// the signal passed to `ServeOption.Signal`.
///
@external(javascript, "./serve.ffi.mjs", "finished")
pub fn finished(server: HttpServer) -> Promise(Nil)

/// The local address this server is listening on.
///
@external(javascript, "./serve.ffi.mjs", "addr")
pub fn addr(server: HttpServer) -> NetAddr

/// Make the server block the event loop from finishing.
///
@external(javascript, "./serve.ffi.mjs", "ref")
pub fn ref(server: HttpServer) -> Nil

/// Make the server not block the event loop from finishing.
///
@external(javascript, "./serve.ffi.mjs", "unref")
pub fn unref(server: HttpServer) -> Nil

/// Serves HTTP requests with the given handler.
///
/// ## Examples
///
/// ```gleam
/// serve.serve(fn(_request, _info) {
///   promise.resolve(response.new("Hello, world!"))
/// })
/// ```
///
@external(javascript, "./serve.ffi.mjs", "serve")
pub fn serve(
  handler: fn(Request, ServeHandlerInfo) -> Promise(Response),
) -> HttpServer

/// Serves HTTP requests with the given options and handler.
///
/// ## Examples
///
/// ```gleam
/// serve.serve_with(
///   [serve_option.Port(3000), serve_option.Hostname("127.0.0.1")],
///   fn(_request, _info) {
///     promise.resolve(response.new("Hello, world!"))
///   },
/// )
/// ```
///
@external(javascript, "./serve.ffi.mjs", "serve_with")
pub fn serve_with(
  options: List(ServeOption),
  handler: fn(Request, ServeHandlerInfo) -> Promise(Response),
) -> HttpServer
