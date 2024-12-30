import gleam/dict.{type Dict}
import gleam/option.{type Option}

@external(javascript, "../../amber__deno__env.ffi.mjs", "get")
pub fn get(key: String) -> Option(String)

@external(javascript, "../../amber__deno__env.ffi.mjs", "set")
pub fn set(key: String, value: String) -> Nil

@external(javascript, "../../amber__deno__env.ffi.mjs", "delete_")
pub fn delete(key: String) -> Nil

@external(javascript, "../../amber__deno__env.ffi.mjs", "has")
pub fn has(key: String) -> Bool

@external(javascript, "../../amber__deno__env.ffi.mjs", "to_dict")
pub fn to_dict() -> Dict(String, String)
