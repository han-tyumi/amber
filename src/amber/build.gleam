import amber/build/arch.{type Arch}
import amber/build/os.{type Os}
import gleam/option.{type Option}

pub type Build {
  Build(target: String, arch: Arch, os: Os, vendor: String, env: Option(String))
}
