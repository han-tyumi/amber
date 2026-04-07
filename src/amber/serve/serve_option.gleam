import amber/net_addr.{type NetAddr}
import gleam/dynamic.{type Dynamic}
import gossamer/abort_signal.{type AbortSignal}
import gossamer/response.{type Response}

pub type ServeOption {
  Port(Int)
  Hostname(String)
  Signal(AbortSignal)
  OnListen(fn(NetAddr) -> Nil)
  OnError(fn(Dynamic) -> Response)
  ReusePort
}
