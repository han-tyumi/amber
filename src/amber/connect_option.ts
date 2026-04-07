import * as $connectOption from "$/amber/amber/connect_option.mjs";

export function toConnectOptions(
  port: number,
  options: $connectOption.ConnectOption$[],
): Deno.ConnectOptions {
  const result: Deno.ConnectOptions = { port };
  for (const option of options) {
    if ($connectOption.ConnectOption$isHostname(option)) {
      result.hostname = $connectOption.ConnectOption$Hostname$0(option);
    } else if ($connectOption.ConnectOption$isSignal(option)) {
      result.signal = $connectOption.ConnectOption$Signal$0(option);
    }
  }
  return result;
}
