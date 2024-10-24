import * as $error from "amber/error.mjs";
import type { Constructor } from "type-fest";

const map = new WeakMap<Constructor<Error>, Constructor<$error.Error$>>([
  [Deno.errors.AddrInUse, $error.AddrInUse],
  [Deno.errors.AddrNotAvailable, $error.AddrNotAvailable],
  [Deno.errors.AlreadyExists, $error.AlreadyExists],
  [Deno.errors.BadResource, $error.BadResource],
  [Deno.errors.BrokenPipe, $error.BrokenPipe],
  [Deno.errors.Busy, $error.Busy],
  [Deno.errors.ConnectionAborted, $error.ConnectionAborted],
  [Deno.errors.ConnectionRefused, $error.ConnectionRefused],
  [Deno.errors.ConnectionReset, $error.ConnectionReset],
  [Deno.errors.FilesystemLoop, $error.FilesystemLoop],
  [Deno.errors.Http, $error.Http],
  [Deno.errors.Interrupted, $error.Interrupted],
  [Deno.errors.InvalidData, $error.InvalidData],
  [Deno.errors.IsADirectory, $error.IsADirectory],
  [Deno.errors.NetworkUnreachable, $error.NetworkUnreachable],
  [Deno.errors.NotADirectory, $error.NotADirectory],
  [Deno.errors.NotCapable, $error.NotCapable],
  [Deno.errors.NotConnected, $error.NotConnected],
  [Deno.errors.NotFound, $error.NotFound],
  [Deno.errors.NotSupported, $error.NotSupported],
  [Deno.errors.PermissionDenied, $error.PermissionDenied],
  [Deno.errors.TimedOut, $error.TimedOut],
  [Deno.errors.UnexpectedEof, $error.UnexpectedEof],
  [Deno.errors.WouldBlock, $error.WouldBlock],
  [Deno.errors.WriteZero, $error.WriteZero],
]);

export function toError$(error: unknown): $error.Error$ {
  if (error instanceof Error) {
    const Error$ = map.get(error.constructor as Constructor<Error>);
    if (Error$) {
      return new Error$();
    }
  }
  throw error;
}
