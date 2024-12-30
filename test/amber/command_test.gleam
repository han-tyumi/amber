import amber/deno
import amber/deno/build/os
import amber/deno/child_process
import amber/deno/command
import amber/deno/command/command_option
import amber/deno/command/command_output.{CommandOutput}
import amber/deno/error
import amber/deno/fs_file
import amber/deno/make_temp
import amber/deno/open
import amber/deno/remove
import amber/deno/signal
import amber/deno/stdio_option
import amber/web
import amber/web/abort_controller
import amber/web/async_iterator
import amber/web/json
import amber/web/promise
import amber/web/readable_stream
import amber/web/readable_stream/read_result
import amber/web/readable_stream/reader
import amber/web/readable_stream/stream_pipe_option
import amber/web/text_decoder
import amber/web/text_decoder_stream
import amber/web/text_encoder
import amber/web/uint8_array
import amber/web/writable_stream
import amber/web/writable_stream/writer
import gleam/bool
import gleam/dict
import gleam/int
import gleam/option.{None, Some}
import gleam/string
import gleeunit/should

pub fn command_with_cwd_is_async_test() {
  let cwd = deno.make_temp_dir_sync([make_temp.Prefix("deno_command_test")])

  let exit_code_file_lock = "deno_was_here.lock"
  let exit_code_file = "deno_was_here"
  let program_file = "poll_exit.ts"
  let program = "
const file = await Deno.open(\"" <> exit_code_file_lock <> "\", { write: true, create: true });
async function tryExit() {
  await file.lock(true);
  try {
    const code = parseInt(await Deno.readTextFile(\"" <> exit_code_file <> "\"));
    Deno.exit(code);
  } catch {
    // Retry if we got here before deno wrote the file.
    setTimeout(tryExit, 0.01);
  } finally {
    await file.unlock();
  }
}

tryExit();
"

  deno.write_file_sync(
    cwd <> "/" <> program_file,
    text_encoder.encode(program),
    [],
  )

  let command =
    command.new(deno.exec_path(), [
      command_option.Cwd(cwd),
      command_option.Args(["run", "-RW", program_file]),
      command_option.Stdout(stdio_option.Inherit),
      command_option.Stderr(stdio_option.Inherit),
    ])

  let child = command.spawn(command)
  let code = 84

  use file <- promise.then(
    deno.open_sync(cwd <> "/" <> exit_code_file_lock, [open.Write, open.Create])
    |> promise.from_result(),
  )

  file |> fs_file.lock_sync(True)

  deno.write_file_sync(
    cwd <> "/" <> exit_code_file,
    text_encoder.encode(int.to_string(code)),
    [],
  )

  file |> fs_file.unlock_sync()

  use status <- promise.then(child |> child_process.status())

  deno.remove_sync(cwd, [remove.Recursive])

  should.equal(status.code, code)
  should.equal(status.success, False)
  should.equal(status.signal, None)
}

pub fn command_stdin_piped_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval",
        "
const buffer = new Uint8Array(5);
await Deno.stdin.read(buffer);
if (new TextDecoder().decode(buffer) !== \"hello\") {
  throw new Error('Expected \\'hello\\'')
}
",
      ]),
      command_option.Stdin(stdio_option.Piped),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])

  let child = command |> command.spawn()

  child
  |> child_process.stdout()
  |> should.equal(
    Error(error.Other("Cannot get 'stdout': 'stdout' is not piped")),
  )

  child
  |> child_process.stderr()
  |> should.equal(
    Error(error.Other("Cannot get 'stderr': 'stderr' is not piped")),
  )

  let msg = text_encoder.encode("hello")
  let assert Ok(stdin) = child |> child_process.stdin()
  let writer = stdin |> writable_stream.get_writer()
  use _ <- promise.then(writer |> writer.write(msg))
  writer |> writer.release_lock()

  use _ <- promise.then(stdin |> writable_stream.close())
  use status <- promise.then(child |> child_process.status())
  should.equal(status.success, True)
  should.equal(status.code, 0)
  should.equal(status.signal, None)
}

