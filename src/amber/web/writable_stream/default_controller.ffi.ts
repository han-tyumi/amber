import type * as $defaultController from "$/amber/amber/web/writable_stream/default_controller.mjs";

export type DefaultController$ = WritableStreamDefaultController;

export const signal: typeof $defaultController.signal = (controller) => {
  return controller.signal;
};

export const error: typeof $defaultController.error = (controller, reason) => {
  controller.error(reason);
};
