import * as $bytesRead from "$/amber/amber/bytes_read.mjs";

export function toBytesRead(bytesRead: number | null): $bytesRead.BytesRead$ {
  if (bytesRead === null) {
    return $bytesRead.BytesRead$EOF();
  }
  return $bytesRead.BytesRead$Bytes(bytesRead);
}
