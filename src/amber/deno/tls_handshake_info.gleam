import gleam/option.{type Option}

pub type TlsHandshakeInfo {
  TlsHandshakeInfo(
    /// Contains the ALPN protocol selected during negotiation with the
    /// server. If no ALPN protocol selected, returns `None`.
    ///
    alpn_protocol: Option(String),
  )
}
