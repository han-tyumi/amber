import amber/web/headers.{type Headers}

/// Options for a `WebSocket` instance. This feature is non-standard.
///
pub type WebSocketOption {
  /// The sub-protocol(s) that the client would like to use, in order of
  /// preference.
  ///
  Protocols(List(String))
  /// The `Headers` to set on the handshake request. This feature is
  /// non-standard.
  ///
  Headers(Headers)
}
