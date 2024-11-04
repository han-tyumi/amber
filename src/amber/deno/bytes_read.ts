import * as $bytesRead from "$/amber/amber/deno/bytes_read.mjs";

export function toBytesRead(bytesRead: number | null): $bytesRead.BytesRead$ {
  if (bytesRead === null) {
    return new $bytesRead.EOF();
  }
  return new $bytesRead.Bytes(bytesRead);
}
