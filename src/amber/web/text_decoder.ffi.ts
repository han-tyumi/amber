import type * as $textDecoder from "$/amber/amber/web/text_decoder.mjs";
import { toTextDecoderOptions } from "~/amber/web/text_decoder/text_decoder_option.ts";

const sharedDecoder = new TextDecoder();

export const new_: typeof $textDecoder.new$ = () => {
  return new TextDecoder();
};

export const new_with: typeof $textDecoder.new_with = (label, options) => {
  return new TextDecoder(
    label,
    toTextDecoderOptions(options),
  );
};

export const decode_chunk: typeof $textDecoder.decode_chunk = (
  decoder: TextDecoder,
  input: ArrayBuffer,
) => {
  return decoder.decode(input, { stream: true });
};

export const flush: typeof $textDecoder.flush = (decoder: TextDecoder) => {
  return decoder.decode();
};

export const decode: typeof $textDecoder.decode = (
  input: ArrayBuffer,
) => {
  return sharedDecoder.decode(input);
};

export const decode_with: typeof $textDecoder.decode_with = (
  input: ArrayBuffer,
  label,
  options,
) => {
  return new TextDecoder(label, toTextDecoderOptions(options)).decode(input);
};
