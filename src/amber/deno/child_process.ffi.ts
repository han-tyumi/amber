import type * as $childProcess from "$/amber/amber/deno/child_process.mjs";
import { toCommandOutputType } from "~/amber/deno/command/command_output.ts";
import { toCommandStatusType } from "~/amber/deno/command/command_status.ts";
import { fromThrows } from "~/amber/deno/error.ts";
import { toSignal } from "~/amber/deno/signal.ts";

export const stdin: typeof $childProcess.stdin = (
  process: Deno.ChildProcess,
) => {
  return fromThrows(() => process.stdin);
};

export const stdout: typeof $childProcess.stdout = (
  process: Deno.ChildProcess,
) => {
  return fromThrows(() => process.stdout);
};

export const stderr: typeof $childProcess.stderr = (
  process: Deno.ChildProcess,
) => {
  return fromThrows(() => process.stderr);
};

export const pid: typeof $childProcess.pid = (process: Deno.ChildProcess) => {
  return process.pid;
};

export const status: typeof $childProcess.status = async (
  process: Deno.ChildProcess,
) => {
  return toCommandStatusType(await process.status);
};

export const output: typeof $childProcess.output = async (
  process: Deno.ChildProcess,
) => {
  return toCommandOutputType(await process.output());
};

export const kill: typeof $childProcess.kill = (
  process: Deno.ChildProcess,
) => {
  return fromThrows(() => process.kill());
};

export const kill_with: typeof $childProcess.kill_with = (
  process: Deno.ChildProcess,
  signal,
) => {
  return fromThrows(() => process.kill(toSignal(signal)));
};

export const ref: typeof $childProcess.ref = (
  process: Deno.ChildProcess,
) => {
  process.ref();
  return process;
};

export const unref: typeof $childProcess.unref = (
  process: Deno.ChildProcess,
) => {
  process.unref();
  return process;
};

export const using_: typeof $childProcess.using = async <T>(
  process: Deno.ChildProcess,
  fun: (process: Deno.ChildProcess) => Promise<T>,
) => {
  await using usedProcess = process;
  return fun(usedProcess);
};
