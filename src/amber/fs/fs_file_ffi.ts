import type * as $fsFile from "amber/fs/fs_file.mjs";
import * as $seekMode from "amber/fs/seek_mode.mjs";
import * as $setRaw from "amber/fs/set_raw.mjs";
import { unwrap } from "gleam/option.mjs";

import { CustomTypeOptionsMap } from "../../utils/CustomTypeOptionsMap.ts";
import { fromEnumCustomType } from "../../utils/enum_custom_type.ts";
import { toResult } from "../../utils/result.ts";
import { toGleamFileInfo } from "./file_info.ts";

export const readable: typeof $fsFile.readable = (file: Deno.FsFile) => {
  return file.readable;
};

export const writable: typeof $fsFile.writable = (file: Deno.FsFile) => {
  return file.writable;
};

export const writeSync: typeof $fsFile.write_sync = (
  file: Deno.FsFile,
  p: Uint8Array,
) => {
  return file.writeSync(p);
};

export const truncateSync: typeof $fsFile.truncate_sync = (
  file: Deno.FsFile,
  len,
) => {
  file.truncateSync(unwrap(len, undefined));
  return file;
};

export const readSync: typeof $fsFile.read_sync = (
  file: Deno.FsFile,
  p: Uint8Array,
) => {
  return toResult(file.readSync(p), undefined);
};

const toSeekMode = fromEnumCustomType<Deno.SeekMode>(
  new Map([
    [$seekMode.Start, 0],
    [$seekMode.Current, 1],
    [$seekMode.End, 2],
  ]),
);

export const seekSync: typeof $fsFile.seek_sync = (
  file: Deno.FsFile,
  offset,
  whence,
) => {
  return file.seekSync(offset, toSeekMode(whence) as Deno.SeekMode);
};

export const statSync: typeof $fsFile.stat_sync = (file: Deno.FsFile) => {
  return toGleamFileInfo(file.statSync());
};

export const syncSync: typeof $fsFile.sync_sync = (file: Deno.FsFile) => {
  file.syncSync();
  return file;
};

export const syncDataSync: typeof $fsFile.sync_data_sync = (
  file: Deno.FsFile,
) => {
  file.syncDataSync();
  return file;
};

export const utimeSync: typeof $fsFile.utime_sync = (
  file: Deno.FsFile,
  atime,
  mtime,
) => {
  file.utimeSync(atime, mtime);
  return file;
};

export const isTerminal: typeof $fsFile.is_terminal = (file: Deno.FsFile) => {
  return file.isTerminal();
};

const setRawOptionsMap = new CustomTypeOptionsMap<Deno.SetRawOptions>()
  .set($setRaw.Cbreak, (cbreak) => ({ cbreak: cbreak[0] }));

export const setRaw: typeof $fsFile.set_raw = (
  file: Deno.FsFile,
  mode,
  options,
) => {
  file.setRaw(
    mode,
    setRawOptionsMap.customTypeListToOptions(options) as Deno.SetRawOptions,
  );
  return file;
};

export const lockSync: typeof $fsFile.lock_sync = (
  file: Deno.FsFile,
  exclusive,
) => {
  file.lockSync(exclusive);
  return file;
};

export const unlockSync: typeof $fsFile.unlock_sync = (file: Deno.FsFile) => {
  file.unlockSync();
  return file;
};

export const close: typeof $fsFile.close = (file: Deno.FsFile) => {
  file.close();
};
