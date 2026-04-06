import * as $fsEvent from "$/amber/amber/deno/fs_event.mjs";
import type * as $fsWatcher from "$/amber/amber/deno/fs_watcher.mjs";
import * as $option from "$/gleam_stdlib/gleam/option.mjs";
import { toList } from "$/prelude.mjs";
import { toEnumCustomType } from "~/utils/enumCustomType.ts";
import { toOption } from "~/utils/option.ts";

export type FsWatcher$ = Deno.FsWatcher;

export const close: typeof $fsWatcher.close = (watcher: Deno.FsWatcher) => {
  watcher.close();
};

const toFsEventKind = toEnumCustomType<
  Deno.FsEvent["kind"],
  $fsEvent.FsEventKind$
>({
  any: $fsEvent.FsEventKind$Any,
  access: $fsEvent.FsEventKind$Access,
  create: $fsEvent.FsEventKind$Create,
  modify: $fsEvent.FsEventKind$Modify,
  rename: $fsEvent.FsEventKind$Rename,
  remove: $fsEvent.FsEventKind$Remove,
  other: $fsEvent.FsEventKind$Other,
});

const toFsEventFlag = toEnumCustomType<
  Deno.FsEventFlag,
  $fsEvent.FsEventFlag$
>({
  rescan: $fsEvent.FsEventFlag$Rescan,
});

function toGleamFsEvent(event: Deno.FsEvent): $fsEvent.FsEvent {
  return $fsEvent.FsEvent$FsEvent(
    toFsEventKind(event.kind),
    toList(event.paths),
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
