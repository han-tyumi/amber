import gleam/option.{type Option}

import gleano/fs/file_info.{type FileInfo}
import gleano/fs/seek_mode.{type SeekMode}
import gleano/fs/set_raw.{type SetRawOption}
import gleano/web.{type ReadableStream, type Uint8Array, type WritableStream}

pub type FsFile

@external(javascript, "../../fs_file_ffi.mjs", "readable")
pub fn readable(file: FsFile) -> ReadableStream(Uint8Array)

@external(javascript, "../../fs_file_ffi.mjs", "writable")
pub fn writable(file: FsFile) -> WritableStream(Uint8Array)

@external(javascript, "../../fs_file_ffi.mjs", "write_sync")
pub fn write_sync(file: FsFile, p: Uint8Array) -> Int

@external(javascript, "../../fs_file_ffi.mjs", "truncate_sync")
pub fn truncate_sync(file: FsFile, len: Option(Int)) -> Nil

@external(javascript, "../../fs_file_ffi.mjs", "read_sync")
pub fn read_sync(file: FsFile, p: Uint8Array) -> Result(Int, Nil)

@external(javascript, "../../fs_file_ffi.mjs", "seek_sync")
pub fn seek_sync(file: FsFile, offset: Int, whence: SeekMode) -> Int

@external(javascript, "../../fs_file_ffi.mjs", "stat_sync")
pub fn stat_sync(file: FsFile) -> FileInfo

@external(javascript, "../../fs_file_ffi.mjs", "sync_sync")
pub fn sync_sync(file: FsFile) -> Nil

@external(javascript, "../../fs_file_ffi.mjs", "sync_data_sync")
pub fn sync_data_sync(file: FsFile) -> Nil

@external(javascript, "../../fs_file_ffi.mjs", "utime_sync")
pub fn utime_sync(file: FsFile, atime: Int, mtime: Int) -> Nil

@external(javascript, "../../fs_file_ffi.mjs", "is_terminal")
pub fn is_terminal(file: FsFile) -> Bool

@external(javascript, "../../fs_file_ffi.mjs", "set_raw")
pub fn set_raw(file: FsFile, mode: Bool, options: List(SetRawOption)) -> Nil

@external(javascript, "../../fs_file_ffi.mjs", "lock_sync")
pub fn lock_sync(file: FsFile, exclusive: Bool) -> Nil

@external(javascript, "../../fs_file_ffi.mjs", "unlock_sync")
pub fn unlock_sync(file: FsFile) -> Nil

@external(javascript, "../../fs_file_ffi.mjs", "close")
pub fn close(file: FsFile) -> Nil
