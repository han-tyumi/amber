import amber/tls_certified_key_pem.{type TlsCertifiedKeyPem}

pub type ConnectTlsOption {
  /// A literal IP address or host name that can be resolved to an IP
  /// address.
  ///
  Hostname(String)
  /// A list of root certificates that will be used in addition to the
  /// default root certificates to verify the peer's certificate.
  ///
  /// Must be in PEM format.
  ///
  CaCerts(List(String))
  /// Application-Layer Protocol Negotiation (ALPN) protocols supported by
  /// the client. If not specified, no ALPN extension will be included in
  /// the TLS handshake.
  ///
  AlpnProtocols(List(String))
  /// Key and certificate for mutual TLS (mTLS or client certificates).
  ///
  CertifiedKey(TlsCertifiedKeyPem)
  /// Skip hostname verification against the certificate. The certificate
  /// is still verified against the certificate authority root certificates.
  ///
  UnsafelyDisableHostnameVerification
}
