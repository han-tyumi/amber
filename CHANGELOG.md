# Changelog

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
