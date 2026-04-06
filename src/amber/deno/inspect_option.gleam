/// Option which can be specified when performing
/// [`deno.inspect`](../deno.html#inspect).
///
pub type InspectOption {
  /// Stylize output with ANSI colors.
  Colors
  /// Try to fit more than one entry of a collection on the same line.
  Compact(Bool)
  /// Traversal depth for nested objects.
  Depth(Int)
  /// The maximum length for an inspection to take up a single line.
  BreakLength(Int)
  /// Whether or not to escape sequences.
  EscapeSequences(Bool)
  /// The maximum number of iterable entries to print.
  IterableLimit(Int)
  /// Show a Proxy's target and handler.
  ShowProxy
  /// Sort Object, Set and Map entries by key.
  Sorted
  /// Add a trailing comma for multiline collections.
  TrailingComma
  /// Evaluate the result of calling getters.
  Getters
  /// Show an object's non-enumerable properties.
  ShowHidden
  /// The maximum number of characters to print for a string.
  StrAbbreviateSize(Int)
}
