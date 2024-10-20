pub type SymlinkOption {
  Type(SymlinkType)
}

pub type SymlinkType {
  File
  Dir
  Junction
}
