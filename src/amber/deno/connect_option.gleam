import amber/web/abort_signal.{type AbortSignal}

pub type ConnectOption {
  Hostname(String)
  Signal(AbortSignal)
}
