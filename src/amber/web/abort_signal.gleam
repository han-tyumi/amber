pub type AbortSignal

@external(javascript, "../../amber__web__abort_signal.ffi.mjs", "abort")
pub fn abort() -> AbortSignal

@external(javascript, "../../amber__web__abort_signal.ffi.mjs", "abort_with")
pub fn abort_with(reason: r) -> AbortSignal

@external(javascript, "../../amber__web__abort_signal.ffi.mjs", "any")
pub fn any(signals: List(AbortSignal)) -> AbortSignal

@external(javascript, "../../amber__web__abort_signal.ffi.mjs", "timeout")
pub fn timeout(milliseconds: Int) -> AbortSignal
