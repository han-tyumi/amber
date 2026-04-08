pub type SoaRecord {
  SoaRecord(
    /// The domain name of the primary name server for this zone.
    ///
    mname: String,
    /// The email address of the administrator responsible for this zone,
    /// encoded in DNS name format (e.g., "admin.example.com" represents
    /// "admin@example.com").
    ///
    rname: String,
    /// The version number of the original copy of the zone. Incremented
    /// when the zone data changes.
    ///
    serial: Int,
    /// The time interval (in seconds) before the zone should be refreshed
    /// by secondary servers.
    ///
    refresh: Int,
    /// The time interval (in seconds) before a failed refresh should be
    /// retried.
    ///
    retry: Int,
    /// The upper limit (in seconds) on the time interval that can elapse
    /// before the zone is no longer authoritative.
    ///
    expire: Int,
    /// The minimum TTL (in seconds) that should be exported with any
    /// record from this zone.
    ///
    minimum: Int,
  )
}
