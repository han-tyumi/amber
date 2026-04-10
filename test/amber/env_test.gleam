import amber/env
import gleam/dict
import gleeunit/should

pub fn get_existing_test() {
  // PATH is always set on all platforms.
  env.get("PATH") |> should.be_ok()
}

pub fn get_nonexistent_test() {
  env.get("AMBER_TEST_NONEXISTENT_VAR_12345") |> should.be_error()
}

pub fn set_and_get_test() {
  let key = "AMBER_TEST_SET_GET"
  let value = "test_value"
  let assert Ok(_) = env.set(key, to: value)
  env.get(key) |> should.equal(Ok(value))

  // Clean up.
  let assert Ok(_) = env.delete(key)
}

pub fn delete_test() {
  let key = "AMBER_TEST_DELETE"
  let assert Ok(_) = env.set(key, to: "to_delete")
  let assert Ok(_) = env.delete(key)
  env.get(key) |> should.be_error()
}

pub fn has_test() {
  let key = "AMBER_TEST_HAS"
  env.has(key) |> should.be_false()
  let assert Ok(_) = env.set(key, to: "exists")
  env.has(key) |> should.be_true()

  // Clean up.
  let assert Ok(_) = env.delete(key)
}

pub fn to_dict_test() {
  let key = "AMBER_TEST_TO_DICT"
  let assert Ok(_) = env.set(key, to: "dict_value")
  let env_dict = env.to_dict()
  dict.get(env_dict, key) |> should.equal(Ok("dict_value"))

  // Clean up.
  let assert Ok(_) = env.delete(key)
}
