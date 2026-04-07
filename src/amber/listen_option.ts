import * as $listenOption from "$/amber/amber/listen_option.mjs";

export function toListenOptions(
  port: number,
  options: $listenOption.ListenOption$[],
): Deno.TcpListenOptions & { transport?: "tcp" } {
  const result: Deno.TcpListenOptions & { transport?: "tcp" } = { port };
  for (const option of options) {
    if ($listenOption.ListenOption$isHostname(option)) {
      result.hostname = $listenOption.ListenOption$Hostname$0(option);
    }
  }
  return result;
}