pub fn command_stdin_piped_error_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args(["info"]),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])

  let child = command |> command.spawn()

  should.equal(
    child |> child_process.stdin(),
    Error(error.Other("Cannot get 'stdin': 'stdin' is not piped")),
  )

  should.equal(
    child |> child_process.stdout(),
    Error(error.Other("Cannot get 'stdout': 'stdout' is not piped")),
  )

  should.equal(
    child |> child_process.stderr(),
    Error(error.Other("Cannot get 'stderr': 'stderr' is not piped")),
  )

  child |> child_process.status()
}

pub fn command_stdout_piped_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval", "await Deno.stdout.write(new TextEncoder().encode('hello'))",
      ]),
      command_option.Stderr(stdio_option.Null),
      command_option.Stdout(stdio_option.Piped),
    ])

  let child = command |> command.spawn()

  should.equal(
    child |> child_process.stdin(),
    Error(error.Other("Cannot get 'stdin': 'stdin' is not piped")),
  )

  should.equal(
    child |> child_process.stderr(),
    Error(error.Other("Cannot get 'stderr': 'stderr' is not piped")),
  )

  let assert Ok(stdout) = child |> child_process.stdout()
  let readable =
    stdout
    |> readable_stream.pipe_through(
      text_decoder_stream.new()
        |> text_decoder_stream.read_write_pair(),
      [],
    )
  let reader = readable |> readable_stream.get_reader()
  use res <- promise.then(reader |> reader.read())
  should.equal(res, read_result.Value("hello"))

  use res_end <- promise.then(reader |> reader.read())
  should.equal(res_end, read_result.Done(None))
  reader |> reader.release_lock()

  use status <- promise.then(child |> child_process.status())
  should.equal(status.success, True)
  should.equal(status.code, 0)
  should.equal(status.signal, None)
}

pub fn command_stderr_piped_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval", "await Deno.stderr.write(new TextEncoder().encode('hello'))",
      ]),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Piped),
    ])

  let child = command |> command.spawn()

  should.equal(
    child |> child_process.stdin(),
    Error(error.Other("Cannot get 'stdin': 'stdin' is not piped")),
  )

  should.equal(
    child |> child_process.stdout(),
    Error(error.Other("Cannot get 'stdout': 'stdout' is not piped")),
  )

  let assert Ok(stderr) = child |> child_process.stderr()
  let readable =
    stderr
    |> readable_stream.pipe_through(
      text_decoder_stream.new()
        |> text_decoder_stream.read_write_pair(),
      [],
    )
  let reader = readable |> readable_stream.get_reader()
  use res <- promise.then(reader |> reader.read())
  should.equal(res, read_result.Value("hello"))

  use res_end <- promise.then(reader |> reader.read())
  should.equal(res_end, read_result.Done(None))
  reader |> reader.release_lock()

  use status <- promise.then(child |> child_process.status())
  should.equal(status.success, True)
  should.equal(status.code, 0)
  should.equal(status.signal, None)
}

pub fn command_redirect_stdout_stderr_test() {
  let temp_dir = deno.make_temp_dir_sync([])
  let file_name = temp_dir <> "/redirected_stdio.txt"
  let assert Ok(file) = deno.open_sync(file_name, [open.Create, open.Write])

  let command =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval",
        "Deno.stderr.write(new TextEncoder().encode('error\\n')); Deno.stdout.write(new TextEncoder().encode('output\\n'));",
      ]),
      command_option.Stdout(stdio_option.Piped),
      command_option.Stderr(stdio_option.Piped),
    ])

  let child = command |> command.spawn()

  let assert Ok(stdout) = child |> child_process.stdout()
  use _ <- promise.then(
    stdout
    |> readable_stream.pipe_to(file |> fs_file.writable(), [
      stream_pipe_option.PreventClose,
    ]),
  )
  let assert Ok(stderr) = child |> child_process.stderr()
  use _ <- promise.then(
    stderr |> readable_stream.pipe_to(file |> fs_file.writable(), []),
  )
  use _ <- promise.then(child |> child_process.status())

  let file_contents = deno.read_file_sync(file_name)
  let text = text_decoder.decode(file_contents |> uint8_array.buffer())

  should.be_true(text |> string.contains("error"))
  should.be_true(text |> string.contains("output"))
}

