import * as $byobReaderReadOption from "$/amber/amber/web/readable_stream/byob_reader_read_option.mjs";
import type { List } from "$/prelude.mjs";
import { CustomTypeOptionsMap } from "~/utils/CustomTypeOptionsMap.ts";

const byobReaderReadOptionsMap = new CustomTypeOptionsMap<
  ReadableStreamBYOBReaderReadOptions
>()
  .set($byobReaderReadOption.Min, (min) => ({ min: min[0] }));

export function toByobReaderReadOptions(
  options: List<$byobReaderReadOption.ByobReaderReadOption$>,
) {
  return byobReaderReadOptionsMap.customTypeListToOptions(options);
}
