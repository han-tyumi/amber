import type * as $byobReader from "$/amber/amber/web/readable_stream/byob_reader.mjs";
import { toArrayBufferViewType } from "~/amber/web/array_buffer_view.ts";
import { toByobReaderReadOptions } from "~/amber/web/readable_stream/byob_reader_read_option.ts";
import { toReadResult } from "~/amber/web/readable_stream/read_result.ts";

export const closed: typeof $byobReader.closed = (
  reader: ReadableStreamBYOBReader,
) => {
  return reader.closed;
};

export const cancel: typeof $byobReader.cancel = (
  reader: ReadableStreamBYOBReader,
  reason,
) => {
  return reader.cancel(reason);
};

export const read: typeof $byobReader.read = (
  reader: ReadableStreamBYOBReader,
  view,
  options,
) => {
  return reader.read({
    buffer: view.buffer,
    byteLength: view.byte_length,
    byteOffset: view.byte_offset,
  }, toByobReaderReadOptions(options)).then((result) => {
    const newValue = result.value
      ? toArrayBufferViewType(result.value)
      : result.value;
    return toReadResult({ done: result.done, value: newValue });
  });
};

export const release_lock: typeof $byobReader.release_lock = (
  reader: ReadableStreamBYOBReader,
) => {
  reader.releaseLock();
  return reader;
};
