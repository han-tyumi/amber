import type * as $arrayBuffer from "amber/web/array_buffer.mjs";

export const new_: typeof $arrayBuffer.new$ = (byteLength) => {
  return new ArrayBuffer(byteLength);
};

export const byte_length: typeof $arrayBuffer.byte_length = (
  arrayBuffer: ArrayBuffer,
) => {
  return arrayBuffer.byteLength;
};

export const slice: typeof $arrayBuffer.slice = (
  arrayBuffer: ArrayBuffer,
  begin,
) => {
  return arrayBuffer.slice(begin);
};

export const slice_with_end: typeof $arrayBuffer.slice_with_end = (
  arrayBuffer: ArrayBuffer,
  begin,
  end,
) => {
  return arrayBuffer.slice(begin, end);
};
