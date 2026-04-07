import * as $keyType from "$/amber/amber/web/key_type.mjs";

export function toKeyType(value: KeyType): $keyType.KeyType$ {
  switch (value) {
    case "private":
      return $keyType.KeyType$Private();
    case "public":
      return $keyType.KeyType$Public();
    case "secret":
      return $keyType.KeyType$Secret();
  }
}
