import amber/serve
import amber/serve/serve_handler_info
import amber/serve/serve_option
import gleam/int
import gleam/option.{Some}
import gleeunit/should
import gossamer
import gossamer/abort_controller
import gossamer/headers
import gossamer/promise
import gossamer/request
import gossamer/request_init
import gossamer/response
import gossamer/response_init

const serve_port = 4511

pub fn http_server_basic_test() {
  let controller = abort_controller.new()
  let listening = promise.with_resolvers()

  let server =
    serve.serve_with(
      [
        serve_option.Port(serve_port),
        serve_option.Signal(abort_controller.signal(controller)),
        serve_option.OnListen(fn(addr) { listening.resolve(addr) }),
      ],
      fn(req, info) {
        let serve_handler_info.ServeHandlerInfo(remote_addr:, ..) = info
        should.equal(remote_addr.hostname, "127.0.0.1")

        use text <- promise.then(request.text(req))
        should.equal(text, "")

        response.new_with_init("Hello World", [
          response_init.Headers(headers.from_pairs([#("foo", "bar")])),
        ])
      },
    )

  use addr <- promise.then(listening.promise)
  let server_addr = serve.addr(server)
  should.equal(addr.hostname, server_addr.hostname)
  should.equal(addr.port, server_addr.port)

  let url = "http://127.0.0.1:" <> int.to_string(serve_port) <> "/"

  use resp <- promise.then(
    gossamer.fetch_with_init(url, [
      request_init.Headers(headers.from_pairs([#("connection", "close")])),
    ]),
  )

  let clone = response.clone(resp)

  use text <- promise.then(response.text(resp))
  should.equal(text, "Hello World")
  headers.get(response.headers(resp), "foo") |> should.equal(Some("bar"))

  use clone_text <- promise.then(response.text(clone))
  should.equal(clone_text, "Hello World")

  abort_controller.abort(controller, "done")
  use _ <- promise.then(serve.finished(server))
  promise.resolve(Nil)
}
