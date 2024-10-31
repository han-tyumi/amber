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

docs:
  gleam docs build

watch +recipes:
  watchexec -c -w src -w test -- just {{recipes}}

develop: (watch 'build test')

publish:
  just clean build test
  gleam publish
