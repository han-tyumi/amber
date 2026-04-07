/// Provides certified key material from strings. The key material is
/// provided in `PEM`-format (Privacy Enhanced Mail,
/// https://www.rfc-editor.org/rfc/rfc1422) which can be identified by
/// having `-----BEGIN-----` and `-----END-----` markers at the beginning
/// and end of the strings. This type of key is not compatible with
/// `DER`-format keys which are binary.
///
/// Deno supports RSA, EC, and PKCS8-format keys.
///
pub type TlsCertifiedKeyPem {
  TlsCertifiedKeyPem(
    /// Private key in `PEM` format. RSA, EC, and PKCS8-format keys are
    /// supported.
    ///
    key: String,
    /// Certificate chain in `PEM` format.
    ///
    cert: String,
  )
}
