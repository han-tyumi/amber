import * as $os from "$/amber/amber/deno/build/os.mjs";
import { toEnumCustomType } from "~/utils/enumCustomType.ts";

export const toOsType = toEnumCustomType<
  typeof Deno.build["os"],
  $os.Os$
>({
  darwin: $os.Os$Darwin,
  linux: $os.Os$Linux,
  android: $os.Os$Android,
  windows: $os.Os$Windows,
  freebsd: $os.Os$Freebsd,
  netbsd: $os.Os$Netbsd,
  aix: $os.Os$Aix,
  solaris: $os.Os$Solaris,
  illumos: $os.Os$Illumos,
});
