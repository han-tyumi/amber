/// If `amber.resolve_dns_naptr` is called, it will return a list of
/// objects with this type.
///
pub type NaptrRecord {
  NaptrRecord(
    order: Int,
    preference: Int,
    flags: String,
    services: String,
    regexp: String,
    replacement: String,
  )
}
