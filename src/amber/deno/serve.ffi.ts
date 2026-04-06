import * as $netAddr from "$/amber/amber/deno/net_addr.mjs";
import type * as $serve from "$/amber/amber/deno/serve.mjs";
import * as $serveHandlerInfo from "$/amber/amber/deno/serve/serve_handler_info.mjs";
import * as $serveOption from "$/amber/amber/deno/serve/serve_option.mjs";
import { toArray } from "~/utils/list.ts";

export type HttpServer$ = Deno.HttpServer<Deno.NetAddr>;

function toNetAddr(addr: Deno.NetAddr) {
  return $netAddr.NetAddr$NetAddr(addr.transport, addr.hostname, addr.port);
}

function toServeHandlerInfo(info: Deno.ServeHandlerInfo<Deno.NetAddr>) {
  return $serveHandlerInfo.ServeHandlerInfo$ServeHandlerInfo(
    toNetAddr(info.remoteAddr),
    info.completed.then(() => undefined),
  );
}

function toServeHandler(
  handler: Parameters<typeof $serve.serve>[0],
): Deno.ServeHandler<Deno.NetAddr> {
  return (request, info) => handler(request, toServeHandlerInfo(info));
}

function toServeOptions(
  options: $serveOption.ServeOption$[],
): Deno.ServeTcpOptions {
  const result: Deno.ServeTcpOptions = {};
  for (const option of options) {
    if ($serveOption.ServeOption$isPort(option)) {
      result.port = $serveOption.ServeOption$Port$0(option);
    } else if ($serveOption.ServeOption$isHostname(option)) {
      result.hostname = $serveOption.ServeOption$Hostname$0(option);
    } else if ($serveOption.ServeOption$isSignal(option)) {
      result.signal = $serveOption.ServeOption$Signal$0(option);
    } else if ($serveOption.ServeOption$isOnListen(option)) {
      const callback = $serveOption.ServeOption$OnListen$0(option);
      result.onListen = (addr) => callback(toNetAddr(addr));
    } else if ($serveOption.ServeOption$isOnError(option)) {
      result.onError = $serveOption.ServeOption$OnError$0(option);
    } else if ($serveOption.ServeOption$isReusePort(option)) {
      result.reusePort = true;
    }
  }
  return result;
}

export const finished: typeof $serve.finished = (server) => {
  return server.finished.then(() => undefined);
};

export const addr: typeof $serve.addr = (server) => {
  return toNetAddr(server.addr);
};

export const ref: typeof $serve.ref = (server) => {
  server.ref();
};

export const unref: typeof $serve.unref = (server) => {
  server.unref();
};

export const serve: typeof $serve.serve = (handler) => {
  return Deno.serve(toServeHandler(handler));
};

export const serve_with: typeof $serve.serve_with = (options, handler) => {
  return Deno.serve(
    toServeOptions(toArray(options)),
    toServeHandler(handler),
  );
};
