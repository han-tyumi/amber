pub type NaptrRecord {
  NaptrRecord(
    /// The order in which NAPTR records must be processed to ensure the
    /// correct ordering of rules.
    ///
    order: Int,
    /// The preference used to select between NAPTR records with equal
    /// order values. Lower values are preferred.
    ///
    preference: Int,
    /// Flags that control aspects of the rewriting and interpretation of
    /// the fields in the record (e.g., "u", "s", "a", "p").
    ///
    flags: String,
    /// The service(s) available down this rewrite path.
    ///
    services: String,
    /// A regular expression applied to the original string from the
    /// client to construct the next domain name to look up.
    ///
    regexp: String,
    /// The next domain name to query if the `flags` field is empty. Used
    /// as an alternative to the `regexp` field.
    ///
    replacement: String,
  )
}
