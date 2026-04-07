/// If `deno.resolve_dns_soa` is called, it will return a list of objects
/// with this type.
///
pub type SoaRecord {
  SoaRecord(
    mname: String,
    rname: String,
    serial: Int,
    refresh: Int,
    retry: Int,
    expire: Int,
    minimum: Int,
  )
}
