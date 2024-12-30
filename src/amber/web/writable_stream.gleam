// TODO(@han-tyumi): Support creating streams.

import amber/web/promise.{type Promise}
import amber/web/writable_stream/writer.{type Writer}

pub type WritableStream(a)

@external(javascript, "../../amber__web__writable_stream.ffi.mjs", "locked")
pub fn locked(stream: WritableStream(a)) -> Bool

@external(javascript, "../../amber__web__writable_stream.ffi.mjs", "abort")
pub fn abort(stream: WritableStream(a), reason: r) -> Promise(Nil)

@external(javascript, "../../amber__web__writable_stream.ffi.mjs", "close")
pub fn close(stream: WritableStream(a)) -> Promise(Nil)

@external(javascript, "../../amber__web__writable_stream.ffi.mjs", "get_writer")
pub fn get_writer(stream: WritableStream(a)) -> Writer(a)
