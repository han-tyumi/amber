import type * as $web from "amber/web.mjs";

export const setTimeout: typeof $web.set_timeout = (delay, callback) => {
  return globalThis.setTimeout(callback, delay);
};

export const clearTimeout: typeof $web.clear_timeout = (id) => {
  globalThis.clearTimeout(id);
};