pub fn command_redirect_stdin_test() {
  let temp_dir = deno.make_temp_dir_sync([])
  let file_name = temp_dir <> "/redirected_stdio.txt"
  deno.write_text_file_sync(file_name, "hello", [])
  let assert Ok(file) = deno.open_sync(file_name, [open.Read])

  let command =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval",
        "
        const buffer = new Uint8Array(5);
        await Deno.stdin.read(buffer);
        if (new TextDecoder().decode(buffer) !== \"hello\") {
          throw new Error('Expected \\'hello\\'')
        }
        ",
      ]),
      command_option.Stdin(stdio_option.Piped),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])

  let child = command |> command.spawn()

  let assert Ok(stdin) = child |> child_process.stdin()
  use _ <- promise.then(
    file
    |> fs_file.readable()
    |> readable_stream.pipe_to(stdin, [stream_pipe_option.PreventClose]),
  )

  use _ <- promise.then(stdin |> writable_stream.close())
  use status <- promise.then(child |> child_process.status())
  should.equal(status.code, 0)
}

pub fn command_kill_success_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "setTimeout(() => {}, 10000)"]),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])

  let child = command |> command.spawn()

  let _ = child |> child_process.kill_with(signal.SIGKILL)
  use status <- promise.then(child |> child_process.status())

  should.equal(status.success, False)
  case deno.build().os {
    os.Windows -> {
      should.equal(status.code, 1)
      should.equal(status.signal, None)
    }
    _ -> {
      should.equal(status.code, 137)
      should.equal(status.signal, Some(signal.SIGKILL))
    }
  }
}

pub fn child_process_explicit_resource_management_test() {
  let dead_promise = {
    let command =
      command.new(deno.exec_path(), [
        command_option.Args(["eval", "setTimeout(() => {}, 10000)"]),
        command_option.Stdout(stdio_option.Null),
        command_option.Stderr(stdio_option.Null),
      ])
    use child <- child_process.using(command |> command.spawn())
    use status <- promise.then(child |> child_process.status())
    status.signal
  }

  use dead <- promise.then(dead_promise)

  case deno.build().os {
    os.Windows -> {
      should.equal(dead, None)
    }
    _ -> {
      should.equal(dead, Some(signal.SIGTERM))
    }
  }
}

pub fn child_process_explicit_resource_management_manual_close_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "setTimeout(() => {}, 10000)"]),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])
  use child <- child_process.using(command |> command.spawn())
  let _ = child |> child_process.kill_with(signal.SIGTERM)
  child |> child_process.status()
}

pub fn command_kill_optional_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "setTimeout(() => {}, 10000)"]),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])
  let child = command |> command.spawn()

  let _ = child |> child_process.kill()
  use status <- promise.then(child |> child_process.status())

  should.equal(status.success, False)
  case deno.build().os {
    os.Windows -> {
      should.equal(status.code, 1)
      should.equal(status.signal, None)
    }
    _ -> {
      should.equal(status.code, 143)
      should.equal(status.signal, Some(signal.SIGTERM))
    }
  }
}

pub fn command_abort_test() {
  let ac = abort_controller.new()
  let command =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "setTimeout(console.log, 1e8)"]),
      command_option.Signal(ac |> abort_controller.signal()),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])
  let child = command |> command.spawn()
  web.queue_microtask(fn() {
    ac |> abort_controller.abort(Nil)
    Nil
  })
  use status <- promise.then(child |> child_process.status())
  should.equal(status.success, False)
  case deno.build().os {
    os.Windows -> {
      should.equal(status.code, 1)
      should.equal(status.signal, None)
    }
    _ -> {
      should.equal(status.success, False)
      should.equal(status.code, 143)
    }
  }
}

pub fn command_sync_success_test() {
  let assert Ok(output) =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "console.log('hello world')"]),
    ])
    |> command.output_sync()

  // TODO(@han-tyumi): Copy-paste `CommandStatus` into `CommandOutput`?
  should.equal(output.success, True)
  should.equal(output.code, 0)
  should.equal(output.signal, None)
}

