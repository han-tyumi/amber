import amber/fs
import amber/fs/fs_watcher
import amber/fs/watch_fs
import gleam/io
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
