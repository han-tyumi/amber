import * as $stdioOption from "$/amber/amber/stdio_option.mjs";

export function toStdioOptionType(
  instance: $stdioOption.StdioOption$,
): "piped" | "inherit" | "null" | undefined {
  if ($stdioOption.StdioOption$isPiped(instance)) return "piped";
  if ($stdioOption.StdioOption$isInherit(instance)) return "inherit";
  if ($stdioOption.StdioOption$isNull(instance)) return "null";
  return undefined;
}
