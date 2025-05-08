import type { CustomType } from "$/prelude.mjs";
import type { Constructor } from "./types.d.ts";

export function fromEnumCustomType<K extends string | number>(
  map: Map<Constructor<CustomType>, K>,
): (instance: CustomType) => K | undefined {
  return (instance) =>
    map.get(
      instance.constructor as Constructor<CustomType>,
    );
}

export function toEnumCustomType<
  K extends string | number,
  T extends CustomType,
>(
  map: Record<K, Constructor<T>>,
): (string: K) => T {
  return (string) => new (map[string])();
}
