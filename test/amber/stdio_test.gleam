import amber/stderr
import amber/stdin
import amber/stdout
import gleam/option.{Some}
import gleeunit/should
import gossamer/promise
import gossamer/uint8_array

pub fn stdio_stdin_read_test() {
  use result <- promise.then(stdin.read(uint8_array.new()))
  let assert Ok(nread) = result
  nread |> should.equal(Some(0))
}

pub fn stdio_stdin_read_sync_test() {
  stdin.read_sync(uint8_array.new())
  |> should.equal(Ok(Some(0)))
}

pub fn stdio_stdout_write_test() {
  use result <- promise.then(stdout.write(uint8_array.new()))
  let assert Ok(nwritten) = result
  nwritten |> should.equal(0)
}

pub fn stdio_stdout_write_sync_test() {
  stdout.write_sync(uint8_array.new())
  |> should.equal(Ok(0))
}

pub fn stdio_stderr_write_test() {
  use result <- promise.then(stderr.write(uint8_array.new()))
  let assert Ok(nwritten) = result
  nwritten |> should.equal(0)
}

pub fn stdio_stderr_write_sync_test() {
  stderr.write_sync(uint8_array.new())
  |> should.equal(Ok(0))
}
