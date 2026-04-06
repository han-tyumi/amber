import { ConsoleSize$ConsoleSize } from "$/amber/amber/deno/console_size.mjs";

export function toConsoleSizeType(size: { columns: number; rows: number }) {
  return ConsoleSize$ConsoleSize(size.columns, size.rows);
}
