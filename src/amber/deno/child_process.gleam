import amber/deno/command/command_output.{type CommandOutput}
import amber/deno/command/command_status.{type CommandStatus}
import amber/deno/error.{type Error}
import amber/deno/signal.{type Signal}
import amber/web/promise.{type Promise}
import amber/web/readable_stream.{type ReadableStream}
import amber/web/uint8_array.{type Uint8Array}
import amber/web/writable_stream.{type WritableStream}

@external(javascript, "./child_process.ffi.ts", "ChildProcess$")
pub type ChildProcess

@external(javascript, "./child_process.ffi.mjs", "stdin")
pub fn stdin(process: ChildProcess) -> Result(WritableStream(Uint8Array), Error)

@external(javascript, "./child_process.ffi.mjs", "stdout")
pub fn stdout(
  process: ChildProcess,
) -> Result(ReadableStream(Uint8Array), Error)

@external(javascript, "./child_process.ffi.mjs", "stderr")
pub fn stderr(
  process: ChildProcess,
) -> Result(ReadableStream(Uint8Array), Error)

@external(javascript, "./child_process.ffi.mjs", "pid")
pub fn pid(process: ChildProcess) -> Int

@external(javascript, "./child_process.ffi.mjs", "status")
pub fn status(process: ChildProcess) -> Promise(CommandStatus)

@external(javascript, "./child_process.ffi.mjs", "output")
pub fn output(process: ChildProcess) -> Promise(CommandOutput)

@external(javascript, "./child_process.ffi.mjs", "kill")
pub fn kill(process: ChildProcess) -> Result(Nil, Error)

@external(javascript, "./child_process.ffi.mjs", "kill_with")
pub fn kill_with(process: ChildProcess, signal: Signal) -> Result(Nil, Error)

@external(javascript, "./child_process.ffi.mjs", "ref")
pub fn ref(process: ChildProcess) -> ChildProcess

@external(javascript, "./child_process.ffi.mjs", "unref")
pub fn unref(process: ChildProcess) -> ChildProcess

@external(javascript, "./child_process.ffi.mjs", "using_")
pub fn using(
  process: ChildProcess,
  fun: fn(ChildProcess) -> Promise(a),
) -> Promise(a)
