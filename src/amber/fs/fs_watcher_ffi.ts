import * as $fsEvent from "amber/fs/fs_event.mjs";
import type * as $fsWatcher from "amber/fs/fs_watcher.mjs";
import * as $option from "gleam/option.mjs";
import { toList } from "prelude";

import { toEnumCustomType } from "../../utils/enum_custom_type.ts";
import { toOption } from "../../utils/option.ts";

export const close: typeof $fsWatcher.close = (watcher: Deno.FsWatcher) => {
  watcher.close();
};

const toFsEventKind = toEnumCustomType<
  Deno.FsEvent["kind"],
  $fsEvent.FsEventKind$
>({
  any: $fsEvent.Any,
  access: $fsEvent.Access,
  create: $fsEvent.Create,
  modify: $fsEvent.Modify,
  rename: $fsEvent.Rename,
  remove: $fsEvent.Remove,
  other: $fsEvent.Other,
});

const toFsEventFlag = toEnumCustomType<
  Deno.FsEventFlag,
  $fsEvent.FsEventFlag$
>({
  rescan: $fsEvent.Rescan,
});

function toGleamFsEvent(event: Deno.FsEvent): $fsEvent.FsEvent {
  return new $fsEvent.FsEvent(
    toFsEventKind(event.kind),
    toList(event.paths),
    $option.map(toOption(event.flag), toFsEventFlag),
  );
}

export const iterateAsync: typeof $fsWatcher.iterate_async = (
  watcher: Deno.FsWatcher,
  callback,
) => {
  (async () => {
    for await (const event of watcher) {
      callback(toGleamFsEvent(event));
    }
  })();
};
