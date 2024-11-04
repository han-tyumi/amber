import type * as $web from "$/amber/amber/web.mjs";

export const set_timeout: typeof $web.set_timeout = (delay, callback) => {
  return globalThis.setTimeout(callback, delay);
};

export const clear_timeout: typeof $web.clear_timeout = (id) => {
  globalThis.clearTimeout(id);
};
