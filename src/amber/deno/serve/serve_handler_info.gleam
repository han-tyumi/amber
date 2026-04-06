import amber/deno/net_addr.{type NetAddr}
import amber/web/promise.{type Promise}

pub type ServeHandlerInfo {
  ServeHandlerInfo(remote_addr: NetAddr, completed: Promise(Nil))
}
