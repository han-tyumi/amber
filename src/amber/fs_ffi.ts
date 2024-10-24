import type * as $fs from "amber/fs.mjs";
import * as $dirEntry from "amber/fs/dir_entry.mjs";
import * as $makeTemp from "amber/fs/make_temp.mjs";
import * as $mkdir from "amber/fs/mkdir.mjs";
import * as $open from "amber/fs/open.mjs";
import * as $remove from "amber/fs/remove.mjs";
import * as $symlink from "amber/fs/symlink.mjs";
import * as $watchFs from "amber/fs/watch_fs.mjs";
import * as $writeFile from "amber/fs/write_file.mjs";
import { unwrap } from "gleam/option.mjs";

import { CustomTypeOptionsMap } from "../utils/CustomTypeOptionsMap.ts";
import { fromEnumCustomType } from "../utils/enum_custom_type.ts";
import { fromArrayMapped } from "../utils/list.ts";
import { toResult } from "../utils/result.ts";
import { toError$ } from "./error.ts";
import { toGleamFileInfo } from "./fs/file_info.ts";

export const linkSync: typeof $fs.link_sync = (oldpath, newpath) => {
  return toResult.fromThrows(() => Deno.linkSync(oldpath, newpath), toError$);
};

const openOptionsMap = new CustomTypeOptionsMap<Deno.OpenOptions>()
  .set($open.Append, () => ({ append: true }))
  .set($open.Create, () => ({ create: true }))
  .set($open.CreateNew, () => ({ createNew: true }))
  .set($open.Mode, (mode) => ({ mode: mode[0] }))
  .set($open.Read, (read) => ({ read: read[0] }))
  .set($open.Truncate, () => ({ truncate: true }))
  .set($open.Write, () => ({ write: true }));

export const openSync: typeof $fs.open_sync = (path, options) => {
  return Deno.openSync(path, openOptionsMap.customTypeListToOptions(options));
};

export const createSync: typeof $fs.create_sync = (path) =>
  Deno.createSync(path);

const mkdirOptionsMap = new CustomTypeOptionsMap<Deno.MkdirOptions>()
  .set($mkdir.Mode, (mode) => ({ mode: mode[0] }))
  .set($mkdir.Recursive, () => ({ recursive: true }));

export const mkdirSync: typeof $fs.mkdir_sync = (
  path,
  options,
) => {
  Deno.mkdirSync(path, mkdirOptionsMap.customTypeListToOptions(options));
};

const makeTempOptionsMap = new CustomTypeOptionsMap<Deno.MakeTempOptions>()
  .set($makeTemp.Dir, (dir) => ({ dir: dir[0] }))
  .set($makeTemp.Prefix, (prefix) => ({ prefix: prefix[0] }))
  .set($makeTemp.Suffix, (suffix) => ({ suffix: suffix[0] }));

export const makeTempDirSync: typeof $fs.make_temp_dir_sync = (options) => {
  return Deno.makeTempDirSync(
    makeTempOptionsMap.customTypeListToOptions(options),
  );
};

export const makeTempFileSync: typeof $fs.make_temp_file_sync = (options) => {
  return Deno.makeTempFileSync(
    makeTempOptionsMap.customTypeListToOptions(options),
  );
};

export const chmodSync: typeof $fs.chmod_sync = (path, mode) => {
  Deno.chmodSync(path, mode);
};

export const chownSync: typeof $fs.chown_sync = (
  path,
  uid,
  gid,
) => {
  Deno.chownSync(path, unwrap(uid, null), unwrap(gid, null));
};

const removeOptionsMap = new CustomTypeOptionsMap<Deno.RemoveOptions>()
  .set($remove.Recursive, () => ({ recursive: true }));

export const removeSync: typeof $fs.remove_sync = (
  path,
  options,
) => {
  Deno.removeSync(path, removeOptionsMap.customTypeListToOptions(options));
};

export const renameSync: typeof $fs.rename_sync = (oldpath, newpath) => {
  Deno.renameSync(oldpath, newpath);
};

export const readTextFileSync: typeof $fs.read_text_file_sync =
  Deno.readTextFileSync;

export const readFileSync: typeof $fs.read_file_sync = Deno.readFileSync;

export const realPathSync: typeof $fs.real_path_sync = Deno.realPathSync;

export const readDirSync: typeof $fs.read_dir_sync = (path) => {
  const entries = Deno.readDirSync(path);
  return fromArrayMapped(
    Array.from(entries),
    (entry) =>
      new $dirEntry.DirEntry(
        entry.name,
        entry.isFile,
        entry.isDirectory,
        entry.isSymlink,
      ),
  );
};

export const copyFileSync: typeof $fs.copy_file_sync = (from_path, to_path) => {
  Deno.copyFileSync(from_path, to_path);
};

export const readLinkSync: typeof $fs.read_link_sync = Deno.readLinkSync;

export const lstatSync: typeof $fs.lstat_sync = (path) => {
  return toGleamFileInfo(Deno.lstatSync(path));
};

export const statSync: typeof $fs.stat_sync = (path) => {
  return toGleamFileInfo(Deno.statSync(path));
};

const writeFileOptionsMap = new CustomTypeOptionsMap<Deno.WriteFileOptions>()
  .set($writeFile.Append, () => ({ append: true }))
  .set($writeFile.Create, (create) => ({ create: create[0] }))
  .set($writeFile.CreateNew, () => ({ createNew: true }))
  .set($writeFile.Mode, (mode) => ({ mode: mode[0] }))
  .set($writeFile.Signal, (signal) => ({ signal: signal[0] }));

export const writeFileSync: typeof $fs.write_file_sync = (
  path,
  data,
  options,
) => {
  Deno.writeFileSync(
    path,
    data,
    writeFileOptionsMap.customTypeListToOptions(options),
  );
};

export const writeTextFileSync: typeof $fs.write_text_file_sync = (
  path,
  data,
  options,
) => {
  Deno.writeTextFileSync(
    path,
    data,
    writeFileOptionsMap.customTypeListToOptions(options),
  );
};

export const truncateSync: typeof $fs.truncate_sync = (name, len) => {
  Deno.truncateSync(name, unwrap(len, undefined));
};

type WatchFsOptions = NonNullable<Parameters<typeof Deno.watchFs>["1"]>;

const watchFsOptionsMap = new CustomTypeOptionsMap<WatchFsOptions>()
  .set($watchFs.Recursive, (recursive) => ({ recursive: recursive[0] }));

export const watchFs: typeof $fs.watch_fs = (paths, options) => {
  return Deno.watchFs(
    paths.toArray(),
    watchFsOptionsMap.customTypeListToOptions(options) as WatchFsOptions,
  );
};

const toSymlinkType = fromEnumCustomType<Deno.SymlinkOptions["type"]>(
  new Map([
    [$symlink.File, "file"],
    [$symlink.Dir, "dir"],
    [$symlink.Junction, "junction"],
  ]),
);

const symlinkOptionsMap = new CustomTypeOptionsMap<Deno.SymlinkOptions>()
  .set($symlink.Type, (type) => ({ type: toSymlinkType(type[0]) }));

export const symlinkSync: typeof $fs.symlink_sync = (
  oldpath,
  newpath,
  options,
) => {
  Deno.symlinkSync(
    oldpath,
    newpath,
    symlinkOptionsMap.customTypeListToOptions(options) as Deno.SymlinkOptions,
  );
};

export const utimeSync: typeof $fs.utime_sync = (path, atime, mtime) => {
  Deno.utimeSync(path, atime, mtime);
};

export const umask: typeof $fs.umask = (mask) => {
  return Deno.umask(unwrap(mask, undefined));
};
