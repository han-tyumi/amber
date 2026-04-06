// TODO(@han-tyumi): Add instance properties.

import amber/web/array_buffer.{type ArrayBuffer}
import amber/web/text_decoder/text_decoder_option.{type TextDecoderOption}

/// Represents a decoder for a specific text encoding, allowing you to convert
/// binary data into a string given the encoding.
///
@external(javascript, "./text_decoder.ffi.ts", "TextDecoder$")
pub type TextDecoder

@external(javascript, "./text_decoder.ffi.mjs", "new_")
pub fn new() -> TextDecoder

@external(javascript, "./text_decoder.ffi.mjs", "new_with")
pub fn new_with(label: String, options: List(TextDecoderOption)) -> TextDecoder

@external(javascript, "./text_decoder.ffi.mjs", "decode_chunk")
pub fn decode_chunk(decoder: TextDecoder, input: ArrayBuffer) -> String

@external(javascript, "./text_decoder.ffi.mjs", "flush")
pub fn flush(decoder: TextDecoder) -> String

/// Turns binary data, often in the form of a Uint8Array, into a string given
/// the encoding.
///
@external(javascript, "./text_decoder.ffi.mjs", "decode")
pub fn decode(input: ArrayBuffer) -> String

@external(javascript, "./text_decoder.ffi.mjs", "decode_with")
pub fn decode_with(
  input: ArrayBuffer,
  label: String,
  options: List(TextDecoderOption),
) -> String
