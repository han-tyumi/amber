import type * as $web from "$/amber/amber/web.mjs";
import { toOption } from "~/utils/option.ts";

export type Date$ = Date;

export const alert: typeof $web.alert = (message) => {
  globalThis.alert(message);
};

export const clear_interval: typeof $web.clear_interval = (id) => {
  globalThis.clearInterval(id);
};

export const clear_timeout: typeof $web.clear_timeout = (id) => {
  globalThis.clearTimeout(id);
};

export const close: typeof $web.close = () => {
  globalThis.close();
};

export const confirm: typeof $web.confirm = (message) => {
  return globalThis.confirm(message);
};

export const prompt: typeof $web.prompt = (message, defaultValue) => {
  return toOption(globalThis.prompt(message, defaultValue));
};

export const queue_microtask: typeof $web.queue_microtask = (func) => {
  globalThis.queueMicrotask(func);
};

export const report_error: typeof $web.report_error = (error) => {
  globalThis.reportError(error);
};

export const set_interval: typeof $web.set_interval = (delay, callback) => {
  return globalThis.setInterval(callback, delay);
};

export const set_timeout: typeof $web.set_timeout = (delay, callback) => {
  return globalThis.setTimeout(callback, delay);
};
