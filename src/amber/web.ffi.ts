import type * as $web from "$/amber/amber/web.mjs";

export const queue_microtask: typeof $web.queue_microtask = (func) => {
  queueMicrotask(func);
};

export const set_timeout: typeof $web.set_timeout = (delay, callback) => {
  return setTimeout(callback, delay);
};

export const clear_timeout: typeof $web.clear_timeout = (id) => {
  clearTimeout(id);
};
