import * as $stdioOption from "$/amber/amber/deno/stdio_option.mjs";
import { fromEnumCustomType } from "~/utils/enumCustomType.ts";

export const toStdioOptionType = fromEnumCustomType(
  new Map([
    [$stdioOption.Piped, "piped"],
    [$stdioOption.Inherit, "inherit"],
    [$stdioOption.Null, "null"],
  ]),
);
