import amber/deno/signal.{type Signal}
import amber/web/uint8_array.{type Uint8Array}
import gleam/option.{type Option}

pub type CommandOutput {
  CommandOutput(
    stdout: Uint8Array,
    stderr: Uint8Array,
    success: Bool,
    code: Int,
    signal: Option(Signal),
  )
}
