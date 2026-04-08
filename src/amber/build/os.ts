import * as $os from "$/amber/amber/build/os.mjs";

export function toOsType(value: typeof Deno.build["os"]): $os.Os$ {
  switch (value) {
    case "darwin":
      return $os.Os$Darwin();
    case "linux":
      return $os.Os$Linux();
    case "android":
      return $os.Os$Android();
    case "windows":
      return $os.Os$Windows();
    case "freebsd":
      return $os.Os$Freebsd();
    case "netbsd":
      return $os.Os$Netbsd();
    case "aix":
      return $os.Os$Aix();
    case "solaris":
      return $os.Os$Solaris();
    case "illumos":
      return $os.Os$Illumos();
    default:
      throw new Error(`Unknown OS: ${value}`);
  }
}
