import { SystemMemoryInfo } from "$/amber/amber/deno/system_memory_info.mjs";

export function toSystemMemoryInfoType(info: Deno.SystemMemoryInfo) {
  return new SystemMemoryInfo(
    info.total,
    info.free,
    info.available,
    info.buffers,
    info.cached,
    info.swapTotal,
    info.swapFree,
  );
}
