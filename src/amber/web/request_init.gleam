import amber/web/abort_signal.{type AbortSignal}
import amber/web/headers.{type Headers}

pub type RequestInit {
  Method(String)
  Headers(Headers)
  Body(String)
  Redirect(String)
  Signal(AbortSignal)
  Referrer(String)
  Keepalive(Bool)
  Integrity(String)
}
