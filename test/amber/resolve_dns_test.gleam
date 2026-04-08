import amber
import amber/record_type
import gleeunit/should
import gossamer/promise

pub fn resolve_dns_a_test() {
  use result <- promise.then(amber.resolve_dns("example.com", record_type.A))
  let assert Ok(records) = result
  should.be_true(records != [])
  promise.resolve(Nil)
}

pub fn resolve_dns_aaaa_test() {
  use result <- promise.then(amber.resolve_dns("example.com", record_type.Aaaa))
  let assert Ok(records) = result
  should.be_true(records != [])
  promise.resolve(Nil)
}

pub fn resolve_dns_mx_test() {
  use result <- promise.then(amber.resolve_dns_mx("example.com"))
  let assert Ok(records) = result
  should.be_true(records != [])
  promise.resolve(Nil)
}
