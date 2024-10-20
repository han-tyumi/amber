import gleam/option.{type Option}

import amber/web.{type Date}

pub type FileInfo {
  FileInfo(
    is_file: Bool,
    is_directory: Bool,
    is_symlink: Bool,
    size: Int,
    mtime: Option(Date),
    atime: Option(Date),
    birthtime: Option(Date),
    dev: Int,
    ino: Option(Int),
    mode: Option(Int),
    nlink: Option(Int),
    uid: Option(Int),
    gid: Option(Int),
    rdev: Option(Int),
    blksize: Option(Int),
    blocks: Option(Int),
    is_block_device: Option(Bool),
    is_char_device: Option(Bool),
    is_fifo: Option(Bool),
    is_socket: Option(Bool),
  )
}
