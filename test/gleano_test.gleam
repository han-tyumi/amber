import gleam/io
import gleano/fs
import gleeunit

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  fs.lstat_sync("deno.json")
  |> io.debug
}
