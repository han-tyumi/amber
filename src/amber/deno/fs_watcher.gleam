import amber/deno/fs_event.{type FsEvent}

@external(javascript, "./fs_watcher.ffi.ts", "FsWatcher$")
pub type FsWatcher

@external(javascript, "./fs_watcher.ffi.mjs", "close")
pub fn close(watcher: FsWatcher) -> Nil

@external(javascript, "./fs_watcher.ffi.mjs", "iterate_async")
pub fn iterate_async(watcher: FsWatcher, callback: fn(FsEvent) -> Nil) -> Nil
