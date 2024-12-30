import type * as $textEncoderStream from "$/amber/amber/web/text_encoder_stream.mjs";

export const new_: typeof $textEncoderStream.new$ = () => {
  return new TextDecoderStream();
};

export const readable: typeof $textEncoderStream.readable = (
  encoder: TextDecoderStream,
) => {
  return encoder.readable;
};

export const writable: typeof $textEncoderStream.writable = (
  encoder: TextDecoderStream,
) => {
  return encoder.writable;
};

export const encoding: typeof $textEncoderStream.encoding = (
  encoder: TextDecoderStream,
) => {
  return encoder.encoding;
};
