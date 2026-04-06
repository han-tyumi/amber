import { CommandStatus$CommandStatus } from "$/amber/amber/deno/command/command_status.mjs";
import * as $option from "$/gleam_stdlib/gleam/option.mjs";
import { toSignalType } from "~/amber/deno/signal.ts";
import { toOption } from "~/utils/option.ts";

export function toCommandStatusType(status: Deno.CommandStatus) {
  return CommandStatus$CommandStatus(
    status.success,
    status.code,
    $option.map(toOption(status.signal), toSignalType),
  );
}
