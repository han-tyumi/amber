import * as $option from "$/amber/amber/deno/upgrade_web_socket_option.mjs";

export function toUpgradeWebSocketOptions(
  options: $option.UpgradeWebSocketOption$[],
): Deno.UpgradeWebSocketOptions {
  const result: Deno.UpgradeWebSocketOptions = {};

  for (const option of options) {
    if ($option.UpgradeWebSocketOption$isProtocol(option)) {
      result.protocol = $option.UpgradeWebSocketOption$Protocol$0(option);
    } else if ($option.UpgradeWebSocketOption$isIdleTimeout(option)) {
      result.idleTimeout = $option.UpgradeWebSocketOption$IdleTimeout$0(option);
    }
  }

  return result;
}
