import * as $option from "gleam/option.mjs";

export function flag(name) {
  return () => ({ [name]: true });
}

export function wrapped(name, fn = id) {
  return (option) => ({ [name]: fn(option[0]) });
}

export function lazyMap(...entries) {
  let cache;
  return () => (cache ??= new Map(entries));
}

export function withOptions(fn, getOptionsMap) {
  return (...args) => {
    const map = getOptionsMap();

    const options = {};
    for (const option of args.pop()) {
      Object.assign(options, map.get(option.constructor)?.(option) ?? {});
    }

    return fn(...args, options);
  };
}

export function enumToString(getEnumMap) {
  return (enumValue) => {
    const map = getEnumMap();
    return map.get(enumValue.constructor);
  };
}

export function unwrapArg(default$) {
  return (option) => $option.unwrap(option, default$);
}

function id(value) {
  return value;
}

export function withArgTransform(fn, transformers) {
  return (...args) => fn(...args.map((arg, i) => (transformers[i] ?? id)(arg)));
}

export function objectToCustomType(constructor, mapping) {
  return (object) =>
    new constructor(...mapping.map(([key, fn = id]) => fn(object[key])));
}

export function optionFromNullable(nullable) {
  return nullable === null ? new $option.None() : new $option.Some(nullable);
}

export function withReturnTransform(fn, transform) {
  return (...args) => transform(fn(...args));
}
