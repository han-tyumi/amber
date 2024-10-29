import * as $textDecodeOption from "amber/web/text_decode_option.mjs";
import type * as $textDecoder from "amber/web/text_decoder.mjs";
import * as $textDecoderOption from "amber/web/text_decoder_option.mjs";

import { CustomTypeOptionsMap } from "../../utils/CustomTypeOptionsMap.ts";

export const new_: typeof $textDecoder.new$ = () => {
  return new TextDecoder();
};

const textDecoderOptionsMap = new CustomTypeOptionsMap<TextDecoderOptions>()
  .set($textDecoderOption.Fatal, () => ({ fatal: true }))
  .set($textDecoderOption.IgnoreBom, () => ({ ignoreBOM: true }));

export const newWith: typeof $textDecoder.new_with = (label, options) => {
  return new TextDecoder(
    label,
    textDecoderOptionsMap.customTypeListToOptions(options),
  );
};

export const decode: typeof $textDecoder.decode = (decoder: TextDecoder) => {
  return decoder.decode();
};

const textDecodeOptionsMap = new CustomTypeOptionsMap<TextDecodeOptions>()
  .set($textDecodeOption.Stream, () => ({ stream: true }));

export const decodeWith: typeof $textDecoder.decode_with = (
  decoder: TextDecoder,
  input: ArrayBuffer,
  options,
) => {
  return decoder.decode(
    input,
    textDecodeOptionsMap.customTypeListToOptions(options),
  );
};
