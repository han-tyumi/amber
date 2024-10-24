import amber/fs/fs_event.{type FsEvent}

pub type FsWatcher

@external(javascript, "../../amber__fs__fs_watcher_ffi.mjs", "close")
pub fn close(watcher: FsWatcher) -> Nil

@external(javascript, "../../amber__fs__fs_watcher_ffi.mjs", "iterateAsync")
pub fn iterate_async(watcher: FsWatcher, callback: fn(FsEvent) -> Nil) -> Nil
