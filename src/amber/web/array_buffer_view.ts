import * as $arrayBufferView from "$/amber/amber/web/array_buffer_view.mjs";

export function toArrayBufferViewType(view: ArrayBufferView) {
  return new $arrayBufferView.ArrayBufferView(
    view.buffer,
    view.byteLength,
    view.byteOffset,
  );
}
