import amber/deno/stderr
import amber/deno/stdin
import amber/deno/stdout
import amber/web/promise
import amber/web/uint8_array
import gleam/option.{Some}
import gleeunit/should

pub fn stdio_stdin_read_test() {
  use nread <- promise.then(stdin.read(uint8_array.new()))
  nread |> should.equal(Some(0))
}

pub fn stdio_stdin_read_sync_test() {
  stdin.read_sync(uint8_array.new())
  |> should.equal(Some(0))
}

pub fn stdio_stdout_write_test() {
  use nwritten <- promise.then(stdout.write(uint8_array.new()))
  nwritten |> should.equal(0)
}

pub fn stdio_stdout_write_sync_test() {
  stdout.write_sync(uint8_array.new())
  |> should.equal(0)
}

pub fn stdio_stderr_write_test() {
  use nwritten <- promise.then(stderr.write(uint8_array.new()))
  nwritten |> should.equal(0)
}

pub fn stdio_stderr_write_sync_test() {
  stderr.write_sync(uint8_array.new())
  |> should.equal(0)
}
