import amber/signal.{type Signal}
import gleam/option.{type Option}
import gossamer/uint8_array.{type Uint8Array}

pub type CommandOutput {
  CommandOutput(
    stdout: Uint8Array,
    stderr: Uint8Array,
    success: Bool,
    code: Int,
    signal: Option(Signal),
  )
}
