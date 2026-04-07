import amber
import amber/bytes_read
import amber/error
import amber/fs_file
import amber/open
import amber/remove
import amber/seek_mode
import gleam/int
import gleam/option.{Some}
import gleeunit/should
import gossamer/text_decoder
import gossamer/text_encoder
import gossamer/uint8_array

pub fn open_sync_mode_test() {
  let path = amber.make_temp_dir_sync([]) <> "/test_open_sync.txt"

  use _file <- fs_file.using(
    amber.open_sync(path, [open.Write, open.CreateNew, open.Mode(0o626)]),
  )

  // Non-windows systems only.
  let assert Some(mode) = amber.stat_sync(path).mode
  should.equal(
    int.bitwise_and(mode, 0o777),
    int.bitwise_and(0o626, amber.umask() |> int.bitwise_not),
  )

  Ok(Nil)
}

pub fn open_options_test() {
  let filename = "test/testdata/assets/fixture.json"

  // TODO(@han-tyumi): Only when the options are completely undefined, does `read` default to true.
  // An empty object expects at least one option to be true.
  // Should we instead provide an additional `open_with_sync`?
  should.equal(
    amber.open_sync(filename, []),
    Error(error.Other("'options' requires at least one option to be true")),
  )

  should.equal(
    amber.open_sync(filename, [open.Truncate]),
    Error(error.Other("'truncate' option requires 'write' to be true")),
  )

  should.equal(
    amber.open_sync(filename, [open.Create]),
    Error(error.Other(
      "'create' or 'createNew' options require 'write' or 'append' to be true",
    )),
  )

  should.equal(
    amber.open_sync(filename, [open.CreateNew]),
    Error(error.Other(
      "'create' or 'createNew' options require 'write' or 'append' to be true",
    )),
  )
}

pub fn open_sync_not_found_test() {
  should.equal(
    amber.open_sync("bad_file_name", [open.Read]),
    Error(error.NotFound),
  )
}

pub fn create_sync_file_test() {
  let temp_dir = amber.make_temp_dir_sync([])
  let filename = temp_dir <> "/test.txt"

  let assert Ok(f) = amber.create_sync(filename)

  let file_info = amber.stat_sync(filename)
  should.be_true(file_info.is_file)
  should.equal(file_info.size, 0)

  let data = text_encoder.encode("hello")
  let assert Ok(_) = f |> fs_file.write_sync(data)

  let file_info = amber.stat_sync(filename)
  should.equal(file_info.size, 5)

  fs_file.close(f)
  amber.remove_sync(temp_dir, [remove.Recursive])
}

pub fn open_mode_write_test() {
  let temp_dir = amber.make_temp_dir_sync([])
  let filename = temp_dir <> "hello.txt"
  let data = text_encoder.encode("hello world!\n")
  let assert Ok(file) =
    amber.open_sync(filename, [open.Create, open.Write, open.Truncate])

  // Assert file was created.
  let file_info = amber.stat_sync(filename)
  should.be_true(file_info.is_file)
  should.equal(file_info.size, 0)

  // Write some data.
  let assert Ok(_) = file |> fs_file.write_sync(data)
  let file_info = amber.stat_sync(filename)
  should.equal(file_info.size, 13)

  // Assert we can't read from file.
  let buf = uint8_array.from_length(20)
  should.be_error(file |> fs_file.read_sync(buf))
  fs_file.close(file)

  // Assert that existing file is truncated on open.
  let assert Ok(file) = amber.open_sync(filename, [open.Write, open.Truncate])
  fs_file.close(file)
  let file_size = amber.stat_sync(filename).size
  should.equal(file_size, 0)
  amber.remove_sync(temp_dir, [remove.Recursive])
}

