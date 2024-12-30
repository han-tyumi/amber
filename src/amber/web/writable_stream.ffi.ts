import type * as $writableStream from "$/amber/amber/web/writable_stream.mjs";

export const locked: typeof $writableStream.locked = (
  stream: WritableStream,
) => {
  return stream.locked;
};

export const abort: typeof $writableStream.abort = (
  stream: WritableStream,
  reason,
) => {
  return stream.abort(reason);
};

export const close: typeof $writableStream.close = (
  stream: WritableStream,
) => {
  return stream.close();
};

export const get_writer: typeof $writableStream.get_writer = (
  stream: WritableStream,
) => {
  return stream.getWriter();
};
