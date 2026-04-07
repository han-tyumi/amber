import amber/net_addr.{type NetAddr}
import gossamer/promise.{type Promise}

pub type ServeHandlerInfo {
  ServeHandlerInfo(remote_addr: NetAddr, completed: Promise(Nil))
}
