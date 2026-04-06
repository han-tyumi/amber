import amber/web/readable_stream.{type ReadableStream}
import amber/web/uint8_array.{type Uint8Array}
import amber/web/writable_stream.{type WritableStream}

@external(javascript, "./text_encoder_stream.ffi.ts", "TextEncoderStream$")
pub type TextEncoderStream

@external(javascript, "./text_encoder_stream.ffi.mjs", "new_")
pub fn new() -> TextEncoderStream

@external(javascript, "./text_encoder_stream.ffi.mjs", "readable")
pub fn readable(encoder: TextEncoderStream) -> ReadableStream(Uint8Array)

@external(javascript, "./text_encoder_stream.ffi.mjs", "writable")
pub fn writable(encoder: TextEncoderStream) -> WritableStream(String)

@external(javascript, "./text_encoder_stream.ffi.mjs", "encoding")
pub fn encoding(encoder: TextEncoderStream) -> String
