import * as $option from "$/amber/amber/listen_tls_option.mjs";
import * as $keyPem from "$/amber/amber/tls_certified_key_pem.mjs";
import { toArray } from "~/utils/list.ts";

export function toListenTlsOptions(
  port: number,
  certifiedKey: $keyPem.TlsCertifiedKeyPem$,
  options: $option.ListenTlsOption$[],
): Deno.ListenTlsOptions & Deno.TlsCertifiedKeyPem {
  const result: Deno.ListenTlsOptions & Deno.TlsCertifiedKeyPem = {
    port,
    key: $keyPem.TlsCertifiedKeyPem$TlsCertifiedKeyPem$key(certifiedKey),
    cert: $keyPem.TlsCertifiedKeyPem$TlsCertifiedKeyPem$cert(certifiedKey),
  };

  for (const option of options) {
    if ($option.ListenTlsOption$isHostname(option)) {
      result.hostname = $option.ListenTlsOption$Hostname$0(option);
    } else if ($option.ListenTlsOption$isAlpnProtocols(option)) {
      result.alpnProtocols = toArray(
        $option.ListenTlsOption$AlpnProtocols$0(option),
      );
    }
  }

  return result;
}
