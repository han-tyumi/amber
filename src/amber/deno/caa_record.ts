import * as $caaRecord from "$/amber/amber/deno/caa_record.mjs";

export function toCaaRecord(record: Deno.CaaRecord): $caaRecord.CaaRecord$ {
  return $caaRecord.CaaRecord$CaaRecord(
    record.critical,
    record.tag,
    record.value,
  );
}
