import * as $info from "$/amber/amber/tls_handshake_info.mjs";
import { toOption } from "~/utils/option.ts";

export function toTlsHandshakeInfo(
  info: Deno.TlsHandshakeInfo,
): $info.TlsHandshakeInfo$ {
  return $info.TlsHandshakeInfo$TlsHandshakeInfo(
    toOption(info.alpnProtocol),
  );
}
