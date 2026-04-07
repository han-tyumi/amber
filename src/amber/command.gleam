import amber/child_process.{type ChildProcess}
import amber/command/command_option.{type CommandOption}
import amber/command/command_output.{type CommandOutput}
import amber/error.{type Error}

@external(javascript, "./command.type.ts", "Command$")
pub type Command

@external(javascript, "./command.ffi.mjs", "new_")
pub fn new(command: String, options: List(CommandOption)) -> Command

@external(javascript, "./command.ffi.mjs", "output_sync")
pub fn output_sync(command: Command) -> Result(CommandOutput, Error)

@external(javascript, "./command.ffi.mjs", "spawn")
pub fn spawn(command: Command) -> ChildProcess
