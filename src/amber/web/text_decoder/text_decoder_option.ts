import * as $textDecoderOption from "$/amber/amber/web/text_decoder/text_decoder_option.mjs";
import type { List } from "$/prelude.mjs";
import { CustomTypeOptionsMap } from "~/utils/CustomTypeOptionsMap.ts";

const textDecoderOptionsMap = new CustomTypeOptionsMap<TextDecoderOptions>()
  .set($textDecoderOption.Fatal, () => ({ fatal: true }))
  .set($textDecoderOption.IgnoreBom, () => ({ ignoreBOM: true }));

export function toTextDecoderOptions(
  options: List<$textDecoderOption.TextDecoderOption$>,
) {
  return textDecoderOptionsMap.customTypeListToOptions(options);
}
