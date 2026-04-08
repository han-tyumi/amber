import amber/bytes_read.{type BytesRead}
import amber/error.{type Error}
import amber/file_info.{type FileInfo}
import amber/seek_mode.{type SeekMode}
import amber/set_raw.{type SetRawOption}
import gossamer/readable_stream.{type ReadableStream}
import gossamer/uint8_array.{type Uint8Array}
import gossamer/writable_stream.{type WritableStream}

@external(javascript, "./fs_file.type.ts", "FsFile$")
pub type FsFile

@external(javascript, "./fs_file.ffi.mjs", "readable")
pub fn readable(file: FsFile) -> ReadableStream(Uint8Array)

@external(javascript, "./fs_file.ffi.mjs", "writable")
pub fn writable(file: FsFile) -> WritableStream(Uint8Array)

@external(javascript, "./fs_file.ffi.mjs", "write_sync")
pub fn write_sync(file: FsFile, p: Uint8Array) -> Result(Int, Error)

/// Truncates the file to length zero. Mutates the file in-place and
/// returns it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "truncate_sync")
pub fn truncate_sync(file: FsFile) -> Result(FsFile, Error)

/// Truncates the file to the given length. Mutates the file in-place and
/// returns it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "truncate_to_length_sync")
pub fn truncate_to_length_sync(file: FsFile, len: Int) -> Result(FsFile, Error)

@external(javascript, "./fs_file.ffi.mjs", "read_sync")
pub fn read_sync(file: FsFile, p: Uint8Array) -> Result(BytesRead, Error)

@external(javascript, "./fs_file.ffi.mjs", "seek_sync")
pub fn seek_sync(
  file: FsFile,
  offset: Int,
  whence: SeekMode,
) -> Result(Int, Error)

@external(javascript, "./fs_file.ffi.mjs", "stat_sync")
pub fn stat_sync(file: FsFile) -> Result(FileInfo, Error)

/// Flushes pending data and metadata operations to disk. Mutates the file
/// in-place and returns it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "sync_sync")
pub fn sync_sync(file: FsFile) -> Result(FsFile, Error)

/// Flushes pending data operations to disk (not metadata). Mutates the
/// file in-place and returns it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "sync_data_sync")
pub fn sync_data_sync(file: FsFile) -> Result(FsFile, Error)

/// Changes the access and modification times of the file. Mutates the
/// file in-place and returns it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "utime_sync")
pub fn utime_sync(file: FsFile, atime: Int, mtime: Int) -> Result(FsFile, Error)

@external(javascript, "./fs_file.ffi.mjs", "is_terminal")
pub fn is_terminal(file: FsFile) -> Bool

/// Set the file to raw mode. Mutates the file in-place and returns it
/// for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "set_raw")
pub fn set_raw(file: FsFile, mode: Bool) -> Result(FsFile, Error)

/// Set the file to raw mode with options. Mutates the file in-place and
/// returns it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "set_raw_with")
pub fn set_raw_with(
  file: FsFile,
  mode: Bool,
  options: List(SetRawOption),
) -> Result(FsFile, Error)

/// Acquires an advisory file lock. Mutates the file in-place and returns
/// it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "lock_sync")
pub fn lock_sync(file: FsFile, exclusive: Bool) -> Result(FsFile, Error)

/// Releases an advisory file lock. Mutates the file in-place and returns
/// it for chaining.
///
@external(javascript, "./fs_file.ffi.mjs", "unlock_sync")
pub fn unlock_sync(file: FsFile) -> Result(FsFile, Error)

@external(javascript, "./fs_file.ffi.mjs", "close")
pub fn close(file: FsFile) -> Result(Nil, Error)

@external(javascript, "./fs_file.ffi.mjs", "using_")
pub fn using(
  file_result: Result(FsFile, Error),
  fun: fn(FsFile) -> Result(a, Error),
) -> Result(a, Error)
