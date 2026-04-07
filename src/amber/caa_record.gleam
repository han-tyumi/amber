/// If `amber.resolve_dns_caa` is called, it will resolve with a list of
/// objects with this type.
///
pub type CaaRecord {
  CaaRecord(
    /// If `true`, indicates that the corresponding property tag must be
    /// understood if the semantics of the CAA record are to be correctly
    /// interpreted by an issuer.
    ///
    /// Issuers must not issue certificates for a domain if the relevant
    /// CAA Resource Record set contains unknown property tags that have
    /// `critical` set.
    ///
    critical: Bool,
    /// A string that represents the identifier of the property
    /// represented by the record.
    ///
    tag: String,
    /// The value associated with the tag.
    ///
    value: String,
  )
}
