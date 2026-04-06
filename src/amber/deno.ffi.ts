import type * as $deno from "$/amber/amber/deno.mjs";
import * as $build from "$/amber/amber/deno/build.mjs";
import * as $dirEntry from "$/amber/amber/deno/dir_entry.mjs";
import * as $makeTemp from "$/amber/amber/deno/make_temp.mjs";
import * as $mkdir from "$/amber/amber/deno/mkdir.mjs";
import * as $open from "$/amber/amber/deno/open.mjs";
import * as $remove from "$/amber/amber/deno/remove.mjs";
import * as $symlink from "$/amber/amber/deno/symlink.mjs";
import * as $version from "$/amber/amber/deno/version.mjs";
import * as $watchFs from "$/amber/amber/deno/watch_fs.mjs";
import * as $writeFile from "$/amber/amber/deno/write_file.mjs";
import { unwrap } from "$/gleam_stdlib/gleam/option.mjs";
import { toArchType } from "~/amber/deno/build/arch.ts";
import { toOsType } from "~/amber/deno/build/os.ts";
import { fromThrows } from "~/amber/deno/error.ts";
import { toGleamFileInfo } from "~/amber/deno/file_info.ts";
import { toMemoryUsageType } from "~/amber/deno/memory_usage.ts";
import { toConsoleSizeType } from "~/amber/deno/console_size.ts";
import { toInspectOptions } from "~/amber/deno/inspect_option.ts";
import { toNetworkInterfaceInfoType } from "~/amber/deno/network_interface_info.ts";
import { toSignal } from "~/amber/deno/signal.ts";
import { toSystemMemoryInfoType } from "~/amber/deno/system_memory_info.ts";
import { fromArray, fromArrayMapped, toArray } from "~/utils/list.ts";
import { toOption } from "~/utils/option.ts";

// File System

export const link_sync: typeof $deno.link_sync = (oldpath, newpath) => {
  return fromThrows(() => Deno.linkSync(oldpath, newpath));
};

function toOpenOptions(options: $open.OpenOption$[]): Deno.OpenOptions {
  const result: Deno.OpenOptions = {};
  for (const option of options) {
    if ($open.OpenOption$isAppend(option)) result.append = true;
    else if ($open.OpenOption$isCreate(option)) result.create = true;
    else if ($open.OpenOption$isCreateNew(option)) result.createNew = true;
    else if ($open.OpenOption$isMode(option)) {
      result.mode = $open.OpenOption$Mode$0(option);
    } else if ($open.OpenOption$isRead(option)) result.read = true;
    else if ($open.OpenOption$isTruncate(option)) result.truncate = true;
    else if ($open.OpenOption$isWrite(option)) result.write = true;
  }
  return result;
}

export const open_sync: typeof $deno.open_sync = (path, options) => {
  return fromThrows(() => Deno.openSync(path, toOpenOptions(toArray(options))));
};

export const create_sync: typeof $deno.create_sync = (path) =>
  fromThrows(() => Deno.createSync(path));

function toMkdirOptions(options: $mkdir.MkdirOption$[]): Deno.MkdirOptions {
  const result: Deno.MkdirOptions = {};
  for (const option of options) {
    if ($mkdir.MkdirOption$isMode(option)) {
      result.mode = $mkdir.MkdirOption$Mode$0(option);
    } else if ($mkdir.MkdirOption$isRecursive(option)) result.recursive = true;
  }
  return result;
}

export const mkdir_sync: typeof $deno.mkdir_sync = (
  path,
  options,
) => {
  Deno.mkdirSync(path, toMkdirOptions(toArray(options)));
};

function toMakeTempOptions(
  options: $makeTemp.MakeTempOption$[],
): Deno.MakeTempOptions {
  const result: Deno.MakeTempOptions = {};
  for (const option of options) {
    if ($makeTemp.MakeTempOption$isDir(option)) {
      result.dir = $makeTemp.MakeTempOption$Dir$0(option);
    } else if ($makeTemp.MakeTempOption$isPrefix(option)) {
      result.prefix = $makeTemp.MakeTempOption$Prefix$0(option);
    } else if ($makeTemp.MakeTempOption$isSuffix(option)) {
      result.suffix = $makeTemp.MakeTempOption$Suffix$0(option);
    }
  }
  return result;
}

export const make_temp_dir_sync: typeof $deno.make_temp_dir_sync = (
  options,
) => {
  return Deno.makeTempDirSync(toMakeTempOptions(toArray(options)));
};

