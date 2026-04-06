import type * as $transformStream from "$/amber/amber/web/transform_stream.mjs";
import { toTransformer } from "~/amber/web/transform_stream/transformer.ts";
import { toArray } from "~/utils/list.ts";

export type TransformStream$<I, O> = TransformStream<I, O>;

export const new_: typeof $transformStream.new$ = (transformer) => {
  return new TransformStream(toTransformer(toArray(transformer)));
};

export const readable: typeof $transformStream.readable = (stream) => {
  return stream.readable;
};

export const writable: typeof $transformStream.writable = (stream) => {
  return stream.writable;
};
