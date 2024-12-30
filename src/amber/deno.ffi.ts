import type * as $deno from "$/amber/amber/deno.mjs";
import * as $build from "$/amber/amber/deno/build.mjs";
import * as $dirEntry from "$/amber/amber/deno/dir_entry.mjs";
import * as $makeTemp from "$/amber/amber/deno/make_temp.mjs";
import * as $mkdir from "$/amber/amber/deno/mkdir.mjs";
import * as $open from "$/amber/amber/deno/open.mjs";
import * as $remove from "$/amber/amber/deno/remove.mjs";
import * as $symlink from "$/amber/amber/deno/symlink.mjs";
import { Version } from "$/amber/amber/deno/version.mjs";
import * as $watchFs from "$/amber/amber/deno/watch_fs.mjs";
import * as $writeFile from "$/amber/amber/deno/write_file.mjs";
import { unwrap } from "$/gleam_stdlib/gleam/option.mjs";
import { List } from "$/prelude.mjs";
import { toArchType } from "~/amber/deno/build/arch.ts";
import { toOsType } from "~/amber/deno/build/os.ts";
import { fromThrows } from "~/amber/deno/error.ts";
import { toGleamFileInfo } from "~/amber/deno/file_info.ts";
import { toMemoryUsageType } from "~/amber/deno/memory_usage.ts";
import { toSignal } from "~/amber/deno/signal.ts";
import { toSystemMemoryInfoType } from "~/amber/deno/system_memory_info.ts";
import { CustomTypeOptionsMap } from "~/utils/CustomTypeOptionsMap.ts";
import { fromEnumCustomType } from "~/utils/enumCustomType.ts";
import { fromArrayMapped } from "~/utils/list.ts";
import { toOption } from "~/utils/option.ts";

// File System

export const link_sync: typeof $deno.link_sync = (oldpath, newpath) => {
  return fromThrows(() => Deno.linkSync(oldpath, newpath));
};

const openOptionsMap = new CustomTypeOptionsMap<Deno.OpenOptions>()
  .set($open.Append, () => ({ append: true }))
  .set($open.Create, () => ({ create: true }))
  .set($open.CreateNew, () => ({ createNew: true }))
  .set($open.Mode, (mode) => ({ mode: mode[0] }))
  .set($open.Read, () => ({ read: true }))
  .set($open.Truncate, () => ({ truncate: true }))
  .set($open.Write, () => ({ write: true }));

export const open_sync: typeof $deno.open_sync = (path, options) => {
  return fromThrows(() =>
    Deno.openSync(path, openOptionsMap.customTypeListToOptions(options))
  );
};

export const create_sync: typeof $deno.create_sync = (path) =>
  fromThrows(() => Deno.createSync(path));

const mkdirOptionsMap = new CustomTypeOptionsMap<Deno.MkdirOptions>()
  .set($mkdir.Mode, (mode) => ({ mode: mode[0] }))
  .set($mkdir.Recursive, () => ({ recursive: true }));

export const mkdir_sync: typeof $deno.mkdir_sync = (
  path,
  options,
) => {
  Deno.mkdirSync(path, mkdirOptionsMap.customTypeListToOptions(options));
};

const makeTempOptionsMap = new CustomTypeOptionsMap<Deno.MakeTempOptions>()
  .set($makeTemp.Dir, (dir) => ({ dir: dir[0] }))
  .set($makeTemp.Prefix, (prefix) => ({ prefix: prefix[0] }))
  .set($makeTemp.Suffix, (suffix) => ({ suffix: suffix[0] }));

export const make_temp_dir_sync: typeof $deno.make_temp_dir_sync = (
  options,
) => {
  return Deno.makeTempDirSync(
    makeTempOptionsMap.customTypeListToOptions(options),
  );
};

export const make_temp_file_sync: typeof $deno.make_temp_file_sync = (
  options,
) => {
  return Deno.makeTempFileSync(
    makeTempOptionsMap.customTypeListToOptions(options),
  );
};

export const chmod_sync: typeof $deno.chmod_sync = (path, mode) => {
  Deno.chmodSync(path, mode);
};

export const chown_sync: typeof $deno.chown_sync = (
  path,
  uid,
  gid,
) => {
  Deno.chownSync(path, unwrap(uid, null), unwrap(gid, null));
};

const removeOptionsMap = new CustomTypeOptionsMap<Deno.RemoveOptions>()
  .set($remove.Recursive, () => ({ recursive: true }));

export const remove_sync: typeof $deno.remove_sync = (
  path,
  options,
) => {
  Deno.removeSync(path, removeOptionsMap.customTypeListToOptions(options));
};

export const rename_sync: typeof $deno.rename_sync = (oldpath, newpath) => {
  Deno.renameSync(oldpath, newpath);
};

export const read_text_file_sync: typeof $deno.read_text_file_sync =
  Deno.readTextFileSync;

export const read_file_sync: typeof $deno.read_file_sync = Deno.readFileSync;

export const real_path_sync: typeof $deno.real_path_sync = Deno.realPathSync;

