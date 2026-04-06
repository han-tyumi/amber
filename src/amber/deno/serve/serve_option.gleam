import amber/deno/net_addr.{type NetAddr}
import amber/web/abort_signal.{type AbortSignal}
import amber/web/response.{type Response}
import gleam/dynamic.{type Dynamic}

pub type ServeOption {
  Port(Int)
  Hostname(String)
  Signal(AbortSignal)
  OnListen(fn(NetAddr) -> Nil)
  OnError(fn(Dynamic) -> Response)
  ReusePort
}
