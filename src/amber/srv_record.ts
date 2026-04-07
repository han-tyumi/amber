import * as $srvRecord from "$/amber/amber/srv_record.mjs";

export function toSrvRecord(record: Deno.SrvRecord): $srvRecord.SrvRecord$ {
  return $srvRecord.SrvRecord$SrvRecord(
    record.priority,
    record.weight,
    record.port,
    record.target,
  );
}
