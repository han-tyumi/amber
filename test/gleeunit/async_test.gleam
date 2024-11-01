import amber/web/promise.{type Promise}

pub fn run(do: fn(fn() -> Nil) -> Nil) -> Promise(Nil) {
  promise.new(fn(resolve, _reject) { do(fn() { resolve(Nil) }) })
}
