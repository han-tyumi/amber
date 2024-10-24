import amber/web/uint8_array.{type Uint8Array}

/// Allows you to convert a string into binary data
/// (in the form of a Uint8Array) given the encoding.
///
/// ## Examples
/// 
/// ```gleam
/// import amber/web/text_encoder
/// 
/// text_encoder.new()
/// |> text_encoder.encode("Hello")
/// // -> //js(Uint8Array { "0": 72, "1": 101, "2": 108, "3": 108, "4": 111 })
/// ```
///
pub type TextEncoder

@external(javascript, "../../amber__web__text_encoder_ffi.mjs", "new_")
pub fn new() -> TextEncoder

/// Turns a string into binary data (in the form of a Uint8Array) using UTF-8
/// encoding.
/// 
@external(javascript, "../../amber__web__text_encoder_ffi.mjs", "encode")
pub fn encode(encoder: TextEncoder, input: String) -> Uint8Array
