import { MemoryUsage$MemoryUsage } from "$/amber/amber/deno/memory_usage.mjs";

export function toMemoryUsageType(memoryUsage: Deno.MemoryUsage) {
  return MemoryUsage$MemoryUsage(
    memoryUsage.rss,
    memoryUsage.heapTotal,
    memoryUsage.heapUsed,
    memoryUsage.external,
  );
}
