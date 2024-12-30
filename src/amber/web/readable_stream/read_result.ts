import { Done, Value } from "$/amber/amber/web/readable_stream/read_result.mjs";
import { toOption } from "~/utils/option.ts";

export function toReadResult<T>(result: ReadableStreamReadResult<T>) {
  if (result.done) {
    return new Done(toOption(result.value));
  }
  return new Value(result.value);
}
