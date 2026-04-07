import * as $mxRecord from "$/amber/amber/mx_record.mjs";

export function toMxRecord(record: Deno.MxRecord): $mxRecord.MxRecord$ {
  return $mxRecord.MxRecord$MxRecord(record.preference, record.exchange);
}