pub fn open_mode_write_read_test() {
  let temp_dir = amber.make_temp_dir_sync([])
  let filename = temp_dir <> "hello.txt"
  let data = text_encoder.encode("hello world!\n")

  use file <- fs_file.using(
    amber.open_sync(filename, [
      open.Write,
      open.Truncate,
      open.Create,
      open.Read,
    ]),
  )

  // Assert file was created.
  let file_info = amber.stat_sync(filename)
  should.be_true(file_info.is_file)
  should.equal(file_info.size, 0)

  // Write some data.
  let assert Ok(_) = file |> fs_file.write_sync(data)
  let file_info = amber.stat_sync(filename)
  should.equal(file_info.size, 13)
  let buf = uint8_array.from_length(20)

  // Seeking from beginning of a file.
  let seek_position = 0
  let cursor_position =
    file |> fs_file.seek_sync(seek_position, seek_mode.Start)
  should.equal(seek_position, cursor_position)
  let result = file |> fs_file.read_sync(buf)
  // TODO(@han-tyumi): Move bytes_read into amber/deno/read?
  should.equal(result, Ok(bytes_read.Bytes(13)))
  amber.remove_sync(temp_dir, [remove.Recursive])
  Ok(Nil)
}

pub fn seek_sync_start_test() {
  let filename = "test/testdata/assets/hello.txt"
  use file <- fs_file.using(amber.open_sync(filename, []))

  // Deliberately move 1 step forward ("H").
  let assert Ok(_) = file |> fs_file.read_sync(uint8_array.from_length(1))

  // Skipping "Hello".
  // Seeking from beginning of a file plus seek_position.
  let seek_position = 6
  let cursor_position =
    file |> fs_file.seek_sync(seek_position, seek_mode.Start)
  should.equal(seek_position, cursor_position)
  let buf = uint8_array.from_length(6)
  let assert Ok(_) = file |> fs_file.read_sync(buf)
  let decoded = text_decoder.decode(uint8_array.buffer(buf))
  should.equal(decoded, "world!")
  Ok(Nil)
}

pub fn seek_sync_current_test() {
  let filename = "test/testdata/assets/hello.txt"
  use file <- fs_file.using(amber.open_sync(filename, []))

  // Deliberately move 1 step forward ("H").
  let assert Ok(_) = file |> fs_file.read_sync(uint8_array.from_length(1))

  // Skipping "ello".
  let seek_position = 5
  // Seek position is relative to current cursor position after read.
  let cursor_position =
    file |> fs_file.seek_sync(seek_position, seek_mode.Current)
  should.equal(seek_position + 1, cursor_position)
  let buf = uint8_array.from_length(6)
  let assert Ok(_) = file |> fs_file.read_sync(buf)
  let decoded = text_decoder.decode(uint8_array.buffer(buf))
  should.equal(decoded, "world!")
  Ok(Nil)
}

pub fn seek_sync_end_test() {
  let filename = "test/testdata/assets/hello.txt"
  use file <- fs_file.using(amber.open_sync(filename, []))

  // Deliberately move 1 step forward ("H").
  let assert Ok(_) = file |> fs_file.read_sync(uint8_array.from_length(1))

  let seek_position = -6
  // Seek from end of file that has 12 chars, 12 - 6 = 6.
  let cursor_position = file |> fs_file.seek_sync(seek_position, seek_mode.End)
  should.equal(6, cursor_position)
  let buf = uint8_array.from_length(6)
  let assert Ok(_) = file |> fs_file.read_sync(buf)
  let decoded = text_decoder.decode(uint8_array.buffer(buf))
  should.equal(decoded, "world!")
  Ok(Nil)
}

pub fn file_truncate_to_length_sync_success_test() {
  let filename = amber.make_temp_dir_sync([]) <> "/test_file_truncate_sync.txt"
  use file <- fs_file.using(
    amber.open_sync(filename, [open.Create, open.Read, open.Write]),
  )

  file |> fs_file.truncate_to_length_sync(20)
  should.equal(amber.read_file_sync(filename) |> uint8_array.byte_length, 20)
  file |> fs_file.truncate_to_length_sync(5)
  should.equal(amber.read_file_sync(filename) |> uint8_array.byte_length, 5)
  file |> fs_file.truncate_to_length_sync(-5)
  should.equal(amber.read_file_sync(filename) |> uint8_array.byte_length, 0)

  amber.remove_sync(filename, [])
  Ok(Nil)
}

pub fn file_stat_sync_success_test() {
  use file <- fs_file.using(amber.open_sync("README.md", []))
  let assert Ok(file_info) = file |> fs_file.stat_sync()
  should.be_true(file_info.is_file)
  should.be_false(file_info.is_symlink)
  should.be_false(file_info.is_directory)
  should.be_true(file_info.size > 0)
  should.be_some(file_info.atime)
  should.be_some(file_info.mtime)
  // The `birthtime` field is not available on linux before kernel version 4.11.
  should.be_some(file_info.birthtime)
  Ok(Nil)
}

