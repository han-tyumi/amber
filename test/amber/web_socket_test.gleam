import amber
import amber/serve
import amber/serve/serve_option
import amber/upgrade_web_socket_option
import amber/web_socket_upgrade
import gleam/dynamic/decode
import gleam/int
import gleeunit/should
import gossamer/abort_controller
import gossamer/binary_type
import gossamer/close_event
import gossamer/message_event
import gossamer/promise
import gossamer/web_socket

const serve_port = 4520

pub fn websocket_send_receive_test() {
  let controller = abort_controller.new()
  let listening = promise.with_resolvers()

  let server =
    serve.serve_with(
      [
        serve_option.Port(serve_port),
        serve_option.Signal(abort_controller.signal(controller)),
        serve_option.OnListen(fn(addr) { listening.resolve(addr) }),
      ],
      fn(req, _info) {
        let web_socket_upgrade.WebSocketUpgrade(response:, socket:) =
          amber.upgrade_web_socket(req)

        web_socket.on_message(socket, fn(event) {
          case decode.run(message_event.data(event), decode.string) {
            Ok(text) -> web_socket.send(socket, "echo: " <> text)
            _ -> Nil
          }
        })

        promise.resolve(response)
      },
    )

  use _ <- promise.then(listening.promise)

  let url = "ws://127.0.0.1:" <> int.to_string(serve_port) <> "/"

  let ws = web_socket.new(url)
  should.equal(web_socket.url(ws), url)
  should.equal(web_socket.ready_state(ws), 0)

  let received = promise.with_resolvers()

  web_socket.on_open(ws, fn() { web_socket.send(ws, "hello") })

  web_socket.on_message(ws, fn(event) {
    case decode.run(message_event.data(event), decode.string) {
      Ok(text) -> received.resolve(text)
      _ -> Nil
    }
  })

  use text <- promise.then(received.promise)
  should.equal(text, "echo: hello")

  let closed = promise.with_resolvers()

  web_socket.on_close(ws, fn(event) { closed.resolve(event) })

  web_socket.close(ws)

  use event <- promise.then(closed.promise)
  let close_event.CloseEvent(code:, was_clean:, ..) = event
  should.equal(code, 1005)
  should.equal(was_clean, True)

  abort_controller.abort(controller, "done")
  use _ <- promise.then(serve.finished(server))
  promise.resolve(Nil)
}

pub fn websocket_close_with_code_test() {
  let controller = abort_controller.new()
  let listening = promise.with_resolvers()

  let server =
    serve.serve_with(
      [
        serve_option.Port(serve_port + 1),
        serve_option.Signal(abort_controller.signal(controller)),
        serve_option.OnListen(fn(addr) { listening.resolve(addr) }),
      ],
      fn(req, _info) {
        let web_socket_upgrade.WebSocketUpgrade(response:, socket:) =
          amber.upgrade_web_socket(req)

        web_socket.on_open(socket, fn() {
          web_socket.close_with(socket, 1000, "normal closure")
        })

        promise.resolve(response)
      },
    )

  use _ <- promise.then(listening.promise)

  let url = "ws://127.0.0.1:" <> int.to_string(serve_port + 1) <> "/"

  let ws = web_socket.new(url)
  let closed = promise.with_resolvers()

  web_socket.on_close(ws, fn(event) { closed.resolve(event) })

  use event <- promise.then(closed.promise)
  let close_event.CloseEvent(code:, reason:, was_clean:) = event
  should.equal(code, 1000)
  should.equal(reason, "normal closure")
  should.equal(was_clean, True)

  abort_controller.abort(controller, "done")
  use _ <- promise.then(serve.finished(server))
  promise.resolve(Nil)
}

pub fn websocket_properties_test() {
  let controller = abort_controller.new()
  let listening = promise.with_resolvers()

  let server =
    serve.serve_with(
      [
        serve_option.Port(serve_port + 2),
        serve_option.Signal(abort_controller.signal(controller)),
        serve_option.OnListen(fn(addr) { listening.resolve(addr) }),
      ],
      fn(req, _info) {
        let web_socket_upgrade.WebSocketUpgrade(response:, socket:) =
          amber.upgrade_web_socket(req)

        web_socket.on_open(socket, fn() { web_socket.send(socket, "ping") })

        promise.resolve(response)
      },
    )

  use _ <- promise.then(listening.promise)

  let url = "ws://127.0.0.1:" <> int.to_string(serve_port + 2) <> "/"

  let ws = web_socket.new(url)
  should.equal(web_socket.binary_type(ws), binary_type.Blob)
  should.equal(web_socket.buffered_amount(ws), 0)
  should.equal(web_socket.extensions(ws), "")
  should.equal(web_socket.protocol(ws), "")

  let received = promise.with_resolvers()

  web_socket.on_message(ws, fn(event) {
    received.resolve(message_event.data(event))
  })

  use data <- promise.then(received.promise)
  should.equal(decode.run(data, decode.string), Ok("ping"))

  web_socket.close(ws)

  abort_controller.abort(controller, "done")
  use _ <- promise.then(serve.finished(server))
  promise.resolve(Nil)
}

pub fn websocket_upgrade_with_options_test() {
  let controller = abort_controller.new()
  let listening = promise.with_resolvers()

  let server =
    serve.serve_with(
      [
        serve_option.Port(serve_port + 3),
        serve_option.Signal(abort_controller.signal(controller)),
        serve_option.OnListen(fn(addr) { listening.resolve(addr) }),
      ],
      fn(req, _info) {
        let web_socket_upgrade.WebSocketUpgrade(response:, socket:) =
          amber.upgrade_web_socket_with(req, [
            upgrade_web_socket_option.IdleTimeout(120),
          ])

        web_socket.on_open(socket, fn() { web_socket.send(socket, "upgraded") })

        promise.resolve(response)
      },
    )

  use _ <- promise.then(listening.promise)

  let url = "ws://127.0.0.1:" <> int.to_string(serve_port + 3) <> "/"

  let ws = web_socket.new(url)
  let received = promise.with_resolvers()

  web_socket.on_message(ws, fn(event) {
    case decode.run(message_event.data(event), decode.string) {
      Ok(text) -> received.resolve(text)
      _ -> Nil
    }
  })

  use text <- promise.then(received.promise)
  should.equal(text, "upgraded")

  web_socket.close(ws)

  abort_controller.abort(controller, "done")
  use _ <- promise.then(serve.finished(server))
  promise.resolve(Nil)
}
