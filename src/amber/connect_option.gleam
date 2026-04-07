import gossamer/abort_signal.{type AbortSignal}

pub type ConnectOption {
  Hostname(String)
  Signal(AbortSignal)
}
