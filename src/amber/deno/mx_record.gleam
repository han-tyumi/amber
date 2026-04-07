/// If `deno.resolve_dns_mx` is called, it will return a list of objects
/// with this type.
///
pub type MxRecord {
  MxRecord(
    /// A priority value, which is a relative value compared to the other
    /// preferences of MX records for the domain.
    ///
    preference: Int,
    /// The server that mail should be delivered to.
    ///
    exchange: String,
  )
}
