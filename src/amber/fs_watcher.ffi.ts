import * as $fsEvent from "$/amber/amber/fs_event.mjs";
import type * as $fsWatcher from "$/amber/amber/fs_watcher.mjs";
import * as $option from "$/gleam_stdlib/gleam/option.mjs";
import { fromArray } from "~/utils/list.ts";
import { toOption } from "~/utils/option.ts";

export type FsWatcher$ = Deno.FsWatcher;

export const close: typeof $fsWatcher.close = (watcher: Deno.FsWatcher) => {
  watcher.close();
};

function toFsEventKind(value: Deno.FsEvent["kind"]): $fsEvent.FsEventKind$ {
  switch (value) {
    case "any":
      return $fsEvent.FsEventKind$Any();
    case "access":
      return $fsEvent.FsEventKind$Access();
    case "create":
      return $fsEvent.FsEventKind$Create();
    case "modify":
      return $fsEvent.FsEventKind$Modify();
    case "rename":
      return $fsEvent.FsEventKind$Rename();
    case "remove":
      return $fsEvent.FsEventKind$Remove();
    case "other":
      return $fsEvent.FsEventKind$Other();
    default:
      throw new Error(`Unknown FsEvent kind: ${value}`);
  }
}

function toFsEventFlag(value: Deno.FsEventFlag): $fsEvent.FsEventFlag$ {
  switch (value) {
    case "rescan":
      return $fsEvent.FsEventFlag$Rescan();
    default:
      throw new Error(`Unknown FsEvent flag: ${value}`);
  }
}

function toGleamFsEvent(event: Deno.FsEvent): $fsEvent.FsEvent {
  return $fsEvent.FsEvent$FsEvent(
    toFsEventKind(event.kind),
    fromArray(event.paths),
    $option.map(toOption(event.flag), toFsEventFlag),
  );
}

export const iterate_async: typeof $fsWatcher.iterate_async = (
  watcher: Deno.FsWatcher,
  callback,
) => {
  (async () => {
    for await (const event of watcher) {
      callback(toGleamFsEvent(event));
    }
  })();
};
