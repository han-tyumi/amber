import type { Error$ } from "$/amber/amber/deno/error.mjs";
import type * as $fsFile from "$/amber/amber/deno/fs_file.mjs";
import * as $seekMode from "$/amber/amber/deno/seek_mode.mjs";
import * as $result from "$/gleam_stdlib/gleam/result.mjs";
import type { Result } from "$/prelude.mjs";
import { toArray } from "~/utils/list.ts";
import { toBytesRead } from "./bytes_read.ts";
import { fromThrows } from "./error.ts";
import { toGleamFileInfo } from "./file_info.ts";
import { toSetRawOptions } from "./set_raw.ts";

export type FsFile$ = Deno.FsFile;

export const readable: typeof $fsFile.readable = (file: Deno.FsFile) => {
  return file.readable;
};

export const writable: typeof $fsFile.writable = (file: Deno.FsFile) => {
  return file.writable;
};

export const write_sync: typeof $fsFile.write_sync = (
  file: Deno.FsFile,
  p: Uint8Array,
) => {
  return fromThrows(() => file.writeSync(p));
};

export const truncate_sync: typeof $fsFile.truncate_sync = (
  file: Deno.FsFile,
) => {
  file.truncateSync();
  return file;
};

export const truncate_to_length_sync: typeof $fsFile.truncate_to_length_sync = (
  file: Deno.FsFile,
  len,
) => {
  file.truncateSync(len);
  return file;
};

export const read_sync: typeof $fsFile.read_sync = (
  file: Deno.FsFile,
  p: Uint8Array,
) => {
  return fromThrows(() => toBytesRead(file.readSync(p)));
};

function toSeekMode(
  instance: $seekMode.SeekMode$,
): Deno.SeekMode | undefined {
  if ($seekMode.SeekMode$isStart(instance)) return 0;
  if ($seekMode.SeekMode$isCurrent(instance)) return 1;
  if ($seekMode.SeekMode$isEnd(instance)) return 2;
  return undefined;
}

export const seek_sync: typeof $fsFile.seek_sync = (
  file: Deno.FsFile,
  offset,
  whence,
) => {
  return file.seekSync(offset, toSeekMode(whence) as Deno.SeekMode);
};

export const stat_sync: typeof $fsFile.stat_sync = (file: Deno.FsFile) => {
  return fromThrows(() => toGleamFileInfo(file.statSync()));
};

export const sync_sync: typeof $fsFile.sync_sync = (file: Deno.FsFile) => {
  file.syncSync();
  return file;
};

export const sync_data_sync: typeof $fsFile.sync_data_sync = (
  file: Deno.FsFile,
) => {
  file.syncDataSync();
  return file;
};

export const utime_sync: typeof $fsFile.utime_sync = (
  file: Deno.FsFile,
  atime,
  mtime,
) => {
  file.utimeSync(atime, mtime);
  return file;
};

export const is_terminal: typeof $fsFile.is_terminal = (file: Deno.FsFile) => {
  return file.isTerminal();
};

export const set_raw: typeof $fsFile.set_raw = (
  file: Deno.FsFile,
  mode,
  options,
) => {
  file.setRaw(
    mode,
    toSetRawOptions(toArray(options)) as Deno.SetRawOptions,
  );
  return file;
};

export const lock_sync: typeof $fsFile.lock_sync = (
  file: Deno.FsFile,
  exclusive,
) => {
  file.lockSync(exclusive);
  return file;
};

export const unlock_sync: typeof $fsFile.unlock_sync = (file: Deno.FsFile) => {
  file.unlockSync();
  return file;
};

export const close: typeof $fsFile.close = (file: Deno.FsFile) => {
  file.close();
};

export const using_: typeof $fsFile.using = <T>(
  fileResult: Result<Deno.FsFile, Error$>,
  fun: (file: Deno.FsFile) => Result<T, Error$>,
): Result<T, Error$> => {
  return $result.then$(fileResult, (file) => {
    using usedFile = file;
    return fun(usedFile);
  });
};