pub fn command_sync_not_found_test() {
  command.new("this file hopefully doesn't exist", [])
  |> command.output_sync()
  |> should.equal(Error(error.NotFound))
}

// TODO(@han-tyumi): Errors (e.g., NotFound) are missing additional info.
pub fn cwd_not_found_test() {
  command.new(deno.exec_path(), [
    command_option.Cwd(deno.cwd() <> "/non-existent-directory"),
  ])
  |> command.output_sync()
  |> should.equal(Error(error.NotFound))
}

// TODO(@han-tyumi): Non-sync version's error is NotFound.
pub fn cwd_not_directory_test() {
  command.new(deno.exec_path(), [command_option.Cwd(deno.exec_path())])
  |> command.output_sync()
  |> fn(result) {
    case result {
      Error(error.Other(message)) ->
        message |> string.contains("Not a directory")
      _ -> False
    }
  }
  |> should.be_true()
}

pub fn command_sync_failed_with_code_test() {
  let assert Ok(output) =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "Deno.exit(41 + 1)"]),
    ])
    |> command.output_sync()
  should.equal(output.success, False)
  should.equal(output.code, 42)
  should.equal(output.signal, None)
}

pub fn command_sync_failed_with_signal_test() {
  let assert Ok(output) =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "Deno.kill(Deno.pid, 'SIGKILL')"]),
    ])
    |> command.output_sync()
  should.equal(output.success, False)
  case deno.build().os {
    os.Windows -> {
      should.equal(output.code, 1)
      should.equal(output.signal, None)
    }
    _ -> {
      should.equal(output.code, 128 + 9)
      should.equal(output.signal, Some(signal.SIGKILL))
    }
  }
}

pub fn command_sync_output_test() {
  let assert Ok(CommandOutput(stdout:, ..)) =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval", "await Deno.stdout.write(new TextEncoder().encode('hello'))",
      ]),
    ])
    |> command.output_sync()

  let s = text_decoder.decode(stdout |> uint8_array.buffer())
  should.equal(s, "hello")
}

pub fn command_sync_stderr_output_test() {
  let assert Ok(CommandOutput(stderr:, ..)) =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval", "await Deno.stderr.write(new TextEncoder().encode('error'))",
      ]),
    ])
    |> command.output_sync()

  let s = text_decoder.decode(stderr |> uint8_array.buffer())
  should.equal(s, "error")
}

pub fn command_sync_env_test() {
  let assert Ok(CommandOutput(stdout:, ..)) =
    command.new(deno.exec_path(), [
      command_option.Args([
        "eval",
        "Deno.stdout.write(new TextEncoder().encode(Deno.env.get('FOO') + Deno.env.get('BAR')))",
      ]),
      command_option.Env(dict.from_list([#("FOO", "0123"), #("BAR", "4567")])),
    ])
    |> command.output_sync()

  let s = text_decoder.decode(stdout |> uint8_array.buffer())
  should.equal(s, "01234567")
}

pub fn command_sync_clear_env_test() {
  let assert Ok(CommandOutput(stdout:, ..)) =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "-p", "JSON.stringify(Deno.env.toObject())"]),
      command_option.ClearEnv,
      command_option.Env(dict.from_list([#("FOO", "23147")])),
    ])
    |> command.output_sync()

  let assert Ok(json.Object(obj)) =
    text_decoder.decode(stdout |> uint8_array.buffer())
    |> json.parse()

  // can't check for object equality because the OS may set additional env
  // vars for processes, so we check if PATH isn't present as that is a common
  // env var across OS's and isn't set for processes.
  should.equal(obj |> dict.get("FOO"), Ok(json.String("23147")))
  should.be_false(obj |> dict.has_key("PATH"))
}

pub fn command_sync_uid_test() {
  use <- bool.guard(when: deno.build().os == os.Windows, return: Nil)

  let assert Ok(CommandOutput(stdout:, ..)) =
    command.new("id", [command_option.Args(["-u"])])
    |> command.output_sync()

  let current_uid = text_decoder.decode(stdout |> uint8_array.buffer())

  use <- bool.guard(when: current_uid == "0", return: Nil)

  command.new("echo", [
    command_option.Args(["fhqwhgads"]),
    command_option.Uid(0),
  ])
  |> command.output_sync()
  |> should.equal(Error(error.PermissionDenied))
}

pub fn command_sync_gid_test() {
  use <- bool.guard(when: deno.build().os == os.Windows, return: Nil)

  let assert Ok(CommandOutput(stdout:, ..)) =
    command.new("id", [command_option.Args(["-g"])])
    |> command.output_sync()

  let current_gid = text_decoder.decode(stdout |> uint8_array.buffer())

  use <- bool.guard(when: current_gid == "0", return: Nil)

  command.new("echo", [
    command_option.Args(["fhqwhgads"]),
    command_option.Gid(0),
  ])
  |> command.output_sync()
  |> should.equal(Error(error.PermissionDenied))
}

pub fn spawn_sync_stdin_piped_fails_test() {
  command.new("id", [command_option.Stdin(stdio_option.Piped)])
  |> command.output_sync()
  |> should.equal(
    Error(error.Other(
      "Piped stdin is not supported for this function, use 'Deno.Command.spawn()' instead",
    )),
  )
}

pub fn command_kill_after_status_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args(["help"]),
      command_option.Stdout(stdio_option.Null),
      command_option.Stderr(stdio_option.Null),
    ])
  let child = command |> command.spawn()
  use _ <- promise.then(child |> child_process.status())
  child
  |> child_process.kill()
  |> should.equal(Error(error.Other("Child process has already terminated")))
}

