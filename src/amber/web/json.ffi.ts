import * as $json from "$/amber/amber/web/json.mjs";
import Dict from "$/gleam_stdlib/dict.mjs";
import { List } from "$/prelude.mjs";
import { toObjectWithMap } from "~/utils/dict.ts";
import { toResult } from "~/utils/result.ts";

type Json = null | boolean | number | string | Json[] | { [key: string]: Json };

function gleamJsonReviver(_key: string, value: unknown) {
  if (value === null) {
    return new $json.Null();
  }
  if (typeof value === "boolean") {
    return new $json.Boolean(value);
  }
  if (typeof value === "number") {
    return new $json.Number(value);
  }
  if (typeof value === "string") {
    return new $json.String(value);
  }
  if (Array.isArray(value)) {
    return new $json.Array(List.fromArray(value));
  }
  if (typeof value === "object") {
    return new $json.Object(Dict.fromObject(value as Record<string, unknown>));
  }
}

export const parse: typeof $json.parse = (text) => {
  return toResult.fromThrows(() => JSON.parse(text, gleamJsonReviver), String);
};

function jsonToObject(json: $json.Json$): Json {
  if (json instanceof $json.Null) {
    return null;
  }
  if (
    json instanceof $json.Boolean ||
    json instanceof $json.Number ||
    json instanceof $json.String
  ) {
    return json[0];
  }
  if (json instanceof $json.Array) {
    return json[0].toArray().map((child) => jsonToObject(child));
  }
  if (json instanceof $json.Object) {
    return toObjectWithMap(json[0], jsonToObject);
  }
  throw new Error("unknown Gleam Json instance");
}

export const stringify: typeof $json.stringify = (json) => {
  return JSON.stringify(jsonToObject(json));
};
