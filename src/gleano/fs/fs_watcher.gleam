import gleam/option.{type Option}

pub type FsWatcher

pub type FsEvent {
  FsEvent(kind: FsEventKind, paths: List(String), flag: Option(FsEventFlag))
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

pub type FsEventFlag {
  Rescan
}

@external(javascript, "../../fs_watcher_ffi.mjs", "close")
pub fn close(watcher: FsWatcher) -> Nil

@external(javascript, "../../fs_watcher_ffi.mjs", "iterate_async")
pub fn iterate_async(watcher: FsWatcher, callback: fn(FsEvent) -> Nil) -> Nil