export const read_dir_sync: typeof $deno.read_dir_sync = (path) => {
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

export const copy_file_sync: typeof $deno.copy_file_sync = (
  from_path,
  to_path,
) => {
  Deno.copyFileSync(from_path, to_path);
};

export const read_link_sync: typeof $deno.read_link_sync = Deno.readLinkSync;

export const lstat_sync: typeof $deno.lstat_sync = (path) => {
  return toGleamFileInfo(Deno.lstatSync(path));
};

export const stat_sync: typeof $deno.stat_sync = (path) => {
  return toGleamFileInfo(Deno.statSync(path));
};

const writeFileOptionsMap = new CustomTypeOptionsMap<Deno.WriteFileOptions>()
  .set($writeFile.Append, () => ({ append: true }))
  .set($writeFile.Create, (create) => ({ create: create[0] }))
  .set($writeFile.CreateNew, () => ({ createNew: true }))
  .set($writeFile.Mode, (mode) => ({ mode: mode[0] }))
  .set($writeFile.Signal, (signal) => ({ signal: signal[0] }));

export const write_file_sync: typeof $deno.write_file_sync = (
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

export const write_text_file_sync: typeof $deno.write_text_file_sync = (
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

export const truncate_sync: typeof $deno.truncate_sync = (name, len) => {
  Deno.truncateSync(name, unwrap(len, undefined));
};

type WatchFsOptions = NonNullable<Parameters<typeof Deno.watchFs>["1"]>;

const watchFsOptionsMap = new CustomTypeOptionsMap<WatchFsOptions>()
  .set($watchFs.Recursive, (recursive) => ({ recursive: recursive[0] }));

export const watch_fs: typeof $deno.watch_fs = (paths, options) => {
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

export const symlink_sync: typeof $deno.symlink_sync = (
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

export const utime_sync: typeof $deno.utime_sync = (path, atime, mtime) => {
  Deno.utimeSync(path, atime, mtime);
};

export const umask: typeof $deno.umask = () => {
  return Deno.umask();
};

export const set_umask: typeof $deno.set_umask = (mask) => {
  return Deno.umask(mask);
};

// Runtime

export const add_signal_listener: typeof $deno.add_signal_listener = (
  signal,
  handler,
) => {
  // deno-lint-ignore no-non-null-assertion
  Deno.addSignalListener(toSignal(signal)!, handler);
};

export const chdir: typeof $deno.chdir = (directory) => {
  return fromThrows(() => {
    Deno.chdir(directory);
  });
};

export const cwd: typeof $deno.cwd = () => {
  return Deno.cwd();
};

export const exec_path: typeof $deno.exec_path = () => {
  return Deno.execPath();
};

export const exit: typeof $deno.exit = () => {
  Deno.exit();
};

export const exit_with: typeof $deno.exit_with = (code) => {
  Deno.exit(code);
};

export const gid: typeof $deno.gid = () => {
  return toOption(Deno.gid());
};

export const hostname: typeof $deno.hostname = () => {
  return Deno.hostname();
};

export const loadavg: typeof $deno.loadavg = () => {
  return Deno.loadavg() as [number, number, number];
};

export const memory_usage: typeof $deno.memory_usage = () => {
  return toMemoryUsageType(Deno.memoryUsage());
};

export const os_release: typeof $deno.os_release = () => {
  return Deno.osRelease();
};

export const os_uptime: typeof $deno.os_uptime = () => {
  return Deno.osUptime();
};

export const ref_timer: typeof $deno.ref_timer = (id) => {
  Deno.refTimer(id);
};

export const remove_signal_listener: typeof $deno.remove_signal_listener = (
  signal,
  handler,
) => {
  // deno-lint-ignore no-non-null-assertion
  Deno.removeSignalListener(toSignal(signal)!, handler);
};

export const system_memory_info: typeof $deno.system_memory_info = () => {
  return toSystemMemoryInfoType(Deno.systemMemoryInfo());
};

export const uid: typeof $deno.uid = () => {
  return toOption(Deno.uid());
};

export const unref_timer: typeof $deno.unref_timer = (id) => {
  Deno.unrefTimer(id);
};

export const args: typeof $deno.args = () => {
  return List.fromArray(Deno.args);
};

export const build: typeof $deno.build = () => {
  return new $build.Build(
    Deno.build.target,
    toArchType(Deno.build.arch),
    toOsType(Deno.build.os),
    Deno.build.target,
    toOption(Deno.build.vendor),
  );
};

export const exit_code: typeof $deno.exit_code = () => {
  return Deno.exitCode;
};

export const set_exit_code: typeof $deno.set_exit_code = (code) => {
  Deno.exitCode = code;
};

export const main_module: typeof $deno.main_module = () => {
  return Deno.mainModule;
};

export const no_color: typeof $deno.no_color = () => {
  return Deno.noColor;
};

export const pid: typeof $deno.pid = () => {
  return Deno.pid;
};

export const ppid: typeof $deno.ppid = () => {
  return Deno.ppid;
};

export const version: typeof $deno.version = () => {
  return new Version(
    Deno.version.deno,
    Deno.version.v8,
    Deno.version.typescript,
  );
};
