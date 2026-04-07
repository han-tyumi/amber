/// If `amber.resolve_dns_srv` is called, it will return a list of objects
/// with this type.
///
pub type SrvRecord {
  SrvRecord(priority: Int, weight: Int, port: Int, target: String)
}
