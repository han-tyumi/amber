alias dev := develop

bootstrap: build
  lefthook install

clean:
  gleam clean

build:
  gleam build

test:
  gleam test

develop:
  watchexec -w src -w test 'gleam build; gleam test'
