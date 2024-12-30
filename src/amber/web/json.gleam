import gleam/dict.{type Dict}

pub type Json {
  Null
  Boolean(Bool)
  Number(Float)
  String(String)
  Array(List(Json))
  Object(Dict(String, Json))
}

@external(javascript, "../../amber__web__json.ffi.mjs", "parse")
pub fn parse(text: String) -> Result(Json, String)

@external(javascript, "../../amber__web__json.ffi.mjs", "stringify")
pub fn stringify(json: Json) -> String
