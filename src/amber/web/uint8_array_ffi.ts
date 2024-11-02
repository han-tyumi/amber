import type * as $uint8Array from "amber/web/uint8_array.mjs";

export const new_: typeof $uint8Array.new$ = () => {
  return new Uint8Array();
};

export const from_length: typeof $uint8Array.from_length = (length) => {
  return new Uint8Array(length);
};

export const from_list: typeof $uint8Array.from_list = (list) => {
  return new Uint8Array(list);
};

export const buffer: typeof $uint8Array.buffer = (uint8Array: Uint8Array) => {
  return uint8Array.buffer;
};

export const byte_length: typeof $uint8Array.byte_length = (
  uint8Array: Uint8Array,
) => {
  return uint8Array.byteLength;
};

export const byte_offset: typeof $uint8Array.byte_offset = (
  uint8Array: Uint8Array,
) => {
  return uint8Array.byteOffset;
};
