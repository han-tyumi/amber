import amber/web.{type AbortSignal}

pub type WriteFileOption {
  Append
  Create(Bool)
  CreateNew
  Mode(Int)
  Signal(AbortSignal)
}
