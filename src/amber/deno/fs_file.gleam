import amber/deno/bytes_read.{type BytesRead}
import amber/deno/error.{type Error}
import amber/deno/file_info.{type FileInfo}
import amber/deno/seek_mode.{type SeekMode}
import amber/deno/set_raw.{type SetRawOption}
import amber/web.{type ReadableStream, type WritableStream}
import amber/web/uint8_array.{type Uint8Array}

pub type FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "readable")
pub fn readable(file: FsFile) -> ReadableStream(Uint8Array)

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "writable")
pub fn writable(file: FsFile) -> WritableStream(Uint8Array)

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "write_sync")
pub fn write_sync(file: FsFile, p: Uint8Array) -> Result(Int, Error)

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "truncate_sync")
pub fn truncate_sync(file: FsFile) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "truncate_to_length_sync")
pub fn truncate_to_length_sync(file: FsFile, len: Int) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "read_sync")
pub fn read_sync(file: FsFile, p: Uint8Array) -> Result(BytesRead, Error)

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "seek_sync")
pub fn seek_sync(file: FsFile, offset: Int, whence: SeekMode) -> Int

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "stat_sync")
pub fn stat_sync(file: FsFile) -> Result(FileInfo, Error)

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "sync_sync")
pub fn sync_sync(file: FsFile) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "sync_data_sync")
pub fn sync_data_sync(file: FsFile) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "utime_sync")
pub fn utime_sync(file: FsFile, atime: Int, mtime: Int) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "is_terminal")
pub fn is_terminal(file: FsFile) -> Bool

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "set_raw")
pub fn set_raw(file: FsFile, mode: Bool, options: List(SetRawOption)) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "lock_sync")
pub fn lock_sync(file: FsFile, exclusive: Bool) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "unlock_sync")
pub fn unlock_sync(file: FsFile) -> FsFile

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "close")
pub fn close(file: FsFile) -> Nil

@external(javascript, "../../amber__deno__fs_file.ffi.mjs", "using_")
pub fn using(
  file_result: Result(FsFile, Error),
  fun: fn(FsFile) -> Result(a, Error),
) -> Result(a, Error)
