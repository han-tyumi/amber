import type * as $textEncoder from "amber/web/text_encoder.mjs";

export const new_: typeof $textEncoder.new$ = () => {
  return new TextEncoder();
};

export const encode: typeof $textEncoder.encode = (
  encoder: TextEncoder,
  input,
) => {
  return encoder.encode(input);
};
