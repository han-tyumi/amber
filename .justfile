set dotenv-load := true

alias dev := develop

bootstrap:
  lefthook install
  deno install
  gleam deps download
  just build

clean:
  gleam clean
  -deno task clean

build:
  deno task build
  gleam build

test:
  gleam test

develop:
  watchexec -w src -w test 'just build; just test'

publish:
  gleam publish
