import { SystemMemoryInfo$SystemMemoryInfo } from "$/amber/amber/system_memory_info.mjs";

export function toSystemMemoryInfoType(info: Deno.SystemMemoryInfo) {
  return SystemMemoryInfo$SystemMemoryInfo(
    info.total,
    info.free,
    info.available,
    info.buffers,
    info.cached,
    info.swapTotal,
    info.swapFree,
  );
}
