pub type ListenTlsOption {
  /// A literal IP address or host name that can be resolved to an IP
  /// address.
  ///
  Hostname(String)
  /// Application-Layer Protocol Negotiation (ALPN) protocols to announce
  /// to the client. If not specified, no ALPN extension will be included
  /// in the TLS handshake.
  ///
  AlpnProtocols(List(String))
}
