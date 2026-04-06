# Amber 🧡

[![Package Version](https://img.shields.io/hexpm/v/amber)](https://hex.pm/packages/amber)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/amber/)

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
import amber/deno

pub fn main() {
  deno.write_text_file_sync("amber.txt", "deno bindings for gleam", [])
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
