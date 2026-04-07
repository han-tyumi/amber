import * as $upgrade from "$/amber/amber/web_socket_upgrade.mjs";

export function toWebSocketUpgrade(
  upgrade: Deno.WebSocketUpgrade,
): $upgrade.WebSocketUpgrade$ {
  return $upgrade.WebSocketUpgrade$WebSocketUpgrade(
    upgrade.response,
    upgrade.socket,
  );
}
