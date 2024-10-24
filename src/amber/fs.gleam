import gleam/option.{type Option}

import amber/error.{type Error}
import amber/fs/dir_entry.{type DirEntry}
import amber/fs/file_info.{type FileInfo}
import amber/fs/fs_file.{type FsFile}
import amber/fs/fs_watcher.{type FsWatcher}
import amber/fs/make_temp.{type MakeTempOption}
import amber/fs/mkdir.{type MkdirOption}
import amber/fs/open.{type OpenOption}
import amber/fs/remove.{type RemoveOption}
import amber/fs/symlink.{type SymlinkOption}
import amber/fs/watch_fs.{type WatchFsOption}
import amber/fs/write_file.{type WriteFileOption}
import amber/web/uint8_array.{type Uint8Array}

@external(javascript, "../amber__fs_ffi.mjs", "linkSync")
pub fn link_sync(oldpath: String, newpath: String) -> Result(Nil, Error)

@external(javascript, "../amber__fs_ffi.mjs", "openSync")
pub fn open_sync(path: String, options: List(OpenOption)) -> FsFile

@external(javascript, "../amber__fs_ffi.mjs", "createSync")
pub fn create_sync(path: String) -> FsFile

@external(javascript, "../amber__fs_ffi.mjs", "mkdirSync")
pub fn mkdir_sync(path: String, options: List(MkdirOption)) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "makeTempDirSync")
pub fn make_temp_dir_sync(options: List(MakeTempOption)) -> String

@external(javascript, "../amber__fs_ffi.mjs", "makeTempFileSync")
pub fn make_temp_file_sync(options: List(MakeTempOption)) -> String

@external(javascript, "../amber__fs_ffi.mjs", "chmodSync")
pub fn chmod_sync(path: String, mode: Int) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "chownSync")
pub fn chown_sync(path: String, uid: Option(Int), gid: Option(Int)) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "removeSync")
pub fn remove_sync(path: String, options: List(RemoveOption)) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "renameSync")
pub fn rename_sync(oldpath: String, newpath: String) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "readTextFileSync")
pub fn read_text_file_sync(path: String) -> String

@external(javascript, "../amber__fs_ffi.mjs", "readFileSync")
pub fn read_file_sync(path: String) -> Uint8Array

@external(javascript, "../amber__fs_ffi.mjs", "realPathSync")
pub fn real_path_sync(path: String) -> String

@external(javascript, "../amber__fs_ffi.mjs", "readDirSync")
pub fn read_dir_sync(path: String) -> List(DirEntry)

@external(javascript, "../amber__fs_ffi.mjs", "copyFileSync")
pub fn copy_file_sync(from_path: String, to_path: String) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "readLinkSync")
pub fn read_link_sync(path: String) -> String

@external(javascript, "../amber__fs_ffi.mjs", "lstatSync")
pub fn lstat_sync(path: String) -> FileInfo

@external(javascript, "../amber__fs_ffi.mjs", "statSync")
pub fn stat_sync(path: String) -> FileInfo

@external(javascript, "../amber__fs_ffi.mjs", "writeFileSync")
pub fn write_file_sync(
  path: String,
  data: Uint8Array,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "writeTextFileSync")
pub fn write_text_file_sync(
  path: String,
  data: String,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "truncateSync")
pub fn truncate_sync(name: String, len: Option(Int)) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "watchFs")
pub fn watch_fs(paths: List(String), options: List(WatchFsOption)) -> FsWatcher

@external(javascript, "../amber__fs_ffi.mjs", "symlinkSync")
pub fn symlink_sync(
  oldpath: String,
  newpath: String,
  options: List(SymlinkOption),
) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "utimeSync")
pub fn utime_sync(path: String, atime: Int, mtime: Int) -> Nil

@external(javascript, "../amber__fs_ffi.mjs", "umask")
pub fn umask(mask: Option(Int)) -> Int
