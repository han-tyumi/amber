import * as $error from "$/amber/amber/error.mjs";
import type { Result } from "$/prelude.mjs";
import { toResult } from "~/utils/result.ts";

export function toError$(error: unknown): $error.Error$ {
  if (error instanceof Deno.errors.AddrInUse) return $error.Error$AddrInUse();
  if (error instanceof Deno.errors.AddrNotAvailable) {
    return $error.Error$AddrNotAvailable();
  }
  if (error instanceof Deno.errors.AlreadyExists) {
    return $error.Error$AlreadyExists();
  }
  if (error instanceof Deno.errors.BadResource) {
    return $error.Error$BadResource();
  }
  if (error instanceof Deno.errors.BrokenPipe) return $error.Error$BrokenPipe();
  if (error instanceof Deno.errors.Busy) return $error.Error$Busy();
  if (error instanceof Deno.errors.ConnectionAborted) {
    return $error.Error$ConnectionAborted();
  }
  if (error instanceof Deno.errors.ConnectionRefused) {
    return $error.Error$ConnectionRefused();
  }
  if (error instanceof Deno.errors.ConnectionReset) {
    return $error.Error$ConnectionReset();
  }
  if (error instanceof Deno.errors.FilesystemLoop) {
    return $error.Error$FilesystemLoop();
  }
  if (error instanceof Deno.errors.Http) return $error.Error$Http();
  if (error instanceof Deno.errors.Interrupted) {
    return $error.Error$Interrupted();
  }
  if (error instanceof Deno.errors.InvalidData) {
    return $error.Error$InvalidData();
  }
  if (error instanceof Deno.errors.IsADirectory) {
    return $error.Error$IsADirectory();
  }
  if (error instanceof Deno.errors.NetworkUnreachable) {
    return $error.Error$NetworkUnreachable();
  }
  if (error instanceof Deno.errors.NotADirectory) {
    return $error.Error$NotADirectory();
  }
  if (error instanceof Deno.errors.NotCapable) return $error.Error$NotCapable();
  if (error instanceof Deno.errors.NotConnected) {
    return $error.Error$NotConnected();
  }
  if (error instanceof Deno.errors.NotFound) return $error.Error$NotFound();
  if (error instanceof Deno.errors.NotSupported) {
    return $error.Error$NotSupported();
  }
  if (error instanceof Deno.errors.PermissionDenied) {
    return $error.Error$PermissionDenied();
  }
  if (error instanceof Deno.errors.TimedOut) return $error.Error$TimedOut();
  if (error instanceof Deno.errors.UnexpectedEof) {
    return $error.Error$UnexpectedEof();
  }
  if (error instanceof Deno.errors.WouldBlock) return $error.Error$WouldBlock();
  if (error instanceof Deno.errors.WriteZero) return $error.Error$WriteZero();

  if (error instanceof Error) {
    return $error.Error$Other(error.message);
  }
  return $error.Error$Other(String(error));
}

export function fromThrows<T>(throws: () => T): Result<T, $error.Error$> {
  return toResult.fromThrows(throws, toError$);
}
