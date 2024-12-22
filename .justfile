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
  cp -r patch/* build/

test:
  gleam test

docs:
  gleam docs build

watch +recipes:
  watchexec --no-meta -c -e gleam,mjs,ts,md,json -- just {{recipes}}

publish:
  just clean build test
  gleam publish
