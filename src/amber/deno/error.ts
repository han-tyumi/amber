import * as $error from "$/amber/amber/deno/error.mjs";
import type { Result } from "$/prelude.mjs";
import { toResult } from "~/utils/result.ts";
import type { Constructor } from "~/utils/types.d.ts";

const map = new WeakMap<Constructor<Error>, () => $error.Error$>([
  [Deno.errors.AddrInUse, $error.Error$AddrInUse],
  [Deno.errors.AddrNotAvailable, $error.Error$AddrNotAvailable],
  [Deno.errors.AlreadyExists, $error.Error$AlreadyExists],
  [Deno.errors.BadResource, $error.Error$BadResource],
  [Deno.errors.BrokenPipe, $error.Error$BrokenPipe],
  [Deno.errors.Busy, $error.Error$Busy],
  [Deno.errors.ConnectionAborted, $error.Error$ConnectionAborted],
  [Deno.errors.ConnectionRefused, $error.Error$ConnectionRefused],
  [Deno.errors.ConnectionReset, $error.Error$ConnectionReset],
  [Deno.errors.FilesystemLoop, $error.Error$FilesystemLoop],
  [Deno.errors.Http, $error.Error$Http],
  [Deno.errors.Interrupted, $error.Error$Interrupted],
  [Deno.errors.InvalidData, $error.Error$InvalidData],
  [Deno.errors.IsADirectory, $error.Error$IsADirectory],
  [Deno.errors.NetworkUnreachable, $error.Error$NetworkUnreachable],
  [Deno.errors.NotADirectory, $error.Error$NotADirectory],
  [Deno.errors.NotCapable, $error.Error$NotCapable],
  [Deno.errors.NotConnected, $error.Error$NotConnected],
  [Deno.errors.NotFound, $error.Error$NotFound],
  [Deno.errors.NotSupported, $error.Error$NotSupported],
  [Deno.errors.PermissionDenied, $error.Error$PermissionDenied],
  [Deno.errors.TimedOut, $error.Error$TimedOut],
  [Deno.errors.UnexpectedEof, $error.Error$UnexpectedEof],
  [Deno.errors.WouldBlock, $error.Error$WouldBlock],
  [Deno.errors.WriteZero, $error.Error$WriteZero],
]);

export function toError$(error: unknown): $error.Error$ {
  if (error instanceof Error) {
    const errorFactory = map.get(error.constructor as Constructor<Error>);
    if (errorFactory) {
      return errorFactory();
    }
    return $error.Error$Other(error.message);
  }
  return $error.Error$Other(String(error));
}

export function fromThrows<T>(throws: () => T): Result<T, $error.Error$> {
  return toResult.fromThrows(throws, toError$);
}
