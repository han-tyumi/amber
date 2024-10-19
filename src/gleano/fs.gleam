import gleam/option.{type Option}

import gleano/fs/dir_entry.{type DirEntry}
import gleano/fs/file.{type File}
import gleano/fs/file_info.{type FileInfo}
import gleano/fs/make_temp.{type MakeTempOption}
import gleano/fs/mkdir.{type MkdirOption}
import gleano/fs/open.{type OpenOption}
import gleano/fs/remove.{type RemoveOption}
import gleano/fs/symlink.{type SymlinkOption}
import gleano/fs/write_file.{type WriteFileOption}
import gleano/web.{type Uint8Array}

@external(javascript, "../fs_ffi.mjs", "link_sync")
pub fn link_sync(oldpath: String, newpath: String) -> Nil

@external(javascript, "../fs_ffi.mjs", "open_sync")
pub fn open_sync(path: String, options: List(OpenOption)) -> File

@external(javascript, "../fs_ffi.mjs", "create_sync")
pub fn create_sync(path: String) -> File

@external(javascript, "../fs_ffi.mjs", "mkdir_sync")
pub fn mkdir_sync(path: String, options: List(MkdirOption)) -> Nil

@external(javascript, "../fs_ffi.mjs", "make_temp_dir_sync")
pub fn make_temp_dir_sync(options: List(MakeTempOption)) -> String

@external(javascript, "../fs_ffi.mjs", "make_temp_file_sync")
pub fn make_temp_file_sync(options: List(MakeTempOption)) -> String

@external(javascript, "../fs_ffi.mjs", "chmod_sync")
pub fn chmod_sync(path: String, mode: Int) -> Nil

@external(javascript, "../fs_ffi.mjs", "chown_sync")
pub fn chown_sync(path: String, uid: Option(Int), gid: Option(Int)) -> Nil

@external(javascript, "../fs_ffi.mjs", "remove_sync")
pub fn remove_sync(path: String, options: List(RemoveOption)) -> Nil

@external(javascript, "../fs_ffi.mjs", "rename_sync")
pub fn rename_sync(oldpath: String, newpath: String) -> Nil

@external(javascript, "../fs_ffi.mjs", "read_text_file_sync")
pub fn read_text_file_sync(path: String) -> String

@external(javascript, "../fs_ffi.mjs", "read_file_sync")
pub fn read_file_sync(path: String) -> Uint8Array

@external(javascript, "../fs_ffi.mjs", "real_path_sync")
pub fn real_path_sync(path: String) -> String

@external(javascript, "../fs_ffi.mjs", "read_dir_sync")
pub fn read_dir_sync(path: String) -> List(DirEntry)

@external(javascript, "../fs_ffi.mjs", "copy_file_sync")
pub fn copy_file_sync(from_path: String, to_path: String) -> Nil

@external(javascript, "../fs_ffi.mjs", "read_link_sync")
pub fn read_link_sync(path: String) -> String

@external(javascript, "../fs_ffi.mjs", "lstat_sync")
pub fn lstat_sync(path: String) -> FileInfo

@external(javascript, "../fs_ffi.mjs", "stat_sync")
pub fn stat_sync(path: String) -> FileInfo

@external(javascript, "../fs_ffi.mjs", "write_file_sync")
pub fn write_file_sync(
  path: String,
  data: Uint8Array,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "../fs_ffi.mjs", "write_text_file_sync")
pub fn write_text_file_sync(
  path: String,
  data: String,
  options: List(WriteFileOption),
) -> Nil

@external(javascript, "../fs_ffi.mjs", "truncate_sync")
pub fn truncate_sync(name: String, len: Option(Int)) -> Nil

@external(javascript, "../fs_ffi.mjs", "watch_fs")
pub fn watch_fs(paths: List(String), options: List(Nil)) -> Nil {
  todo as "Implement Deno.watchFs binding."
}

@external(javascript, "../fs_ffi.mjs", "symlink_sync")
pub fn symlink_sync(
  oldpath: String,
  newpath: String,
  options: List(SymlinkOption),
) -> Nil

@external(javascript, "../fs_ffi.mjs", "utime_sync")
pub fn utime_sync(path: String, atime: Int, mtime: Int) -> Nil

@external(javascript, "../fs_ffi.mjs", "umask")
pub fn umask(mask: Option(Int)) -> Int
