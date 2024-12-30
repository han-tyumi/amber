import amber/web/abort_signal.{type AbortSignal}

pub type ReadFileOption {
  Signal(AbortSignal)
}
