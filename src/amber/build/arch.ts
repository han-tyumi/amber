import * as $arch from "$/amber/amber/build/arch.mjs";

export function toArchType(value: typeof Deno.build["arch"]): $arch.Arch$ {
  switch (value) {
    case "x86_64":
      return $arch.Arch$X8664();
    case "aarch64":
      return $arch.Arch$Aarch64();
    default:
      throw new Error(`Unknown arch: ${value}`);
  }
}
