import * as $closeEvent from "$/amber/amber/web/close_event.mjs";

export function toCloseEvent(event: CloseEvent): $closeEvent.CloseEvent$ {
  return $closeEvent.CloseEvent$CloseEvent(
    event.code,
    event.reason,
    event.wasClean,
  );
}
