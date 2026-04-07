import * as $webSocketOption from "$/amber/amber/web/web_socket_option.mjs";
import { toArray } from "~/utils/list.ts";

export function toWebSocketOptions(
  options: $webSocketOption.WebSocketOption$[],
): WebSocketOptions {
  const result: WebSocketOptions = {};

  for (const option of options) {
    if ($webSocketOption.WebSocketOption$isProtocols(option)) {
      result.protocols = toArray(
        $webSocketOption.WebSocketOption$Protocols$0(option),
      );
    } else if ($webSocketOption.WebSocketOption$isHeaders(option)) {
      result.headers = $webSocketOption.WebSocketOption$Headers$0(option);
    }
  }

  return result;
}

interface WebSocketOptions {
  protocols?: string[];
  headers?: HeadersInit;
}
