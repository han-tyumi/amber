// TODO(@han-tyumi): Add all Uint8Array constructors, methods, etc.

/// A typed array of 8-bit unsigned integer values. The contents are initialized
/// to 0. If the requested number of bytes could not be allocated an exception
/// is raised.
///
pub type Uint8Array

@external(javascript, "../../amber__web__uint8_array_ffi.mjs", "new_")
pub fn new() -> Uint8Array
