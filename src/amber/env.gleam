import amber/error.{type Error}
import gleam/dict.{type Dict}

@external(javascript, "./env.ffi.mjs", "get")
pub fn get(key: String) -> Result(String, Nil)

/// Sets the value of an environment variable. Mutates the process environment.
///
@external(javascript, "./env.ffi.mjs", "set")
pub fn set(key: String, value: String) -> Result(Nil, Error)

/// Deletes an environment variable. Mutates the process environment.
///
@external(javascript, "./env.ffi.mjs", "delete_")
pub fn delete(key: String) -> Result(Nil, Error)

@external(javascript, "./env.ffi.mjs", "has")
pub fn has(key: String) -> Bool

@external(javascript, "./env.ffi.mjs", "to_dict")
pub fn to_dict() -> Dict(String, String)
