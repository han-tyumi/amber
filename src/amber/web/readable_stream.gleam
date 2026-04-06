// TODO(@han-tyumi): Support creating streams.

import amber/web/async_iterator.{type AsyncIterator}
import amber/web/promise.{type Promise}
import amber/web/readable_stream/byob_reader.{type ByobReader}
import amber/web/readable_stream/reader.{type Reader}
import amber/web/readable_stream/stream_pipe_option.{type StreamPipeOption}
import amber/web/writable_stream.{type WritableStream}

@external(javascript, "./readable_stream.ffi.ts", "ReadableStream$")
pub type ReadableStream(a)

@external(javascript, "./readable_stream.ffi.mjs", "locked")
pub fn locked(stream: ReadableStream(a)) -> Bool

@external(javascript, "./readable_stream.ffi.mjs", "cancel")
pub fn cancel(stream: ReadableStream(a), reason: r) -> Promise(Nil)

@external(javascript, "./readable_stream.ffi.mjs", "get_reader")
pub fn get_reader(stream: ReadableStream(a)) -> Reader(a)

@external(javascript, "./readable_stream.ffi.mjs", "get_byob_reader")
pub fn get_byob_reader(stream: ReadableStream(a)) -> ByobReader(a)

@external(javascript, "./readable_stream.ffi.mjs", "pipe_through")
pub fn pipe_through(
  stream: ReadableStream(a),
  transform: #(ReadableStream(b), WritableStream(a)),
  options: List(StreamPipeOption),
) -> ReadableStream(b)

@external(javascript, "./readable_stream.ffi.mjs", "pipe_to")
pub fn pipe_to(
  stream: ReadableStream(a),
  destination: WritableStream(a),
  options: List(StreamPipeOption),
) -> Promise(Nil)

@external(javascript, "./readable_stream.ffi.mjs", "tee")
pub fn tee(stream: ReadableStream(a)) -> #(ReadableStream(a), ReadableStream(a))

@external(javascript, "./readable_stream.ffi.mjs", "async_iterator")
pub fn async_iterator(stream: ReadableStream(a)) -> AsyncIterator(a, Nil, Nil)
