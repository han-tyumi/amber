import * as $inspectOption from "$/amber/amber/inspect_option.mjs";

export function toInspectOptions(
  options: $inspectOption.InspectOption$[],
): Deno.InspectOptions {
  const result: Deno.InspectOptions = {};
  for (const option of options) {
    if ($inspectOption.InspectOption$isColors(option)) result.colors = true;
    else if ($inspectOption.InspectOption$isCompact(option)) {
      result.compact = $inspectOption.InspectOption$Compact$0(option);
    } else if ($inspectOption.InspectOption$isDepth(option)) {
      result.depth = $inspectOption.InspectOption$Depth$0(option);
    } else if ($inspectOption.InspectOption$isBreakLength(option)) {
      result.breakLength = $inspectOption.InspectOption$BreakLength$0(option);
    } else if ($inspectOption.InspectOption$isEscapeSequences(option)) {
      result.escapeSequences = $inspectOption.InspectOption$EscapeSequences$0(
        option,
      );
    } else if ($inspectOption.InspectOption$isIterableLimit(option)) {
      result.iterableLimit = $inspectOption.InspectOption$IterableLimit$0(
        option,
      );
    } else if ($inspectOption.InspectOption$isShowProxy(option)) {
      result.showProxy = true;
    } else if ($inspectOption.InspectOption$isSorted(option)) {
      result.sorted = true;
    } else if ($inspectOption.InspectOption$isTrailingComma(option)) {
      result.trailingComma = true;
    } else if ($inspectOption.InspectOption$isGetters(option)) {
      result.getters = true;
    } else if ($inspectOption.InspectOption$isShowHidden(option)) {
      result.showHidden = true;
    } else if ($inspectOption.InspectOption$isStrAbbreviateSize(option)) {
      result.strAbbreviateSize = $inspectOption
        .InspectOption$StrAbbreviateSize$0(option);
    }
  }
  return result;
}
