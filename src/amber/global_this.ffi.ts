import type * as $globalThis from "$/amber/amber/global_this.mjs";
import { toResult } from "~/utils/result.ts";

export const alert: typeof $globalThis.alert = () => {
  globalThis.alert();
};

export const alert_with: typeof $globalThis.alert_with = (message) => {
  globalThis.alert(message);
};

export const confirm: typeof $globalThis.confirm = () => {
  return globalThis.confirm();
};

export const confirm_with: typeof $globalThis.confirm_with = (message) => {
  return globalThis.confirm(message);
};

export const prompt: typeof $globalThis.prompt = () => {
  return toResult(globalThis.prompt(), undefined);
};

export const prompt_with: typeof $globalThis.prompt_with = (message) => {
  return toResult(globalThis.prompt(message), undefined);
};

export const prompt_with_default: typeof $globalThis.prompt_with_default = (
  message,
  defaultValue,
) => {
  return toResult(globalThis.prompt(message, defaultValue), undefined);
};

export const close: typeof $globalThis.close = () => {
  globalThis.close();
};
