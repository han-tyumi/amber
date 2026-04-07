import gossamer/abort_signal.{type AbortSignal}

pub type ReadFileOption {
  Signal(AbortSignal)
}
