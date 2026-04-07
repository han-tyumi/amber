pub type UpgradeWebSocketOption {
  /// Sets the `.protocol` property on the client side web socket to the
  /// value provided here, which should be one of the strings specified in the
  /// `protocols` parameter when requesting the web socket. This is intended
  /// for clients and servers to specify sub-protocols to use to communicate to
  /// each other.
  ///
  Protocol(String)
  /// If the client does not respond to this frame with a `pong` within the
  /// timeout specified, the connection is deemed unhealthy and is closed. The
  /// `close` and `error` event will be emitted.
  ///
  /// The unit is seconds, with a default of 30. Set to `0` to disable
  /// timeouts.
  ///
  IdleTimeout(Int)
}
