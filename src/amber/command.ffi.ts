import type * as $command from "$/amber/amber/command.mjs";
import { toCommandOptions } from "~/amber/command/command_option.ts";
import { toCommandOutputType } from "~/amber/command/command_output.ts";
import { fromThrows } from "~/amber/error.ts";

export type Command$ = Deno.Command;

export const new_: typeof $command.new$ = (command, options) => {
  return new Deno.Command(
    command,
    toCommandOptions(options),
  );
};

export const output_sync: typeof $command.output_sync = (
  command: Deno.Command,
) => {
  return fromThrows(() => toCommandOutputType(command.outputSync()));
};

export const spawn: typeof $command.spawn = (command: Deno.Command) => {
  return command.spawn();
};
