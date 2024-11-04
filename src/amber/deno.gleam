import amber/deno/dir_entry.{type DirEntry}
import amber/deno/error.{type Error}
import amber/deno/file_info.{type FileInfo}
import amber/deno/fs_file.{type FsFile}
import amber/deno/fs_watcher.{type FsWatcher}
import amber/deno/make_temp.{type MakeTempOption}
import amber/deno/mkdir.{type MkdirOption}
import amber/deno/open.{type OpenOption}
import amber/deno/remove.{type RemoveOption}
import amber/deno/symlink.{type SymlinkOption}
import amber/deno/watch_fs.{type WatchFsOption}
import amber/deno/write_file.{type WriteFileOption}
import amber/web/uint8_array.{type Uint8Array}
import gleam/option.{type Option}

@external(javascript, "../amber__deno.ffi.mjs", "link_sync")
pub fn link_sync(oldpath: String, newpath: String) -> Result(Nil, Error)

@external(javascript, "../amber__deno.ffi.mjs", "open_sync")
pub fn open_sync(
  path: String,
  options: List(OpenOption),
) -> Result(FsFile, Error)

@external(javascript, "../amber__deno.ffi.mjs", "create_sync")
pub fn create_sync(path: String) -> Result(FsFile, Error)

@external(javascript, "../amber__deno.ffi.mjs", "mkdir_sync")
pub fn mkdir_sync(path: String, options: List(MkdirOption)) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "make_temp_dir_sync")
pub fn make_temp_dir_sync(options: List(MakeTempOption)) -> String

@external(javascript, "../amber__deno.ffi.mjs", "make_temp_file_sync")
pub fn make_temp_file_sync(options: List(MakeTempOption)) -> String

@external(javascript, "../amber__deno.ffi.mjs", "chmod_sync")
pub fn chmod_sync(path: String, mode: Int) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "chown_sync")
pub fn chown_sync(path: String, uid: Option(Int), gid: Option(Int)) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "remove_sync")
pub fn remove_sync(path: String, options: List(RemoveOption)) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "rename_sync")
pub fn rename_sync(oldpath: String, newpath: String) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "read_text_file_sync")
pub fn read_text_file_sync(path: String) -> String

@external(javascript, "../amber__deno.ffi.mjs", "read_file_sync")
pub fn read_file_sync(path: String) -> Uint8Array

@external(javascript, "../amber__deno.ffi.mjs", "real_path_sync")
pub fn real_path_sync(path: String) -> String

@external(javascript, "../amber__deno.ffi.mjs", "read_dir_sync")
pub fn read_dir_sync(path: String) -> List(DirEntry)

@external(javascript, "../amber__deno.ffi.mjs", "copy_file_sync")
pub fn copy_file_sync(from_path: String, to_path: String) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "read_link_sync")
pub fn read_link_sync(path: String) -> String

@external(javascript, "../amber__deno.ffi.mjs", "lstat_sync")
pub fn lstat_sync(path: String) -> FileInfo

@external(javascript, "../amber__deno.ffi.mjs", "stat_sync")
pub fn stat_sync(path: String) -> FileInfo

@external(javascript, "../amber__deno.ffi.mjs", "write_file_sync")
pub fn write_file_sync(
  path: String,
  data: Uint8Array,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "write_text_file_sync")
pub fn write_text_file_sync(
  path: String,
  data: String,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "truncate_sync")
pub fn truncate_sync(name: String, len: Option(Int)) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "watch_fs")
pub fn watch_fs(paths: List(String), options: List(WatchFsOption)) -> FsWatcher

@external(javascript, "../amber__deno.ffi.mjs", "symlink_sync")
pub fn symlink_sync(
  oldpath: String,
  newpath: String,
  options: List(SymlinkOption),
) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "utime_sync")
pub fn utime_sync(path: String, atime: Int, mtime: Int) -> Nil

@external(javascript, "../amber__deno.ffi.mjs", "umask")
pub fn umask() -> Int

@external(javascript, "../amber__deno.ffi.mjs", "set_umask")
pub fn set_umask(mask: Int) -> Int
