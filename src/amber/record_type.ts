import * as $recordType from "$/amber/amber/record_type.mjs";

export function toRecordType(
  value: $recordType.RecordType$,
): "A" | "AAAA" | "ANAME" | "CNAME" | "NS" | "PTR" {
  if ($recordType.RecordType$isA(value)) return "A";
  if ($recordType.RecordType$isAaaa(value)) return "AAAA";
  if ($recordType.RecordType$isAname(value)) return "ANAME";
  if ($recordType.RecordType$isCname(value)) return "CNAME";
  if ($recordType.RecordType$isNs(value)) return "NS";
  return "PTR";
}
