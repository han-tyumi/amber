import { toList } from "gleam";
import * as $option from "gleam/option.mjs";
import * as $fs_watcher from "gleano/fs/fs_watcher.mjs";

import {
  lazy,
  objectToCustomType,
  optionFromNullable,
  stringToEnum,
} from "./ffi_util.mjs";

export function close(watcher) {
  watcher.close();
}

const fsEventKindMap = lazy(() => ({
  "any": $fs_watcher.Any,
  "access": $fs_watcher.Access,
  "create": $fs_watcher.Create,
  "modify": $fs_watcher.Modify,
  "rename": $fs_watcher.Rename,
  "remove": $fs_watcher.Remove,
  "other": $fs_watcher.Other,
}));

const fsEventFlagMap = lazy(() => ({
  "rescan": $fs_watcher.Rescan,
}));

function createCustomEvent(event) {
  return objectToCustomType($fs_watcher.FsEvent, [
    ["kind", stringToEnum(fsEventKindMap)],
    ["paths", toList],
    [
      "flag",

      (flag) =>
        $option.map(optionFromNullable(flag), stringToEnum(fsEventFlagMap)),
    ],
  ])(event);
}

export async function iterate_async(watcher, callback) {
  for await (const event of watcher) {
    callback(createCustomEvent(event));
  }
}
