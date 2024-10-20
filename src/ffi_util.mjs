import * as $gleam from "gleam";
import * as $option from "gleam/option.mjs";

export function flag(name) {
  return () => ({ [name]: true });
}

export function wrapped(name, fn = id) {
  return (option) => ({ [name]: fn(option[0]) });
}

export function lazy(getValue) {
  let cache;
  return () => (cache ??= getValue());
}

export function lazyMap(...entries) {
  let cache;
  return () => (cache ??= new Map(entries));
}

export function optionsFromList(list, getOptionsMap) {
  const map = getOptionsMap();
  const options = {};
  for (const option of list) {
    Object.assign(options, map.get(option.constructor)?.(option) ?? {});
  }
  return options;
}

export function withOptions(fn, getOptionsMap) {
  return (...args) => {
    const options = optionsFromList(args.pop(), getOptionsMap);
    return fn(...args, options);
  };
}

export function enumToString(getEnumMap) {
  return (enumValue) => {
    const map = getEnumMap();
    return map.get(enumValue.constructor);
  };
}

export function stringToEnum(getStringToType) {
  return (stringValue) => new (getStringToType()[stringValue])();
}

export function unwrapArg(default$) {
  return (option) => $option.unwrap(option, default$);
}

function id(value) {
  return value;
}

export function listToArray(list) {
  return list.toArray();
}

export function withArgTransform(fn, transformers) {
  return (...args) => fn(...args.map((arg, i) => (transformers[i] ?? id)(arg)));
}

export function objectToCustomType(constructor, mapping) {
  return (object) =>
    new constructor(...mapping.map(([key, fn = id]) => fn(object[key])));
}

export function optionFromNullable(nullable) {
  return nullable == null ? new $option.None() : new $option.Some(nullable);
}

export function resultFromNullable(nullable, error) {
  return nullable == null ? new $gleam.Error(error) : new $gleam.Ok(nullable);
}

export function withReturnTransform(fn, transform) {
  return (...args) => transform(fn(...args));
}
