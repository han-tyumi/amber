import type * as $readableStream from "$/amber/amber/web/readable_stream.mjs";
import { toStreamPipeOptions } from "~/amber/web/readable_stream/stream_pipe_option.ts";

export const locked: typeof $readableStream.locked = (
  stream: ReadableStream,
) => {
  return stream.locked;
};

export const cancel: typeof $readableStream.cancel = (
  stream: ReadableStream,
  reason,
) => {
  return stream.cancel(reason);
};

export const get_reader: typeof $readableStream.get_reader = (
  stream: ReadableStream,
) => {
  return stream.getReader();
};

export const get_byob_reader: typeof $readableStream.get_byob_reader = (
  stream: ReadableStream,
) => {
  return stream.getReader({ mode: "byob" });
};

export const pipe_through: typeof $readableStream.pipe_through = (
  stream: ReadableStream,
  [readable, writable]: [ReadableStream, WritableStream],
  options,
) => {
  return stream.pipeThrough(
    { readable, writable },
    toStreamPipeOptions(options),
  );
};

export const pipe_to: typeof $readableStream.pipe_to = (
  stream: ReadableStream,
  destination: WritableStream,
  options,
) => {
  return stream.pipeTo(
    destination,
    toStreamPipeOptions(options),
  );
};

export const tee: typeof $readableStream.tee = (
  stream: ReadableStream,
) => {
  return stream.tee();
};

export const async_iterator: typeof $readableStream.async_iterator = (
  stream: ReadableStream,
) => {
  return stream[Symbol.asyncIterator]();
};
