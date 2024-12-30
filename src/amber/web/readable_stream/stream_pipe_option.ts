import * as $streamPipeOption from "$/amber/amber/web/readable_stream/stream_pipe_option.mjs";
import type { List } from "$/prelude.mjs";
import { CustomTypeOptionsMap } from "~/utils/CustomTypeOptionsMap.ts";

const streamPipeOptionsMap = new CustomTypeOptionsMap<
  StreamPipeOptions
>()
  .set($streamPipeOption.PreventAbort, () => ({ preventAbort: true }))
  .set($streamPipeOption.PreventCancel, () => ({ preventCancel: true }))
  .set($streamPipeOption.PreventClose, () => ({ preventClose: true }))
  .set($streamPipeOption.Signal, (signal) => ({ signal: signal[0] }));

export function toStreamPipeOptions(
  options: List<$streamPipeOption.StreamPipeOption$>,
) {
  return streamPipeOptionsMap.customTypeListToOptions(options);
}
