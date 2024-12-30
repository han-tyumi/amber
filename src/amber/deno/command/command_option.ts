import * as $commandOption from "$/amber/amber/deno/command/command_option.mjs";
import type { List } from "$/prelude.mjs";
import { toStdioOptionType } from "~/amber/deno/stdio_option.ts";
import { CustomTypeOptionsMap } from "~/utils/CustomTypeOptionsMap.ts";
import { toObject } from "~/utils/dict.ts";

const commandOptionsMap = new CustomTypeOptionsMap<Deno.CommandOptions>()
  .set($commandOption.Args, (args) => ({ args: args[0].toArray() }))
  .set($commandOption.Cwd, (cwd) => ({ cwd: cwd[0] }))
  .set($commandOption.ClearEnv, () => ({ clearEnv: true }))
  .set($commandOption.Env, (env) => ({ env: toObject(env[0]) }))
  .set($commandOption.Uid, (uid) => ({ uid: uid[0] }))
  .set($commandOption.Gid, (gid) => ({ gid: gid[0] }))
  .set($commandOption.Signal, (signal) => ({ signal: signal[0] }))
  .set(
    $commandOption.Stdin,
    (stdin) => ({ stdin: toStdioOptionType(stdin[0]) }),
  ).set(
    $commandOption.Stdout,
    (stdout) => ({ stdout: toStdioOptionType(stdout[0]) }),
  ).set(
    $commandOption.Stderr,
    (stderr) => ({ stderr: toStdioOptionType(stderr[0]) }),
  ).set(
    $commandOption.WindowsRawArguments,
    () => ({ windowsRawArguments: true }),
  );

export function toCommandOptions(options: List<$commandOption.CommandOption$>) {
  return commandOptionsMap.customTypeListToOptions(options);
}
