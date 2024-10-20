import gleam/io
import gleano/fs
import gleano/fs/fs_watcher
import gleano/fs/watch_fs
import gleeunit

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  fs.watch_fs(["watch_test"], [watch_fs.Recursive(False)])
  |> fs_watcher.iterate_async(fn(event) {
    io.debug(event)
    Nil
  })
}
