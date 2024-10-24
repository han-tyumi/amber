# amber

[![Package Version](https://img.shields.io/hexpm/v/amber)](https://hex.pm/packages/amber)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/amber/)

:construction: **This package a work in progress. Use at your own risk.**
:construction:

:sauropod: [Deno](https://deno.com/) bindings for [Gleam](https://gleam.run/).
:star2:

Currently only bindings to the
[Deno File System APIs](https://docs.deno.com/api/deno/file-system) are
available.

Bindings without [tests](test/amber) are unsafe and may be missing things like
proper exception handling.

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
import amber/fs

pub fn main() {
  fs.write_text_file_sync("amber.txt", "deno bindings for gleam", [])
}
```

Further documentation can be found at <https://hexdocs.pm/amber>.

## Contributing

### Prerequisites

- [Deno](https://docs.deno.com/runtime/getting_started/installation/)
- [Gleam](https://gleam.run/getting-started/installing/)
- [Just](https://just.systems/man/en/prerequisites.html)
- [Rebar3](https://rebar3.org/docs/getting-started/)
- [Watchexec](https://github.com/watchexec/watchexec/tree/main?tab=readme-ov-file#install)

_Tip_: You can install these tools using a version manager like
[asdf](https://asdf-vm.com/guide/getting-started.html) or
[mise](https://mise.jdx.dev/getting-started.html), which can read from
`.tool-versions`.

### Initial Setup

```sh
just
```

### Development

```sh
just develop
```
