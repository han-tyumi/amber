import amber/stdio_option.{type StdioOption}
import gleam/dict.{type Dict}
import gossamer/abort_signal.{type AbortSignal}

pub type CommandOption {
  Args(List(String))
  Cwd(String)
  ClearEnv
  Env(Dict(String, String))
  Uid(Int)
  Gid(Int)
  Signal(AbortSignal)
  Stdin(StdioOption)
  Stdout(StdioOption)
  Stderr(StdioOption)
  Detached
  WindowsRawArguments
}
