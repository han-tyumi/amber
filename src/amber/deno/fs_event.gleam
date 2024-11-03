import gleam/option.{type Option}

/// Represents a unique file system event yielded by a
/// [`FsWatcher`](./fs_watcher.html#FsWatcher).
///
pub type FsEvent {
  FsEvent(
    /// The kind/type of the file system event.
    ///
    kind: FsEventKind,
    /// An array of paths that are associated with the file system event.
    ///
    paths: List(String),
    /// Any additional flags associated with the event.
    ///
    flag: Option(FsEventFlag),
  )
}

pub type FsEventKind {
  Any
  Access
  Create
  Modify
  Rename
  Remove
  Other
}

/// Additional information for FsEvent objects with the "other" kind.
///
/// - `"rescan"`: rescan notices indicate either a lapse in the events or a
///    change in the filesystem such that events received so far can no longer
///    be relied on to represent the state of the filesystem now. An
///    application that simply reacts to file changes may not care about this.
///    An application that keeps an in-memory representation of the filesystem
///    will need to care, and will need to refresh that representation directly
///    from the filesystem.
///
pub type FsEventFlag {
  Rescan
}
