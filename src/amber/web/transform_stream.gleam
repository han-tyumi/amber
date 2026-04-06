import amber/web/promise.{type Promise}
import amber/web/readable_stream.{type ReadableStream}
import amber/web/transform_stream/default_controller.{type DefaultController}
import amber/web/transform_stream/transformer.{type Transformer}
import amber/web/writable_stream.{type WritableStream}

@external(javascript, "./transform_stream.ffi.ts", "TransformStream$")
pub type TransformStream(input, output)

@external(javascript, "./transform_stream.ffi.mjs", "new_")
pub fn new(
  transformer: List(Transformer(input, output)),
) -> TransformStream(input, output)

/// Creates a TransformStream that transforms each chunk via a callback.
///
pub fn from_transform(
  transform: fn(input, DefaultController(output)) -> Promise(Nil),
) -> TransformStream(input, output) {
  new([transformer.Transform(transform)])
}

@external(javascript, "./transform_stream.ffi.mjs", "readable")
pub fn readable(
  stream: TransformStream(input, output),
) -> ReadableStream(output)

@external(javascript, "./transform_stream.ffi.mjs", "writable")
pub fn writable(stream: TransformStream(input, output)) -> WritableStream(input)
