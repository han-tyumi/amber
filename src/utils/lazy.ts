export type LazyFunction<T> = () => T;

// TODO(@han-tyumi): Do we need this?
export function lazy<T>(fun: LazyFunction<T>): LazyFunction<T> {
  let cache: T | undefined;
  return () => (cache ??= fun());
}

export function lazyMap<K, V>(...entries: ([K, V])[]): () => Map<K, V> {
  return lazy(() => new Map(entries));
}
