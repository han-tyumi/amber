import amber/error.{type Error}
import amber/net_addr.{type NetAddr}
import gossamer/abort_signal.{type AbortSignal}
import gossamer/response.{type Response}

pub type ServeOption {
  Port(Int)
  Hostname(String)
  /// PEM-encoded TLS certificate for HTTPS.
  ///
  Cert(String)
  /// PEM-encoded TLS private key for HTTPS.
  ///
  Key(String)
  ReusePort
  Signal(AbortSignal)
  OnListen(fn(NetAddr) -> Nil)
  OnError(fn(Error) -> Response)
}