export const make_temp_file_sync: typeof $deno.make_temp_file_sync = (
  options,
) => {
  return Deno.makeTempFileSync(toMakeTempOptions(toArray(options)));
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

function toRemoveOptions(
  options: $remove.RemoveOption$[],
): Deno.RemoveOptions {
  const result: Deno.RemoveOptions = {};
  for (const option of options) {
    if ($remove.RemoveOption$isRecursive(option)) result.recursive = true;
  }
  return result;
}

export const remove_sync: typeof $deno.remove_sync = (
  path,
  options,
) => {
  Deno.removeSync(path, toRemoveOptions(toArray(options)));
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
      $dirEntry.DirEntry$DirEntry(
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

function toWriteFileOptions(
  options: $writeFile.WriteFileOption$[],
): Deno.WriteFileOptions {
  const result: Deno.WriteFileOptions = {};
  for (const option of options) {
    if ($writeFile.WriteFileOption$isAppend(option)) result.append = true;
    else if ($writeFile.WriteFileOption$isCreate(option)) {
      result.create = $writeFile.WriteFileOption$Create$0(option);
    } else if ($writeFile.WriteFileOption$isCreateNew(option)) {
      result.createNew = true;
    } else if ($writeFile.WriteFileOption$isMode(option)) {
      result.mode = $writeFile.WriteFileOption$Mode$0(option);
    } else if ($writeFile.WriteFileOption$isSignal(option)) {
      result.signal = $writeFile.WriteFileOption$Signal$0(option);
    }
  }
  return result;
}

export const write_file_sync: typeof $deno.write_file_sync = (
  path,
  data,
  options,
) => {
  Deno.writeFileSync(
    path,
    data,
    toWriteFileOptions(toArray(options)),
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
    toWriteFileOptions(toArray(options)),
  );
};

export const truncate_sync: typeof $deno.truncate_sync = (name, len) => {
  Deno.truncateSync(name, unwrap(len, undefined));
};

type WatchFsOptions = NonNullable<Parameters<typeof Deno.watchFs>["1"]>;

function toWatchFsOptions(
  options: $watchFs.WatchFsOption$[],
): Partial<WatchFsOptions> {
  const result: Partial<WatchFsOptions> = {};
  for (const option of options) {
    if ($watchFs.WatchFsOption$isRecursive(option)) {
      result.recursive = $watchFs.WatchFsOption$Recursive$0(option);
    }
  }
  return result;
}

export const watch_fs: typeof $deno.watch_fs = (paths, options) => {
  return Deno.watchFs(
    toArray(paths),
    toWatchFsOptions(toArray(options)) as WatchFsOptions,
  );
};

function toSymlinkType(
  instance: $symlink.SymlinkType$,
): Deno.SymlinkOptions["type"] | undefined {
  if ($symlink.SymlinkType$isFile(instance)) return "file";
  if ($symlink.SymlinkType$isDir(instance)) return "dir";
  if ($symlink.SymlinkType$isJunction(instance)) return "junction";
  return undefined;
}

function toSymlinkOptions(
  options: $symlink.SymlinkOption$[],
): Partial<Deno.SymlinkOptions> {
  const result: Partial<Deno.SymlinkOptions> = {};
  for (const option of options) {
    if ($symlink.SymlinkOption$isType(option)) {
      result.type = toSymlinkType($symlink.SymlinkOption$Type$0(option));
    }
  }
  return result;
}

export const symlink_sync: typeof $deno.symlink_sync = (
  oldpath,
  newpath,
  options,
) => {
  Deno.symlinkSync(
    oldpath,
    newpath,
    toSymlinkOptions(toArray(options)) as Deno.SymlinkOptions,
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

// I/O

export const console_size: typeof $deno.console_size = () => {
  return toConsoleSizeType(Deno.consoleSize());
};

export const inspect: typeof $deno.inspect = (value, options) => {
  return Deno.inspect(value, toInspectOptions(toArray(options)));
};

// Network

export const network_interfaces: typeof $deno.network_interfaces = () => {
  return fromArrayMapped(Deno.networkInterfaces(), toNetworkInterfaceInfoType);
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
  return fromArray(Deno.args);
};

export const build: typeof $deno.build = () => {
  return $build.Build$Build(
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
  return $version.Version$Version(
    Deno.version.deno,
    Deno.version.v8,
    Deno.version.typescript,
  );
};

// Subprocess

export const kill: typeof $deno.kill = (pid) => {
  Deno.kill(pid);
};

export const kill_with: typeof $deno.kill_with = (pid, signal) => {
  Deno.kill(pid, toSignal(signal));
};
