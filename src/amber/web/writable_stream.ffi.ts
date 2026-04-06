import type * as $writableStream from "$/amber/amber/web/writable_stream.mjs";

export type WritableStream$<T> = WritableStream<T>;

export const locked: typeof $writableStream.locked = (
  stream: WritableStream,
) => {
  return stream.locked;
};

export const abort: typeof $writableStream.abort = (
  stream: WritableStream,
  reason,
) => {
  return stream.abort(reason).then(() => undefined);
};

export const close: typeof $writableStream.close = (
  stream: WritableStream,
) => {
  return stream.close().then(() => undefined);
};

export const get_writer: typeof $writableStream.get_writer = (
  stream: WritableStream,
) => {
  return stream.getWriter();
};
