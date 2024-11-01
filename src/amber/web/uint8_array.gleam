import amber/web/array_buffer.{type ArrayBuffer}

// TODO(@han-tyumi): Add all Uint8Array constructors, methods, etc.

/// A typed array of 8-bit unsigned integer values. The contents are initialized
/// to 0. If the requested number of bytes could not be allocated an exception
/// is raised.
///
pub type Uint8Array

@external(javascript, "../../amber__web__uint8_array_ffi.mjs", "new_")
pub fn new() -> Uint8Array

@external(javascript, "../../amber__web__uint8_array_ffi.mjs", "from_length")
pub fn from_length(length: Int) -> Uint8Array

@external(javascript, "../../amber__web__uint8_array_ffi.mjs", "from_list")
pub fn from_list(list: List(Int)) -> Uint8Array

@external(javascript, "../../amber__web__uint8_array_ffi.mjs", "buffer")
pub fn buffer(uint8_array: Uint8Array) -> ArrayBuffer
