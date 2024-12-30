import amber/web/abort_signal.{type AbortSignal}

pub type WriteFileOption {
  Append
  Create(Bool)
  CreateNew
  Mode(Int)
  Signal(AbortSignal)
}
