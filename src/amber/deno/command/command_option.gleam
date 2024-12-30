import amber/deno/stdio_option.{type StdioOption}
import amber/web/abort_signal.{type AbortSignal}
import gleam/dict.{type Dict}

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
  WindowsRawArguments
}
