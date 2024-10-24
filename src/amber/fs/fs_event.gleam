import gleam/option.{type Option}

pub type FsEvent {
  FsEvent(kind: FsEventKind, paths: List(String), flag: Option(FsEventFlag))
}

pub type FsEventKind {
  Any
  Access
  Create
  Modify
  Rename
  Remove
  Other
}

pub type FsEventFlag {
  Rescan
}
