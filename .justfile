set dotenv-load := true

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
  watchexec --no-meta -c -w src -w test -e gleam,mjs,ts -- just {{recipes}}

publish:
  just clean build test
  gleam publish
