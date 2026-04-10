import * as $option from "$/amber/amber/connect_tls_option.mjs";
import * as $keyPem from "$/amber/amber/tls_certified_key_pem.mjs";
import { toArray } from "~/utils/list.ts";

export function toConnectTlsOptions(
  port: number,
  options: $option.ConnectTlsOption$[],
): Deno.ConnectTlsOptions & Partial<Deno.TlsCertifiedKeyPem> {
  const result: Deno.ConnectTlsOptions & Partial<Deno.TlsCertifiedKeyPem> = {
    port,
  };

  for (const option of options) {
    if ($option.ConnectTlsOption$isHostname(option)) {
      result.hostname = $option.ConnectTlsOption$Hostname$0(option);
    } else if ($option.ConnectTlsOption$isCaCerts(option)) {
      result.caCerts = toArray($option.ConnectTlsOption$CaCerts$0(option));
    } else if ($option.ConnectTlsOption$isAlpnProtocols(option)) {
      result.alpnProtocols = toArray(
        $option.ConnectTlsOption$AlpnProtocols$0(option),
      );
    } else if (
      $option.ConnectTlsOption$isUnsafelyDisableHostnameVerification(option)
    ) {
      result.unsafelyDisableHostnameVerification = true;
    } else if ($option.ConnectTlsOption$isCertifiedKey(option)) {
      const certifiedKey = $option.ConnectTlsOption$CertifiedKey$0(option);
      result.key = $keyPem.TlsCertifiedKeyPem$TlsCertifiedKeyPem$key(
        certifiedKey,
      );
      result.cert = $keyPem.TlsCertifiedKeyPem$TlsCertifiedKeyPem$cert(
        certifiedKey,
      );
    }
  }

  return result;
}
