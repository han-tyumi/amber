import amber/web/promise.{type Promise}
import amber/web/readable_stream/read_result.{type ReadResult}

pub type Reader(a)

@external(javascript, "../../../amber__web__readable_stream__reader.ffi.mjs", "closed")
pub fn closed(reader: Reader(a)) -> Promise(Nil)

@external(javascript, "../../../amber__web__readable_stream__reader.ffi.mjs", "cancel")
pub fn cancel(reader: Reader(a), reason: r) -> Promise(Nil)

@external(javascript, "../../../amber__web__readable_stream__reader.ffi.mjs", "read")
pub fn read(reader: Reader(a)) -> Promise(ReadResult(a))

@external(javascript, "../../../amber__web__readable_stream__reader.ffi.mjs", "release_lock")
pub fn release_lock(reader: Reader(a)) -> Reader(a)
