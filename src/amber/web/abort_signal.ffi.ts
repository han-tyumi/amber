import type * as $abortSignal from "$/amber/amber/web/abort_signal.mjs";
import type { List } from "$/prelude.mjs";

export const abort: typeof $abortSignal.abort = (reason) => {
  return AbortSignal.abort(reason);
};

export const any: typeof $abortSignal.any = (signals: List<AbortSignal>) => {
  return AbortSignal.any(signals.toArray());
};

export const timeout: typeof $abortSignal.timeout = (milliseconds) => {
  return AbortSignal.timeout(milliseconds);
};
