/// Information about a directory entry returned from
/// [`amber.read_dir_sync`](../amber.html#read_dir_sync).
///
pub type DirEntry {
  DirEntry(
    /// The file name of the entry. It is just the entity name and does not
    /// include the full path.
    ///
    name: String,
    /// True if this is info for a regular file. Mutually exclusive to
    /// `DirEntry.is_directory` and `DirEntry.is_symlink`.
    ///
    is_file: Bool,
    /// True if this is info for a regular directory. Mutually exclusive to
    /// `DirEntry.is_file` and `DirEntry.is_symlink`.
    ///
    is_directory: Bool,
    /// True if this is info for a symlink. Mutually exclusive to
    /// `DirEntry.is_file` and `DirEntry.is_directory`.
    ///
    is_symlink: Bool,
  )
}
