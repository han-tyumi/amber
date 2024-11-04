import type * as $textEncoder from "$/amber/amber/web/text_encoder.mjs";
import { EncodeIntoResult } from "$/amber/amber/web/text_encoder/encode_into_result.mjs";

export const new_: typeof $textEncoder.new$ = () => {
  return new TextEncoder();
};

export const encode: typeof $textEncoder.encode = (
  encoder: TextEncoder,
  input,
) => {
  return encoder.encode(input);
};

export const encode_into: typeof $textEncoder.encode_into = (
  encoder: TextEncoder,
  input,
  dest: Uint8Array,
) => {
  const result = encoder.encodeInto(input, dest);
  return new EncodeIntoResult(result.read, result.written);
};
