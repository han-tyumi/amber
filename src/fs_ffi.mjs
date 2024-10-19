import { toList } from "gleam";

import * as $make_temp from "gleano/fs/make_temp.mjs";
import * as $mkdir from "gleano/fs/mkdir.mjs";
import * as $open from "gleano/fs/open.mjs";
import * as $symlink from "gleano/fs/symlink.mjs";
import * as $write_file from "gleano/fs/write_file.mjs";
import * as $remove from "gleano/fs/remove.mjs";
import * as $dir_entry from "gleano/fs/dir_entry.mjs";
import * as $file_info from "gleano/fs/file_info.mjs";

import {
  enumToString,
  flag,
  lazyMap,
  objectToCustomType,
  optionFromNullable,
  unwrapArg,
  withArgTransform,
  withOptions,
  withReturnTransform,
  wrapped,
} from "./ffi_util.mjs";

export const link_sync = Deno.linkSync;

export const open_sync = withOptions(
  Deno.openSync,
  lazyMap(
    [$open.Append, flag("append")],
    [$open.Create, flag("create")],
    [$open.CreateNew, flag("createNew")],
    [$open.Mode, wrapped("mode")],
    [$open.Read, wrapped("read")],
    [$open.Truncate, flag("truncate")],
    [$open.Write, flag("write")],
  ),
);

export const create_sync = Deno.createSync;

export const mkdir_sync = withOptions(
  Deno.mkdirSync,
  lazyMap(
    [$mkdir.Mode, wrapped("mode")],
    [$mkdir.Recursive, flag("recursive")],
  ),
);

const getMakeTempOptionsMap = lazyMap(
  [$make_temp.Dir, wrapped("dir")],
  [$make_temp.Prefix, wrapped("prefix")],
  [$make_temp.Suffix, wrapped("suffix")],
);

const withMakeTempOptions = (fn) => withOptions(fn, getMakeTempOptionsMap);

export const make_temp_dir_sync = withMakeTempOptions(Deno.makeTempDirSync);

export const make_temp_file_sync = withMakeTempOptions(Deno.makeTempFileSync);

export const chmod_sync = Deno.chmodSync;

export const chown_sync = withArgTransform(
  Deno.chownSync,
  [null, unwrapArg(null), unwrapArg(null)],
);

export const remove_sync = withOptions(
  Deno.removeSync,
  lazyMap(
    [$remove.Recursive, flag("recursive")],
  ),
);

export const rename_sync = Deno.renameSync;

export const read_text_file_sync = Deno.readTextFileSync;

export const read_file_sync = Deno.readFileSync;

export const real_path_sync = Deno.realPathSync;

export const read_dir_sync = withReturnTransform(
  Deno.readDirSync,
  (dirEntries) =>
    toList(
      [...dirEntries].map(
        objectToCustomType($dir_entry.DirEntry, [
          ["name"],
          ["isFile"],
          ["isDirectory"],
          ["isSymlink"],
        ]),
      ),
    ),
);

export const copy_file_sync = Deno.copyFileSync;

export const read_link_sync = Deno.readLinkSync;

const objectToFileInfo = objectToCustomType($file_info.FileInfo, [
  ["isFile"],
  ["isDirectory"],
  ["isSymlink"],
  ["size"],
  ["mtime", optionFromNullable],
  ["atime", optionFromNullable],
  ["birthtime", optionFromNullable],
  ["dev"],
  ["ino", optionFromNullable],
  ["mode", optionFromNullable],
  ["nlink", optionFromNullable],
  ["uid", optionFromNullable],
  ["gid", optionFromNullable],
  ["rdev", optionFromNullable],
  ["blksize", optionFromNullable],
  ["blocks", optionFromNullable],
  ["isBlockDevice", optionFromNullable],
  ["isCharDevice", optionFromNullable],
  ["isFifo", optionFromNullable],
  ["isSocket", optionFromNullable],
]);

export const lstat_sync = withReturnTransform(
  Deno.lstatSync,
  objectToFileInfo,
);

export const stat_sync = withReturnTransform(
  Deno.statSync,
  objectToFileInfo,
);

const getWriteFileOptionsMap = lazyMap(
  [$write_file.Append, flag("append")],
  [$write_file.Create, wrapped("create")],
  [$write_file.CreateNew, flag("createNew")],
  [$write_file.Mode, wrapped("mode")],
  [$write_file.Signal, wrapped("signal")],
);

const withWriteFileOptions = (fn) => withOptions(fn, getWriteFileOptionsMap);

export const write_file_sync = withWriteFileOptions(
  Deno.writeFileSync,
);

export const write_text_file_sync = withWriteFileOptions(
  Deno.writeTextFileSync,
);

export const truncate_sync = withArgTransform(
  Deno.truncateSync,
  [null, unwrapArg()],
);

export const watch_fs = () => {
  throw new Error("watch_fs not implemented");
};

export const symlink_sync = withOptions(
  Deno.symlinkSync,
  lazyMap(
    [
      $symlink.Type,
      wrapped(
        "type",
        enumToString(lazyMap(
          [$symlink.File, "file"],
          [$symlink.Dir, "dir"],
          [$symlink.Junction, "junction"],
        )),
      ),
    ],
  ),
);

export const utime_sync = Deno.utimeSync;

export const umask = withArgTransform(Deno.umask, [unwrapArg()]);
