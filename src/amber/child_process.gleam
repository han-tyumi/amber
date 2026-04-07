import amber/command/command_output.{type CommandOutput}
import amber/command/command_status.{type CommandStatus}
import amber/error.{type Error}
import amber/signal.{type Signal}
import gossamer/promise.{type Promise}
import gossamer/readable_stream.{type ReadableStream}
import gossamer/uint8_array.{type Uint8Array}
import gossamer/writable_stream.{type WritableStream}

@external(javascript, "./child_process.type.ts", "ChildProcess$")
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
