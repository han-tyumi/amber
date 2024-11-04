import { Error, Ok } from "$/prelude.mjs";

export function new_(fun) {
  if (typeof fun !== "function") {
    return new Error(undefined);
  }

  wrappedFun.calls = [];

  function wrappedFun(...args) {
    const result = fun(...args);
    wrappedFun.calls.push({ args, result });
    return result;
  }

  return new Ok(wrappedFun);
}

export function fun(spy) {
  return spy;
}

export function has_been_called(spy) {
  return spy.calls.length > 0;
}
