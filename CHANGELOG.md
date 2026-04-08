# Changelog

## 1.0.0 (2026-04-08)

### Breaking Changes

- catch callback signature changed.
- Web API modules moved to the gossamer package. Import paths changed from
  `amber/web/X` to `gossamer/X`. Deno modules flattened from `amber/deno/X` to
  `amber/X`. The main `amber/deno` module is now `amber`.

- Web APIs extracted to gossamer (https://hex.pm/packages/gossamer)
- amber depends on gossamer >= 1.0.0
- `import amber/deno` → `import amber`
- `import amber/deno/serve` → `import amber/serve`
- `import amber/web/promise` → `import gossamer/promise`
- Use .type.ts files for external type annotations
- Most function signatures changed. Functions that can fail now return Result.
  Functions with optional params are split into base + _with variants. env.get
  returns Result(String, Nil) instead of Option(String). gossamer >= 4.0.1
  required.

### Features

- add TextDecoder instance properties
- add consoleSize, inspect, and networkInterfaces
- add stdin, stdout, and stderr bindings
- complete Uint8Array API
- add ReadableStream and WritableStream creation
- add TransformStream
- add CompressionStream and DecompressionStream
- add URL and URLSearchParams
- add Headers, Request, and Response
- add fetch
- add Deno.serve() HTTP server
- add TCP networking with listen and connect
- add WebSocket, CloseEvent, MessageEvent, and Deno.upgradeWebSocket
- add TLS networking with connectTls, listenTls, and startTls
- add Web Crypto API with typed algorithm parameters
- add Deno.resolveDns() with typed record results
- add Blob, File, and FormData
- extract web APIs to gossamer, flatten module structure
- comprehensive conventions audit and refactor
- add global_this module with alert, confirm, prompt, close

### Fixes

- use Dynamic for Promise catch rejection reason

## 0.6.0 (2026-04-06)

### Breaking Changes

#### Modernized Build System and FFI

- Bumped Gleam 1.10.0 → 1.15.2, Deno 2.3.1 → 2.7.11, esbuild 0.25.4 → 0.28.0.
- Colocated FFI output alongside source files, simplifying `@external` paths.
- Migrated all FFI code to Gleam v1.13 stable constructor API.
- Added `@external` type annotations for all 20 opaque types, providing real
  TypeScript types instead of `any`.
- Replaced all deprecated Gleam JS APIs (`CustomType`, `[0]` access, `toArray`,
  `instanceof`, etc.) with stable v1.13 equivalents.
- Removed `nullish.ts`, `CustomTypeOptionsMap.ts`, `enumCustomType.ts`, and
  `types.d.ts` utilities.
- Fixed TextEncoderStream FFI bug (was using TextDecoderStream).
- Fixed command test for Deno's improved NotADirectory error typing.

## 0.5.1 (2025-05-08)

### Features

#### Improved Types and Upgraded Tooling

- Upgrade tooling and dependencies.
- Remove `type-fest` dependency.
- Change non-type `option.d.mts` imports to `option.mjs`.
- Ignore inconsistent generic type errors.
- Patch `gleeunit`'s `gleam.d.mts`.
- Add `check` recipe for running `deno check`.
- Add [Knope](https://knope.tech/).
