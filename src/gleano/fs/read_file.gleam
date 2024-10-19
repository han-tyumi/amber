import gleano/web.{type AbortSignal}

pub type ReadFileOption {
  Signal(AbortSignal)
}
