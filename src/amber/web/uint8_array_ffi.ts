import type * as $uint8Array from "amber/web/uint8_array.mjs";

export const new_: typeof $uint8Array.new$ = () => {
  return new Uint8Array();
};

export const fromLength: typeof $uint8Array.from_length = (length) => {
  return new Uint8Array(length);
};

export const fromList: typeof $uint8Array.from_list = (list) => {
  return new Uint8Array(list);
};

export const buffer: typeof $uint8Array.buffer = (uint8Array: Uint8Array) => {
  return uint8Array.buffer;
};
