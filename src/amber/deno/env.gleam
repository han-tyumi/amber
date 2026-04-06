import gleam/dict.{type Dict}
import gleam/option.{type Option}

@external(javascript, "./env.ffi.mjs", "get")
pub fn get(key: String) -> Option(String)

@external(javascript, "./env.ffi.mjs", "set")
pub fn set(key: String, value: String) -> Nil

@external(javascript, "./env.ffi.mjs", "delete_")
pub fn delete(key: String) -> Nil

@external(javascript, "./env.ffi.mjs", "has")
pub fn has(key: String) -> Bool

@external(javascript, "./env.ffi.mjs", "to_dict")
pub fn to_dict() -> Dict(String, String)
