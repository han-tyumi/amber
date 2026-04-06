import { CommandOutput$CommandOutput } from "$/amber/amber/deno/command/command_output.mjs";
import * as $option from "$/gleam_stdlib/gleam/option.mjs";
import { toSignalType } from "~/amber/deno/signal.ts";
import { toOption } from "~/utils/option.ts";

export function toCommandOutputType(output: Deno.CommandOutput) {
  return CommandOutput$CommandOutput(
    output.stdout,
    output.stderr,
    output.success,
    output.code,
    $option.map(toOption(output.signal), toSignalType),
  );
}
