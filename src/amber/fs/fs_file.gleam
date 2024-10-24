import gleam/option.{type Option}

import amber/fs/file_info.{type FileInfo}
import amber/fs/seek_mode.{type SeekMode}
import amber/fs/set_raw.{type SetRawOption}
import amber/web.{type ReadableStream, type WritableStream}
import amber/web/uint8_array.{type Uint8Array}

pub type FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "readable")
pub fn readable(file: FsFile) -> ReadableStream(Uint8Array)

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "writable")
pub fn writable(file: FsFile) -> WritableStream(Uint8Array)

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "writeSync")
pub fn write_sync(file: FsFile, p: Uint8Array) -> Int

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "truncateSync")
pub fn truncate_sync(file: FsFile, len: Option(Int)) -> FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "readSync")
pub fn read_sync(file: FsFile, p: Uint8Array) -> Result(Int, Nil)

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "seekSync")
pub fn seek_sync(file: FsFile, offset: Int, whence: SeekMode) -> Int

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "statSync")
pub fn stat_sync(file: FsFile) -> FileInfo

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "syncSync")
pub fn sync_sync(file: FsFile) -> FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "syncDataSync")
pub fn sync_data_sync(file: FsFile) -> FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "utimeSync")
pub fn utime_sync(file: FsFile, atime: Int, mtime: Int) -> FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "isTerminal")
pub fn is_terminal(file: FsFile) -> Bool

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "setRaw")
pub fn set_raw(file: FsFile, mode: Bool, options: List(SetRawOption)) -> FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "lockSync")
pub fn lock_sync(file: FsFile, exclusive: Bool) -> FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "unlockSync")
pub fn unlock_sync(file: FsFile) -> FsFile

@external(javascript, "../../amber__fs__fs_file_ffi.mjs", "close")
pub fn close(file: FsFile) -> Nil
