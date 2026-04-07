pub type SystemMemoryInfo {
  SystemMemoryInfo(
    /// Total installed memory in bytes.
    ///
    total: Int,
    /// Unused memory in bytes.
    ///
    free: Int,
    /// Estimation of how much memory, in bytes, is available for starting new
    /// applications, without swapping. Unlike the data provided by the cache or
    /// free fields, this field takes into account page cache and also that not
    /// all reclaimable memory will be reclaimed due to items being in use.
    ///
    available: Int,
    /// Memory used by kernel buffers.
    ///
    buffers: Int,
    /// Memory used by the page cache and slabs.
    ///
    cached: Int,
    /// Total swap memory.
    ///
    swap_total: Int,
    /// Unused swap memory.
    ///
    swap_free: Int,
  )
}
