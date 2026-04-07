import * as $naptrRecord from "$/amber/amber/deno/naptr_record.mjs";

export function toNaptrRecord(
  record: Deno.NaptrRecord,
): $naptrRecord.NaptrRecord$ {
  return $naptrRecord.NaptrRecord$NaptrRecord(
    record.order,
    record.preference,
    record.flags,
    record.services,
    record.regexp,
    record.replacement,
  );
}
