# Amber 🧡

[![Package Version](https://img.shields.io/hexpm/v/amber?color=F09000)](https://hex.pm/packages/amber)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/amber/)
[![Deno >= 2.2.10](https://img.shields.io/badge/deno-%3E%3D%202.2.10-blue?logo=deno)](https://deno.com/)

✨🦕 [Deno](https://deno.com/) Bindings For [Gleam](https://gleam.run/) 🧡

## Installation

```sh
gleam add amber
```

Amber only supports the JavaScript target using the Deno runtime.

The following configuration should be used in your `gleam.toml`.

```toml
target = "javascript"

[javascript]
runtime = "deno"
```

## Usage

```gleam
import amber
import gossamer/text_encoder

pub fn main() {
  let assert Ok(_) =
    amber.write_file_sync(
      to: "amber.txt",
      contents: text_encoder.encode("deno bindings for gleam"),
    )
}
```

Further documentation can be found at <https://hexdocs.pm/amber>.

## Contributing

### Prerequisites

- [Deno](https://docs.deno.com/runtime/getting_started/installation/)
- [Erlang](https://www.erlang.org/downloads)
- [Gleam](https://gleam.run/install/)
- [Just](https://just.systems/man/en/installation.html)
- [Lefthook](https://lefthook.dev/#how-to-install-lefthook)
- [Rebar3](https://rebar3.org/docs/getting-started/)
- [Watchexec](https://github.com/watchexec/watchexec#install)

_Tip_: These can also be installed via
[mise](https://mise.jdx.dev/getting-started.html) or
[asdf](https://asdf-vm.com/guide/getting-started.html), which read from
`.tool-versions`.

### Initial Setup

```sh
just
```

### Development

```sh
just watch build test
```
