import gleam/option.{type Option}
import gossamer.{type Date}

/// Provides information about a file and is returned by
/// [`amber.stat_sync`](../amber.html#stat_sync) and
/// [`amber.lstat_sync`](../amber.html#lstat_sync) or from calling
/// [`stat_sync`](./fs_file.html#stat_sync) with a
/// [`FsFile`](./fs_file.html#FsFile) instance.
///
pub type FileInfo {
  FileInfo(
    /// True if this is info for a regular file. Mutually exclusive to
    /// `FileInfo.is_directory` and `FileInfo.is_symlink`.
    ///
    is_file: Bool,
    /// True if this is info for a regular directory. Mutually exclusive to
    /// `FileInfo.is_file` and `FileInfo.is_symlink`.
    ///
    is_directory: Bool,
    /// True if this is info for a symlink. Mutually exclusive to
    /// `FileInfo.is_file` and `FileInfo.is_directory`.
    ///
    is_symlink: Bool,
    /// The size of the file, in bytes.
    ///
    size: Int,
    /// The last modification time of the file. This corresponds to the `mtime`
    /// field from `stat` on Linux/Mac OS and `ftLastWriteTime` on Windows. This
    /// may not be available on all platforms.
    ///
    mtime: Option(Date),
    /// The last access time of the file. This corresponds to the `atime`
    /// field from `stat` on Unix and `ftLastAccessTime` on Windows. This may not
    /// be available on all platforms.
    ///
    atime: Option(Date),
    /// The creation time of the file. This corresponds to the `birthtime`
    /// field from `stat` on Mac/BSD and `ftCreationTime` on Windows. This may
    /// not be available on all platforms.
    ///
    birthtime: Option(Date),
    /// ID of the device containing the file.
    ///
    dev: Int,
    /// Inode number.
    ///
    /// _Linux/Mac OS only._
    ///
    ino: Option(Int),
    /// The underlying raw `st_mode` bits that contain the standard Unix
    /// permissions for this file/directory.
    ///
    /// _Linux/Mac OS only._
    ///
    mode: Option(Int),
    /// Number of hard links pointing to this file.
    ///
    /// _Linux/Mac OS only._
    ///
    nlink: Option(Int),
    /// User ID of the owner of this file.
    ///
    /// _Linux/Mac OS only._
    ///
    uid: Option(Int),
    /// Group ID of the owner of this file.
    ///
    /// _Linux/Mac OS only._
    ///
    gid: Option(Int),
    /// Device ID of this file.
    ///
    /// _Linux/Mac OS only._
    ///
    rdev: Option(Int),
    /// Blocksize for filesystem I/O.
    ///
    /// _Linux/Mac OS only._
    ///
    blksize: Option(Int),
    /// Number of blocks allocated to the file, in 512-byte units.
    ///
    /// _Linux/Mac OS only._
    ///
    blocks: Option(Int),
    /// True if this is info for a block device.
    ///
    /// _Linux/Mac OS only._
    ///
    is_block_device: Option(Bool),
    /// True if this is info for a char device.
    ///
    /// _Linux/Mac OS only._
    ///
    is_char_device: Option(Bool),
    /// True if this is info for a fifo.
    ///
    /// _Linux/Mac OS only._
    ///
    is_fifo: Option(Bool),
    /// True if this is info for a socket.
    ///
    /// _Linux/Mac OS only._
    ///
    is_socket: Option(Bool),
  )
}
