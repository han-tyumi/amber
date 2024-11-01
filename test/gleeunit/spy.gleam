pub type Spy(f)

@external(javascript, "../spy_ffi.mjs", "new_")
pub fn new(fun: f) -> Result(Spy(f), Nil)

@external(javascript, "../spy_ffi.mjs", "fun")
pub fn fun(spy: Spy(f)) -> f

@external(javascript, "../spy_ffi.mjs", "has_been_called")
pub fn has_been_called(spy: Spy(f)) -> Bool
