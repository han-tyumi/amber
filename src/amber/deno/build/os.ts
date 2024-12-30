import * as $os from "$/amber/amber/deno/build/os.mjs";
import { toEnumCustomType } from "~/utils/enumCustomType.ts";

export const toOsType = toEnumCustomType<
  typeof Deno.build["os"],
  $os.Os$
>({
  darwin: $os.Darwin,
  linux: $os.Linux,
  android: $os.Android,
  windows: $os.Windows,
  freebsd: $os.Freebsd,
  netbsd: $os.Netbsd,
  aix: $os.Aix,
  solaris: $os.Solaris,
  illumos: $os.Illumos,
});
