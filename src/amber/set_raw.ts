import * as $setRaw from "$/amber/amber/set_raw.mjs";

export function toSetRawOptions(
  options: $setRaw.SetRawOption$[],
): Partial<Deno.SetRawOptions> {
  const result: Partial<Deno.SetRawOptions> = {};
  for (const option of options) {
    if ($setRaw.SetRawOption$isCbreak(option)) {
      result.cbreak = $setRaw.SetRawOption$Cbreak$0(option);
    }
  }
  return result;
}
