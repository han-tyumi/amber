import amber/error.{type Error}
import amber/fs_event.{type FsEvent}

@external(javascript, "./fs_watcher.type.ts", "FsWatcher$")
pub type FsWatcher

@external(javascript, "./fs_watcher.ffi.mjs", "close")
pub fn close(watcher: FsWatcher) -> Result(Nil, Error)

@external(javascript, "./fs_watcher.ffi.mjs", "iterate_async")
pub fn iterate_async(watcher: FsWatcher, run callback: fn(FsEvent) -> a) -> Nil
