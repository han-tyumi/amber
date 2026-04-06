import amber/web/promise.{type Promise}
import amber/web/readable_stream/default_controller.{type DefaultController}
import gleam/dynamic.{type Dynamic}

pub type UnderlyingSource(a) {
  Start(fn(DefaultController(a)) -> Nil)
  Pull(fn(DefaultController(a)) -> Promise(Nil))
  Cancel(fn(Dynamic) -> Nil)
}
