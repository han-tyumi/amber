import amber/web/abort_signal.{type AbortSignal}

pub type AbortController

@external(javascript, "../../amber__web__abort_controller.ffi.mjs", "new_")
pub fn new() -> AbortController

@external(javascript, "../../amber__web__abort_controller.ffi.mjs", "signal")
pub fn signal(controller: AbortController) -> AbortSignal

@external(javascript, "../../amber__web__abort_controller.ffi.mjs", "abort")
pub fn abort(controller: AbortController) -> AbortController

@external(javascript, "../../amber__web__abort_controller.ffi.mjs", "abort_with")
pub fn abort_with(controller: AbortController, reason: r) -> AbortController
