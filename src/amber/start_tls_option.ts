import * as $option from "$/amber/amber/start_tls_option.mjs";
import { toArray } from "~/utils/list.ts";

export function toStartTlsOptions(
  options: $option.StartTlsOption$[],
): Deno.StartTlsOptions {
  const result: Deno.StartTlsOptions = {};

  for (const option of options) {
    if ($option.StartTlsOption$isHostname(option)) {
      result.hostname = $option.StartTlsOption$Hostname$0(option);
    } else if ($option.StartTlsOption$isCaCerts(option)) {
      result.caCerts = toArray($option.StartTlsOption$CaCerts$0(option));
    } else if ($option.StartTlsOption$isAlpnProtocols(option)) {
      result.alpnProtocols = toArray(
        $option.StartTlsOption$AlpnProtocols$0(option),
      );
    }
  }

  return result;
}
