import amber/error.{type Error}
import amber/net_addr.{type NetAddr}
import gossamer/abort_signal.{type AbortSignal}
import gossamer/response.{type Response}

pub type ServeOption {
  Port(Int)
  Hostname(String)
  Signal(AbortSignal)
  OnListen(fn(NetAddr) -> Nil)
  OnError(fn(Error) -> Response)
  ReusePort
}