// TODO(@han-tyumi): Implement the following tests once streams have been implemented.
// pub fn readable_stream_test() {
//   let filename = "test/testdata/assets/hello.txt"
//   let file = await amber.open_sync(filename)
//   should.be_true(file.readable instanceof readable_stream)
//   let chunks = []
//   for await (let chunk of file.readable) {
//     chunks.push(chunk)
//   }
//   should.equal(chunks.length, 1)
//   should.equal(chunks[0].byte_length, 12)
// }

// pub fn readable_stream_text_encoder_pipe_test() {
//   let filename = "test/testdata/assets/hello.txt"
//   let file = await amber.open_sync(filename)
//   let readable = file.readable.pipe_through(new text_decoder_stream())
//   let chunks = []
//   for await (let chunk of readable) {
//     chunks.push(chunk)
//   }
//   should.equal(chunks.length, 1)
//   should.equal(chunks[0].length, 12)
// }

// pub fn writable_stream_test() {
//   let path = await amber.make_temp_file()
//   let file = await amber.open_sync(path, { write: true })
//   should.be_true(file.writable instanceof writable_stream)
//   let readable = new readable_stream({
//     start(controller) {
//       controller.enqueue(text_encoder.new().encode("hello "))
//       controller.enqueue(text_encoder.new().encode("world!"))
//       controller.close()
//     },
//   })
//   await readable.pipe_to(file.writable)
//   let res = await amber.read_text_file(path)
//   should.equal(res, "hello world!")
// }

pub fn read_text_file_non_utf8_test() {
  let path = amber.make_temp_file_sync([])
  use file <- fs_file.using(amber.open_sync(path, [open.Write]))
  let assert Ok(_) =
    file
    |> fs_file.write_sync(text_encoder.encode("hello "))
  let assert Ok(_) = file |> fs_file.write_sync(uint8_array.from_list([0xC0]))

  let res_sync = amber.read_text_file_sync(path)
  should.equal(res_sync, "hello \u{fffd}")
  Ok(Nil)
}

pub fn fs_file_explicit_resource_management_test() {
  let assert Ok(file) =
    fs_file.using(
      amber.open_sync("test/testdata/assets/hello.txt", [open.Read]),
      fn(file) {
        let assert Ok(stat) = fs_file.stat_sync(file)
        should.be_true(stat.is_file)
        Ok(file)
      },
    )
  should.equal(fs_file.stat_sync(file), Error(error.BadResource))
}

pub fn fs_file_explicit_resource_management_manual_close_test() {
  use file <- fs_file.using(
    amber.open_sync("test/testdata/assets/hello.txt", [open.Read]),
  )
  fs_file.close(file)
  should.equal(fs_file.stat_sync(file), Error(error.BadResource))
  Ok(Nil)
}

pub fn fs_file_datasync_sync_success_test() {
  let filename = amber.make_temp_dir_sync([]) <> "/test_fdatasync_sync.txt"
  let assert Ok(file) =
    amber.open_sync(filename, [open.Read, open.Write, open.Create])
  let data = uint8_array.from_length(64)
  let assert Ok(_) = file |> fs_file.write_sync(data)
  file |> fs_file.sync_data_sync()
  should.equal(amber.read_file_sync(filename), data)
  file |> fs_file.close
  amber.remove_sync(filename, [])
}

pub fn fs_file_sync_sync_success_test() {
  let filename = amber.make_temp_dir_sync([]) <> "/test_fsync_sync.txt"
  let assert Ok(file) =
    amber.open_sync(filename, [open.Read, open.Write, open.Create])
  let size = 64
  file |> fs_file.truncate_to_length_sync(size)
  file |> fs_file.sync_sync()
  let assert Ok(stat) = file |> fs_file.stat_sync
  should.equal(stat.size, size)
  file |> fs_file.close
  amber.remove_sync(filename, [])
}

pub fn fs_file_is_terminal_test() {
  use file <- fs_file.using(
    amber.open_sync("test/testdata/assets/hello.txt", [open.Read]),
  )
  should.be_false(file |> fs_file.is_terminal)
  Ok(Nil)
}
// TODO(@han-tyumi): See about adding `fsFileLockFileAsync` test.
