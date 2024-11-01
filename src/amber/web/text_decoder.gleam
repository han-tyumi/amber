// TODO(@han-tyumi): Add remaining functionality.

import amber/web/array_buffer.{type ArrayBuffer}
import amber/web/text_decode_option.{type TextDecodeOption}
import amber/web/text_decoder_option.{type TextDecoderOption}

/// Represents a decoder for a specific text encoding, allowing you to convert
/// binary data into a string given the encoding.
///
/// ## Examples
///
/// ```gleam
/// let decoder = text_decoder.new_with("utf-8", [])
/// let buffer = uint8_array.from_list([72, 101, 108, 108, 111])
/// let decoded_string =
///   decoder |> text_decoder.decode_with(buffer |> uint8_array.buffer, [])
/// io.debug(decoded_string)
/// // => Outputs: "Hello"
/// ```
///
pub type TextDecoder

@external(javascript, "../../amber__web__text_decoder_ffi.mjs", "new_")
pub fn new() -> TextDecoder

@external(javascript, "../../amber__web__text_decoder_ffi.mjs", "new_with")
pub fn new_with(label: String, options: List(TextDecoderOption)) -> TextDecoder

/// Turns binary data, often in the form of a Uint8Array, into a string given
/// the encoding.
///
@external(javascript, "../../amber__web__text_decoder_ffi.mjs", "decode")
pub fn decode(decoder: TextDecoder) -> String

@external(javascript, "../../amber__web__text_decoder_ffi.mjs", "decode_with")
pub fn decode_with(
  decoder: TextDecoder,
  input: ArrayBuffer,
  options: List(TextDecodeOption),
) -> String
