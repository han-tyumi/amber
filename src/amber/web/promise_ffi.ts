import * as $promise from "amber/web/promise.mjs";
import * as $promiseSettledResult from "amber/web/promise_settled_result.mjs";
import { toList } from "prelude";

export const new_: typeof $promise.new$ = (executor) => {
  return new Promise((resolve, reject) => {
    executor(
      (value) => {
        resolve(value);
      },
      (reason) => {
        reject(reason);
      },
    );
  });
};

export const all: typeof $promise.all = async (values) => {
  const results = await Promise.all(values);
  return toList(results);
};

export const race: typeof $promise.race = (values) => {
  return Promise.race(values);
};

export const reject: typeof $promise.reject = (reason) => {
  return Promise.reject(reason);
};

export const resolve: typeof $promise.resolve = (value) => {
  return Promise.resolve(value);
};

export const allSettled: typeof $promise.all_settled = async (values) => {
  const results = await Promise.allSettled(values);
  return toList(
    results.map((result) =>
      result.status === "fulfilled"
        ? new $promiseSettledResult.Fulfilled(result.value)
        : new $promiseSettledResult.Rejected(result.reason)
    ),
  );
};

export const any: typeof $promise.any = (values) => {
  return Promise.any(values);
};

export const withResolvers: typeof $promise.with_resolvers = () => {
  const { promise, resolve, reject } = Promise.withResolvers();
  return new $promise.PromiseWithResolvers(
    promise,
    (value) => {
      resolve(value);
    },
    (reason) => {
      reject(reason);
    },
  );
};

export const then: typeof $promise.then$ = <T, U>(
  promise: Promise<T>,
  onfulfilled: Parameters<typeof $promise.then$<T, U>>[1],
) => {
  return promise.then(onfulfilled);
};

export const catch_: typeof $promise.catch$ = <T, U>(
  promise: Promise<T>,
  onrejected: Parameters<typeof $promise.catch$<U>>[1],
) => {
  return promise.catch(onrejected);
};

export const finally_: typeof $promise.finally$ = <T>(
  promise: Promise<T>,
  onfinally: Parameters<typeof $promise.finally$<T>>[1],
) => {
  return promise.finally(onfinally);
};
