import * as $soaRecord from "$/amber/amber/soa_record.mjs";

export function toSoaRecord(record: Deno.SoaRecord): $soaRecord.SoaRecord$ {
  return $soaRecord.SoaRecord$SoaRecord(
    record.mname,
    record.rname,
    record.serial,
    record.refresh,
    record.retry,
    record.expire,
    record.minimum,
  );
}
