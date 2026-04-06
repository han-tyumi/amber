import {
  ReadResult$Done,
  ReadResult$Value,
} from "$/amber/amber/web/readable_stream/read_result.mjs";
import { toOption } from "~/utils/option.ts";

export function toReadResult<T>(result: ReadableStreamReadResult<T>) {
  if (result.done) {
    return ReadResult$Done(toOption(result.value));
  }
  return ReadResult$Value(result.value);
}
