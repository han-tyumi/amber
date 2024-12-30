import type * as $writer from "$/amber/amber/web/writable_stream/writer.mjs";
import { toOption } from "~/utils/option.ts";

export const closed: typeof $writer.closed = (
  writer: WritableStreamDefaultWriter,
) => {
  return writer.closed;
};

export const desired_size: typeof $writer.desired_size = (
  writer: WritableStreamDefaultWriter,
) => {
  return toOption(writer.desiredSize);
};

export const ready: typeof $writer.ready = (
  writer: WritableStreamDefaultWriter,
) => {
  return writer.ready;
};

export const abort: typeof $writer.abort = (
  writer: WritableStreamDefaultWriter,
  reason,
) => {
  return writer.abort(reason);
};

export const close: typeof $writer.close = (
  writer: WritableStreamDefaultWriter,
) => {
  return writer.close();
};

export const release_lock: typeof $writer.release_lock = (
  writer: WritableStreamDefaultWriter,
) => {
  writer.releaseLock();
  return writer;
};

export const write: typeof $writer.write = <W>(
  writer: WritableStreamDefaultWriter<W>,
  chunk: W,
) => {
  return writer.write(chunk);
};
