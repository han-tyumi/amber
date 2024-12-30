import * as dict$ from "$/gleam_stdlib/gleam/dict.mjs";

export function toObjectWithMap<K extends string | number | symbol, V, VV>(
  dict: dict$.Dict$<K, V>,
  map: (value: V) => VV,
) {
  const acc = {} as Record<K, VV>;
  dict$.each(dict, (key: K, value: V) => {
    acc[key] = map(value);
  });
  return acc;
}

export function toObject<K extends string | number | symbol, V>(
  dict: dict$.Dict$<K, V>,
) {
  return toObjectWithMap(dict, (value) => value);
}