// TODO(@han-tyumi): Should have error message: "Failed to spawn 'doesntexist'"
pub fn process_name_in_spawn_error_test() {
  command.new("doesntexist", [])
  |> command.output_sync()
  |> should.equal(Error(error.NotFound))
}

pub fn command_with_cwd_or_path_test() {
  let cwd = deno.make_temp_dir_sync([make_temp.Prefix("deno_command_test")])
  let suffix = case deno.build().os {
    os.Windows -> ".exe"
    _ -> ""
  }

  deno.mkdir_sync(cwd <> "/subdir", [])
  deno.copy_file_sync(deno.exec_path(), cwd <> "/subdir/my_binary" <> suffix)

  // cwd
  let output =
    command.new("./my_binary" <> suffix, [
      command_option.Cwd(cwd <> "/subdir"),
      command_option.Args(["-v"]),
    ])
    |> command.output_sync()
  case output {
    Ok(output) -> should.equal(output.success, True)
    Error(_) -> Nil
  }

  // path
  let output =
    command.new("my_binary" <> suffix, [
      command_option.Env(dict.from_list([#("PATH", cwd <> "/subdir")])),
      command_option.Args(["-v"]),
    ])
    |> command.output_sync()
  case output {
    Ok(output) -> should.equal(output.success, True)
    Error(_) -> Nil
  }

  deno.remove_sync(cwd, [remove.Recursive])
}

pub fn output_when_manually_consuming_streams_test() {
  let command =
    command.new(deno.exec_path(), [
      command_option.Args(["eval", "console.log('hello world')"]),
      command_option.Stdout(stdio_option.Piped),
      command_option.Stderr(stdio_option.Piped),
    ])

  let child = command |> command.spawn()

  // consume stdout
  let assert Ok(stdout) = child |> child_process.stdout()
  let stdout_promise =
    stdout
    |> readable_stream.async_iterator()
    |> async_iterator.for_await(fn(_) { promise.resolve(Nil) })
  use _ <- promise.then(stdout_promise)

  // consume stderr
  let assert Ok(stderr) = child |> child_process.stderr()
  let stderr_promise =
    stderr
    |> readable_stream.async_iterator()
    |> async_iterator.for_await(fn(_) { promise.resolve(Nil) })
  use _ <- promise.then(stderr_promise)

  use output <- promise.then(child |> child_process.output())
  should.equal(output.success, True)
  should.equal(output.code, 0)
  should.equal(output.signal, None)
  should.equal(output.stdout, uint8_array.new())
  should.equal(output.stderr, uint8_array.new())
}
