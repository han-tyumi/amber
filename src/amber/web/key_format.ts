import * as $keyFormat from "$/amber/amber/web/key_format.mjs";

export function toKeyFormat(
  value: $keyFormat.KeyFormat$,
): Exclude<KeyFormat, "jwk"> {
  if ($keyFormat.KeyFormat$isPkcs8(value)) return "pkcs8";
  if ($keyFormat.KeyFormat$isRaw(value)) return "raw";
  return "spki";
}
