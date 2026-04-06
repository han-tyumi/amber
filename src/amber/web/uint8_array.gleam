import amber/web/array_buffer.{type ArrayBuffer}

// TODO(@han-tyumi): Add all Uint8Array constructors, methods, etc.

/// A typed array of 8-bit unsigned integer values. The contents are initialized
/// to 0. If the requested number of bytes could not be allocated an exception
/// is raised.
///
@external(javascript, "./uint8_array.ffi.ts", "Uint8Array$")
pub type Uint8Array

@external(javascript, "./uint8_array.ffi.mjs", "new_")
pub fn new() -> Uint8Array

@external(javascript, "./uint8_array.ffi.mjs", "from_length")
pub fn from_length(length: Int) -> Uint8Array

@external(javascript, "./uint8_array.ffi.mjs", "from_list")
pub fn from_list(list: List(Int)) -> Uint8Array

@external(javascript, "./uint8_array.ffi.mjs", "from_buffer")
pub fn from_buffer(buffer: ArrayBuffer) -> Uint8Array

@external(javascript, "./uint8_array.ffi.mjs", "buffer")
pub fn buffer(uint8_array: Uint8Array) -> ArrayBuffer

@external(javascript, "./uint8_array.ffi.mjs", "byte_length")
pub fn byte_length(uint8_array: Uint8Array) -> Int

@external(javascript, "./uint8_array.ffi.mjs", "byte_offset")
pub fn byte_offset(uint8_array: Uint8Array) -> Int
