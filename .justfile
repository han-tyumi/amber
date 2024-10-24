set dotenv-load := true

alias dev := develop

bootstrap:
  lefthook install
  deno install
  gleam deps download
  just build

clean:
  gleam clean

build:
  gleam build
  deno task build

test:
  gleam test

develop:
  watchexec -w src -w test 'just build; just test'

publish:
  gleam publish
