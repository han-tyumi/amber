pub type MemoryUsage {
  MemoryUsage(
    /// The number of bytes of the current Deno's process resident set size, which is the amount of memory occupied in main memory (RAM).
    ///
    rss: Int,
    /// The total size of the heap for V8, in bytes.
    ///
    heap_total: Int,
    /// The amount of the heap used for V8, in bytes.
    ///
    heap_used: Int,
    /// Memory, in bytes, associated with JavaScript objects outside of the JavaScript isolate.
    ///
    external: Int,
  )
}
