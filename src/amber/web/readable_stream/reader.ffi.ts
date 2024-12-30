import type * as $reader from "$/amber/amber/web/readable_stream/reader.mjs";
import { toReadResult } from "~/amber/web/readable_stream/read_result.ts";

export const closed: typeof $reader.closed = (
  reader: ReadableStreamDefaultReader,
) => {
  return reader.closed;
};

export const cancel: typeof $reader.cancel = (
  reader: ReadableStreamDefaultReader,
  reason,
) => {
  return reader.cancel(reason);
};

export const read: typeof $reader.read = (
  reader: ReadableStreamDefaultReader,
) => {
  return reader.read().then((result) => toReadResult(result));
};

export const release_lock: typeof $reader.release_lock = (
  reader: ReadableStreamDefaultReader,
) => {
  reader.releaseLock();
  return reader;
};
