import * as $arch from "$/amber/amber/deno/build/arch.mjs";
import { toEnumCustomType } from "~/utils/enumCustomType.ts";

export const toArchType = toEnumCustomType<
  typeof Deno.build["arch"],
  $arch.Arch$
>({
  x86_64: $arch.X8664,
  aarch64: $arch.Aarch64,
});
