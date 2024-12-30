import amber/deno/signal.{type Signal}
import gleam/option.{type Option}

pub type CommandStatus {
  CommandStatus(success: Bool, code: Int, signal: Option(Signal))
}
