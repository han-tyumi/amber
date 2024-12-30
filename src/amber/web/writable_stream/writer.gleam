import amber/web/promise.{type Promise}
import gleam/option.{type Option}

pub type Writer(a)

@external(javascript, "../../../amber__web__writable_stream__writer.ffi.mjs", "closed")
pub fn closed(writer: Writer(a)) -> Promise(Nil)

@external(javascript, "../../../amber__web__writable_stream__writer.ffi.mjs", "desired_size")
pub fn desired_size(writer: Writer(a)) -> Option(Int)

@external(javascript, "../../../amber__web__writable_stream__writer.ffi.mjs", "ready")
pub fn ready(writer: Writer(a)) -> Promise(Nil)

@external(javascript, "../../../amber__web__writable_stream__writer.ffi.mjs", "abort")
pub fn abort(writer: Writer(a), reason: r) -> Promise(Nil)

@external(javascript, "../../../amber__web__writable_stream__writer.ffi.mjs", "close")
pub fn close(writer: Writer(a)) -> Promise(Nil)

@external(javascript, "../../../amber__web__writable_stream__writer.ffi.mjs", "release_lock")
pub fn release_lock(writer: Writer(a)) -> Writer(a)

@external(javascript, "../../../amber__web__writable_stream__writer.ffi.mjs", "write")
pub fn write(writer: Writer(a), chunk: a) -> Promise(Nil)
