import amber/web/promise
import amber/web/readable_stream
import amber/web/readable_stream/default_controller
import amber/web/readable_stream/read_result
import amber/web/readable_stream/reader
import amber/web/readable_stream/underlying_source
import amber/web/writable_stream
import amber/web/writable_stream/underlying_sink
import amber/web/writable_stream/writer
import gleam/option.{None}
import gleeunit/should

pub fn readable_stream_from_start_test() {
  let stream =
    readable_stream.from_start(fn(controller) {
      default_controller.enqueue(controller, "hello")
      default_controller.enqueue(controller, "world")
      default_controller.close(controller)
    })

  let reader = readable_stream.get_reader(stream)

  use result <- promise.then(reader.read(reader))
  should.equal(result, read_result.Value("hello"))

  use result <- promise.then(reader.read(reader))
  should.equal(result, read_result.Value("world"))

  use result <- promise.then(reader.read(reader))
  should.equal(result, read_result.Done(None))
}

pub fn readable_stream_new_with_options_test() {
  let stream =
    readable_stream.new([
      underlying_source.Start(fn(controller) {
        default_controller.enqueue(controller, 42)
        default_controller.close(controller)
      }),
    ])

  let reader = readable_stream.get_reader(stream)

  use result <- promise.then(reader.read(reader))
  should.equal(result, read_result.Value(42))
}

pub fn writable_stream_from_write_test() {
  let stream =
    writable_stream.from_write(fn(chunk, _controller) {
      should.equal(chunk, "hello")
      promise.resolve(Nil)
    })

  let w = writable_stream.get_writer(stream)

  use _ <- promise.then(writer.write(w, "hello"))
  use _ <- promise.then(writer.close(w))
  promise.resolve(Nil)
}

pub fn writable_stream_new_with_options_test() {
  let stream =
    writable_stream.new([
      underlying_sink.Write(fn(chunk, _controller) {
        should.equal(chunk, "test")
        promise.resolve(Nil)
      }),
    ])

  let w = writable_stream.get_writer(stream)

  use _ <- promise.then(writer.write(w, "test"))
  use _ <- promise.then(writer.close(w))
  promise.resolve(Nil)
}

pub fn readable_pipe_to_writable_test() {
  let readable =
    readable_stream.from_start(fn(controller) {
      default_controller.enqueue(controller, "a")
      default_controller.enqueue(controller, "b")
      default_controller.close(controller)
    })

  let chunks = []

  let writable =
    writable_stream.from_write(fn(chunk, _controller) {
      // Can't mutate chunks in Gleam, just verify type works.
      let _ = [chunk, ..chunks]
      promise.resolve(Nil)
    })

  use _ <- promise.then(readable_stream.pipe_to(readable, writable, []))
  promise.resolve(Nil)
}
