import * as $commandOption from "$/amber/amber/deno/command/command_option.mjs";
import type { List } from "$/prelude.mjs";
import { toStdioOptionType } from "~/amber/deno/stdio_option.ts";
import { toObject } from "~/utils/dict.ts";
import { toArray } from "~/utils/list.ts";

function toCommandOptionsFromArray(
  options: $commandOption.CommandOption$[],
): Partial<Deno.CommandOptions> {
  const result: Partial<Deno.CommandOptions> = {};
  for (const option of options) {
    if ($commandOption.CommandOption$isArgs(option)) {
      result.args = toArray($commandOption.CommandOption$Args$0(option));
    } else if ($commandOption.CommandOption$isCwd(option)) {
      result.cwd = $commandOption.CommandOption$Cwd$0(option);
    } else if ($commandOption.CommandOption$isClearEnv(option)) {
      result.clearEnv = true;
    } else if ($commandOption.CommandOption$isEnv(option)) {
      result.env = toObject($commandOption.CommandOption$Env$0(option));
    } else if ($commandOption.CommandOption$isUid(option)) {
      result.uid = $commandOption.CommandOption$Uid$0(option);
    } else if ($commandOption.CommandOption$isGid(option)) {
      result.gid = $commandOption.CommandOption$Gid$0(option);
    } else if ($commandOption.CommandOption$isSignal(option)) {
      result.signal = $commandOption.CommandOption$Signal$0(option);
    } else if ($commandOption.CommandOption$isStdin(option)) {
      result.stdin = toStdioOptionType(
        $commandOption.CommandOption$Stdin$0(option),
      );
    } else if ($commandOption.CommandOption$isStdout(option)) {
      result.stdout = toStdioOptionType(
        $commandOption.CommandOption$Stdout$0(option),
      );
    } else if ($commandOption.CommandOption$isStderr(option)) {
      result.stderr = toStdioOptionType(
        $commandOption.CommandOption$Stderr$0(option),
      );
    } else if ($commandOption.CommandOption$isWindowsRawArguments(option)) {
      result.windowsRawArguments = true;
    }
  }
  return result;
}

export function toCommandOptions(
  options: List<$commandOption.CommandOption$>,
): Partial<Deno.CommandOptions> {
  return toCommandOptionsFromArray(toArray(options));
}
